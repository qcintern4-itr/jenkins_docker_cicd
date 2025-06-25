#!/usr/bin/env python3
import time
import re
from platform import system
from time import sleep

try:
    from project_twitter_portal.lib.WebPage import WebPage
    from project_twitter_portal.config.web_locators import common as locators
    from corelib import Utils
    from datetime import datetime, timedelta
    from selenium.webdriver import Keys
    import pandas as pd
    import os
    import csv
    import time
    from selenium.webdriver.common.by import By
    from selenium.webdriver.common.action_chains import ActionChains
    from selenium.common.exceptions import StaleElementReferenceException, ElementClickInterceptedException, NoSuchElementException, TimeoutException
    from fuzzywuzzy import fuzz
    import sys

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class Common(WebPage):
    """
    Handle login page, left-hand-side main menu
    """
    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators
        self.csv_file = None
        self.search_keywords = []
    def _navigate_to_people_tab(self):
            self.browser.wait_visibility_of_element_located(self.LCT.PEOPLE_TAB, timeout=5)
            self.browser.click(self.LCT.PEOPLE_TAB)
            time.sleep(2)
    def navigate_to_twitter_sign_in_page(self):
        version = 'undetected'
        try:
            self.browser.open_page(self.URL)
            self.browser.wait_visibility_of_element_located(self.LCT.SIGN_IN_BUTTON,timeout=10)
        finally:
            return version

    def load_csv_data(self, csv_file):
        base_path = os.path.dirname(os.path.abspath(__file__))
        relative_path = os.path.normpath(os.path.join(base_path,"..","..", "..", "tmp", csv_file))
        relative_path = relative_path.replace("\\", "/")
        self.csv_file = relative_path
        self.search_keywords = self.read_and_process_csv_file()

    def read_and_process_csv_file(self):
        if not self.csv_file:
            print("CSV file has not been loaded!")
            return []
        df = pd.read_csv(self.csv_file, encoding='utf-8')
        df = df.loc[:, ~df.columns.str.contains('^Unnamed')]
        if "Follow Status" not in df.columns:
            df["Follow Status"] = "Not Processed"
        if "Profile URL" not in df.columns:
            df["Profile URL"] = ""
        header_row = 0
        for i in range(len(df)):
            if "First Name" in df.iloc[i].values:
                header_row = i
                break
        df = pd.read_csv(self.csv_file, encoding='utf-8', header=header_row)
        expected_columns = ["First Name", "Last Name", "URL", "Email Address", "Company", "Position", "Connected On", "Follow Status", "Profile URL"]
        if len(df.columns) < len(expected_columns):
            missing_cols = set(expected_columns) - set(df.columns)
            for col in missing_cols:
                df[col] = ""
        elif len(df.columns) > len(expected_columns):
            df = df[expected_columns]
        df.columns = expected_columns
        df["First Name"] = df["First Name"].astype(str).fillna('').replace("nan", "").str.strip()
        df["Last Name"] = df["Last Name"].astype(str).fillna('').replace("nan", "").str.strip()
        df["Full Name"] = (df["First Name"] + " " + df["Last Name"]).str.strip()
        df = df[df["Full Name"] != ""]
        return df["Full Name"].tolist()

    def search_and_follow(self, output_file):
        """Search each user from CSV on X.com and follow if conditions are met"""
        if not self.search_keywords:
            print("No search keywords found! Please call load_csv_data() first.")
            return

        results = []
        base_path = os.path.dirname(os.path.abspath(__file__))
        output_path = os.path.normpath(os.path.join(base_path, "..", "..", "..", "tmp", output_file))
        output_path = output_path.replace("\\", "/")

        df = pd.read_csv(self.csv_file, encoding='utf-8')
        df["Full Name"] = df["First Name"].astype(str).str.strip() + " " + df["Last Name"].astype(str).str.strip()

        for index, keyword in enumerate(self.search_keywords):
            if keyword.lower() == "nan nan":
                continue

            user_status = "Not Found"
            profile_url = ""
            company_name = df.get("Company", [""])[index]
            user_found = False
            first_user_to_follow = None

            try:
                self.browser.wait_visibility_of_element_located(self.LCT.SEARCH_INPUT)
                self.browser.click(self.LCT.SEARCH_INPUT)
                self.browser.input_text(self.LCT.SEARCH_INPUT, keyword)
                time.sleep(2)

                if not self.browser.wait_visibility_of_element_located(self.LCT.FIRST_RESULT, timeout=10):
                    print(f"No results found: {keyword}")
                    results.append([keyword, user_status, profile_url])
                    continue

                self.browser.click(self.LCT.FIRST_RESULT)
                time.sleep(3)
                self._navigate_to_people_tab()
                users = self.browser.get_elements(self.LCT.LIST_USER) or []

                if users:
                    first_user_to_follow = users[0]

                for user_count in range(len(users)):
                    if user_count >= 5 or user_found:
                        break  # Stop checking if the limit is reached
                    try:
                        time.sleep(2)
                        users = self.browser.get_elements(self.LCT.LIST_USER)
                        if not users:
                            break
                        user = users[user_count]
                        username_element = user.find_element(By.XPATH, self.LCT.VERIFY_USERNAME)
                        username = username_element.text.strip().lower()
                        match_score = fuzz.ratio(username, keyword.lower())
                        print(f"Checking {username} (Score: {match_score})")
                        if match_score >= 80:
                            print(f"Clicking on user {user_count + 1}: {username}")
                            time.sleep(2)
                            self.browser.execute_script("arguments[0].click();", user)
                        try:
                            self.browser.wait_visibility_of_element_located(self.LCT.BIO_BUTTON)
                            bio_element = self.browser.get_element(self.LCT.BIO_BUTTON)
                            bio_text = self.browser.get_inner_text(bio_element).strip().lower() if bio_element else ""
                        except TimeoutException:
                            print(f"User {username} has no Bio. Skipping...")
                            bio_text = ""
                        if not bio_text.strip() or company_name.lower() not in bio_text.lower():
                            self.browser.wait_visibility_of_element_located(self.LCT.BACK_BUTTON)
                            self.browser.click(self.LCT.BACK_BUTTON)
                            time.sleep(3)
                            continue
                        if company_name.lower() in bio_text:
                            if self.browser.get_element(self.LCT.FOLLOWING_BUTTON):
                                user_status = "Followed"
                            else:
                                follow_button = self.browser.get_element(self.LCT.FOLLOW_BUTTON)
                                if follow_button:
                                    self.browser.click(self.LCT.FOLLOW_BUTTON)
                                    user_status = "Followed"
                                    sleep(5)
                            profile_url = self.browser.driver.current_url
                            user_found = True
                            break

                    except StaleElementReferenceException:
                        print(f"Stale element encountered, retrying for: {keyword}")
                        continue
                    except Exception as e:
                        print(f"Error processing user: {e}")
                        continue
                if not user_found and first_user_to_follow:
                    print(f"Checked 5 users, none matched. Following the first user in LIST_USER.")
                    try:
                        # self.browser.wait_visibility_of_element_located(self.LCT.BACK_BUTTON)
                        # self.browser.click(self.LCT.BACK_BUTTON)
                        # time.sleep(3)
                        self.browser.wait_visibility_of_element_located(self.LCT.FIRST_USER)
                        self.browser.click(self.LCT.FIRST_USER)
                        if self.browser.get_element(self.LCT.FOLLOWING_BUTTON):
                            user_status = "Followed"
                        else:
                            follow_button = self.browser.get_element(self.LCT.FOLLOW_BUTTON)
                            if follow_button:
                                self.browser.click(self.LCT.FOLLOW_BUTTON)
                                user_status = "Followed"
                                sleep(5)
                        profile_url = self.browser.driver.current_url
                    except Exception as e:
                        print(f"Failed to follow first user in LIST_USER: {e}")

                results.append([keyword, user_status, profile_url])

            except Exception as e:
                print(f"Error while searching '{keyword}': {e}")
                continue

        df = pd.read_csv(self.csv_file, encoding='utf-8')
        df = df.dropna(subset=["First Name", "Last Name"], how="all").reset_index(drop=True)

        if "Follow Status" not in df.columns:
            df["Follow Status"] = "Not Processed"
        if "Profile URL" not in df.columns:
            df["Profile URL"] = ""

        for i, row in df.iterrows():
            full_name = str(row["First Name"]).strip() + " " + str(row["Last Name"]).strip()
            for result in results:
                if full_name.lower() == result[0].lower():
                    df.at[i, "Follow Status"] = str(result[1])
                    df.at[i, "Profile URL"] = str(result[2])

        df.to_csv(output_path, index=False, encoding='utf-8')
        print(f"Results have been saved at {output_path}")

    def send_message_to_following(self, message):
        """Access the profiles of your followers and send automated messages"""
        df = pd.read_csv(self.csv_file, encoding='utf-8')

        if "Follow Status" not in df.columns or "Profile URL" not in df.columns:
            print(" CSV file does not have Follow Status or Profile URL information!")
            return

        followed_users = df[df["Follow Status"] == "Followed"]

        for index, row in followed_users.iterrows():
            profile_url = row["Profile URL"].strip()
            if not profile_url or profile_url == "Not Found":
                continue

            try:
                self.browser.driver.get(profile_url)
                time.sleep(3)
                if not self.browser.wait_visibility_of_element_located(self.LCT.MESSAGE_BUTTON):
                    print(f" Cannot send messages to {row['First Name']} {row['Last Name']},skip.")
                    continue
                if self.browser.wait_visibility_of_element_located(self.LCT.X_PREMIUM_POPUP):
                    print(f" User {row['First Name']} {row['Last Name']} X Premium required for messaging, ignore.")
                    continue
                self.browser.wait_visibility_of_element_located(self.LCT.MESSAGE_BUTTON)
                self.browser.click(self.LCT.MESSAGE_BUTTON)
                time.sleep(2)
                self.browser.wait_visibility_of_element_located(self.LCT.MESSAGE_TEXTAREA)
                self.browser.input_text(self.LCT.MESSAGE_TEXTAREA, message)
                time.sleep(1)
                self.browser.click(self.LCT.SEND_BUTTON)
                time.sleep(2)
                print(f" Message sent to {row['First Name']} {row['Last Name']}")
            except NoSuchElementException:
                print(f"Required element not found, skipping {row['First Name']} {row['Last Name']}")
                continue
            except Exception as e:
                print(f"Unable to send message to {row['First Name']} {row['Last Name']}: {e}")



