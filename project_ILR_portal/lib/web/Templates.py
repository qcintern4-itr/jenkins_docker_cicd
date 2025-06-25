#!/usr/bin/env python3

try:
    from project_cardiac_portal.lib.WebPage import WebPage
    from project_cardiac_portal.config.web_locators import templates as locators
    from corelib import Utils
    import re
    from selenium.webdriver import Keys

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class Templates(WebPage):
    """
    Handle Templates page
    """
    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators

    # expand or collapse vertical template menu
    def toggle_template_menu(self, facility, expand_or_collapse):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.MT_TEMPLATE_MENUS)
        value = {
            'expand': 'right',
            'collapse': 'down'
        }[expand_or_collapse]
        if facility not in self.browser.get_texts(self.LCT.MT_TEMPLATE_MENUS):
            raise Exception(f'Item `{facility}` not found.')
        for f_check, f_click in zip(self.browser.get_texts(self.LCT.MT_TEMPLATE_MENUS),
                                    self.browser.get_elements(self.LCT.MT_TEMPLATE_MENUS + '//span[@aria-label]')):
            if f_check.lower() == facility.lower():
                if value in self.browser.get_attribute_value(f_click, 'aria-label'):
                    self.browser.click(f_click, is_scroll=True)

    def expand_template_menu(self, facility):
        self.toggle_template_menu(facility, 'expand')

    def collapse_template_menu(self, facility):
        self.toggle_template_menu(facility, 'collapse')

    def view_template_details_on(self, template_path):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.MT_TEMPLATE_MENUS)
        facility_item, template_item = Utils.parse_key_value(template_path, '>')
        if not template_item:
            self.browser.clicks(self.LCT.MT_TEMPLATE_MENUS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == template_item.lower(),
                                stop_on_first=True)
            return
        self.expand_template_menu(facility_item)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.MT_TEMPLATE_SUBMENUS)
        menu_element = self.browser.get_elements_by_condition(
            self.LCT.MT_TEMPLATE_MENUS + '/..',  # upper element
            on_elements=lambda _, e: self.browser.get_text(e).lower().startswith(facility_item.lower()),
            stop_on_first=True
        )[0]
        child_element = [element for element in self.browser.get_child_elements(
            menu_element, self.LCT.MT_TEMPLATE_SUBMENUS) if
                         self.browser.get_text(element).lower() == template_item.lower()][0]
        self.browser.click(child_element, is_scroll=True)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.MT_DATA_TEMPLATEHEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.MT_DATA_TEMPLATECONTENT)

    def get_templates(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.MT_TEMPLATE_MENUS)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.MT_TEMPLATE_SUBMENUS)
        output = []
        for root_element, facility in zip(self.browser.get_elements(self.LCT.MT_TEMPLATE_MENUS + '/..'),
                                          self.browser.get_texts(self.LCT.MT_TEMPLATE_MENUS)):
            self.expand_template_menu(facility)
            value = self.browser.get_text(root_element)
            output.append(value)
        output = {ls.split('\n')[0]: ls.split('\n')[1::] for ls in output}
        return output

    def get_template_details(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.MT_DATA_TEMPLATEHEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.MT_DATA_TEMPLATECONTENT)
        header = ['Template title']
        header += self.browser.get_texts(self.LCT.MT_DATA_TEMPLATEHEADER)
        content = [self.browser.get_text(
            self.LCT.MT_DATA_TEMPLATEHEADER + '/../../../..//div[contains(@class, "right-header-wrapper-title")]')]
        content += self.browser.get_texts(self.LCT.MT_DATA_TEMPLATECONTENT)
        return Utils.group_tabular_data(header,
                                        [re.sub('•', '', c).strip().replace('\n', ', ').replace('  ', ' ') for c in
                                         content], row=1)

    # select facilities on dialog
    def _select_facilities(self, facilities=None):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.NT_FACILITY_OPTIONS)
        if facilities:
            _facility_names = [fns.strip() for fns in facilities.split(',')] if isinstance(facilities,
                                                                                           str) else facilities
            for e_checkbox, e_facility in zip(self.browser.get_elements(self.LCT.NT_FACILITY_CHECKBOXOPTIONS),
                                              self.browser.get_elements(self.LCT.NT_FACILITY_OPTIONS)):
                if self.browser.get_text(e_facility).lower() not in [e.lower() for e in _facility_names]:
                    self.browser.toggle_checkbox(e_checkbox, e_facility, value=False)
                else:
                    self.browser.toggle_checkbox(e_checkbox, e_facility, value=True)
        self.browser.click(self.LCT.NT_CREATETEMPLATE)

    # select facilities and open create new
    def open_new_template(self, facilities=None):
        if self.browser.wait_visibility_of_element_located(self.LCT.MT_CREATENEWTEMPLATE1):
            self.browser.click(self.LCT.MT_CREATENEWTEMPLATE1)
        else:
            self.browser.click(self.LCT.MT_CREATENEWTEMPLATE2)
        self._select_facilities(facilities)

    def _add_medication(self, medication_name=None, quantity=None, unit=None, frequency=None, time_to_take=None,
                        note=None, prescribed_date=None, add_medication=True):
        if medication_name:
            self.browser.input_text(self.LCT.NT_ADDMEDI_NAME, medication_name)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.NT_ADDMEDI_NAME_OPTIONS)
            self.browser.get_element(self.LCT.NT_ADDMEDI_NAME).send_keys(Keys.ENTER)
        if quantity:
            self.browser.input_text(self.LCT.NT_ADDMEDI_QUANTITY, quantity)
        if unit:
            self.browser.input_text(self.LCT.NT_ADDMEDI_UNIT, unit)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.NT_ADDMEDI_UNIT_OPTIONS)
            self.browser.get_element(self.LCT.NT_ADDMEDI_UNIT).send_keys(Keys.ENTER)
        if frequency:
            self.browser.input_text(self.LCT.NT_ADDMEDI_FREQUENCY, frequency)
            self.browser.get_element(self.LCT.NT_ADDMEDI_FREQUENCY).send_keys(Keys.ENTER)
        if time_to_take:
            if isinstance(time_to_take, str):
                _time_to_takes = [t3.strip() for t3 in time_to_take.split(',')]
            else:  # list
                _time_to_takes = time_to_take
            for element, ttt in zip(self.browser.get_elements(self.LCT.NT_ADDMEDI_TIMETOTAKE),
                                    _time_to_takes):
                self.browser.input_text(element, ttt)
                element.send_keys(Keys.ENTER)
        if note:
            self.browser.input_text(self.LCT.NT_ADDMEDI_NOTE, note)
        if prescribed_date:
            if prescribed_date.lower() == 'today':
                self.browser.click(self.LCT.NT_ADDMEDI_PRESCRIBEDATE + '/..')
                self.browser.wait_visibility_of_element_located(self.LCT.NT_ADDMEDI_PRESCRIBEDATE_TODAY)
                self.browser.click(self.LCT.NT_ADDMEDI_PRESCRIBEDATE_TODAY)
            else:
                self.browser.remove_attribute(self.LCT.NT_ADDMEDI_PRESCRIBEDATE, 'readonly')
                self.browser.input_text(self.LCT.NT_ADDMEDI_PRESCRIBEDATE, prescribed_date)
                self.browser.get_element(self.LCT.NT_ADDMEDI_PRESCRIBEDATE).send_keys(Keys.ENTER)
        if add_medication:
            self.browser.scroll_into_view(self.LCT.NT_CREATE)
            self.browser.click(self.LCT.NT_ADDMEDI_ADDBUTTON)

    def create_new_template(self, template_title=None, current_symptoms=None, past_medicals=None, medications=None,
                            answers=None, is_create=True):
        if template_title:
            self.browser.input_text(self.LCT.NT_TEMPLATETITLE, template_title)
        if current_symptoms:
            _symptoms = [s.strip() for s in current_symptoms.split(',')] if isinstance(current_symptoms,
                                                                                       str) else current_symptoms
            self.browser.click(self.LCT.NT_CURRENTSYMPTOMS)
            for medical in _symptoms:
                self.browser.wait_visibility_of_all_elements_located(self.LCT.NT_CURRENTSYMPTOMS_OPTIONS)
                self.browser.clicks(self.LCT.NT_CURRENTSYMPTOMS_OPTIONS, is_scroll=True,
                                    on_elements=lambda _, e: self.browser.execute_script(
                                        'return arguments[0].textContent', e).lower() == medical.lower(),
                                    stop_on_first=True)
        if past_medicals:
            _medicals = [p.strip() for p in past_medicals.split(',')] if isinstance(
                past_medicals, str) else past_medicals
            for medical in _medicals:
                self.browser.input_text(self.LCT.NT_PASTMEDICAL, medical)
                self.browser.wait_visibility_of_all_elements_located(self.LCT.NT_PASTMEDICAL_OPTIONS)
                if medical.lower() in [pm.lower() for pm in self.browser.get_texts(self.LCT.NT_PASTMEDICAL_OPTIONS)]:
                    self.browser.clicks(self.LCT.NT_PASTMEDICAL_OPTIONS,
                                        on_elements=lambda _, e: self.browser.get_text(e).lower() == medical.lower(),
                                        stop_on_first=True)
                else:
                    self.browser.click(self.LCT.NT_PASTMEDICAL_OPTIONS + '[1]')
        if medications:
            if isinstance(medications, dict):
                self._add_medication(**medications)
            else:  # list
                [self._add_medication(**medication_dict) for medication_dict in medications]
        if answers:
            pass
        if is_create:
            self.browser.click(self.LCT.NT_CREATE, is_scroll=True)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.MT_TEMPLATE_MENUS)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.MT_TEMPLATE_SUBMENUS)

    def _delete_current_symptoms(self, current_symptoms):  # some records are invisible, perform js click
        _symptoms = [e.strip() for e in current_symptoms.split(',')] if isinstance(
            current_symptoms, str) else current_symptoms
        if 'all' in _symptoms:  # Delete all
            [self.browser.click(e) for e in self.browser.get_elements(
                self.LCT.ET_EXISTINGCURRENTSYMPTOMS + '//span[contains(@class, "item-remove")]')[::-1]]
        else:  # Delete a list or one
            for symptom in _symptoms:
                # raise ec if not found
                if symptom.lower() not in [e.lower() for e in self.browser.get_texts(
                        self.LCT.ET_EXISTINGCURRENTSYMPTOMS)]:
                    raise Exception(f'Item `{symptom}` not found.')
                for index, spt in enumerate(
                        [e for e in self.browser.get_texts(self.LCT.ET_EXISTINGCURRENTSYMPTOMS)]):
                    if symptom.lower() == spt.lower():
                        self.browser.clicks(
                            self.LCT.ET_EXISTINGCURRENTSYMPTOMS + '//span[contains(@class, "item-remove")]',
                            on_elements=lambda i, _: i == index, stop_on_first=True)

    def _delete_past_medical_histories(self, past_medicals):
        _medicals = [m.strip() for m in past_medicals.split(',')] if isinstance(past_medicals, str) else past_medicals
        if 'all' in _medicals:  # Delete all
            for me_value, me_click in zip(self.browser.get_elements(self.LCT.ET_EXISTINGPASTMEDICALS)[::-1],
                                          self.browser.get_elements(self.LCT.ET_EXISTINGPASTMEDICALS + '//button')[
                                          ::-1]):
                self.browser.hover_to(me_value, is_scroll=True)
                self.browser.wait_visibility_of(me_click)
                self.browser.click(me_click)
        else:  # Delete one or more (list)
            for p_medical in _medicals:
                # Raise ec if not found
                if p_medical.lower() not in [e.lower() for e in
                                             self.browser.get_texts(self.LCT.ET_EXISTINGPASTMEDICALS)]:
                    raise Exception(f'Item `{p_medical}` not found.')
                for me_value, me_click in zip(self.browser.get_elements(self.LCT.ET_EXISTINGPASTMEDICALS)[::-1],
                                              self.browser.get_elements(self.LCT.ET_EXISTINGPASTMEDICALS + '//button')[
                                              ::-1]):
                    if p_medical.lower() == self.browser.get_text(me_value).lower():
                        self.browser.hover_to(me_value, is_scroll=True)
                        self.browser.wait_visibility_of(me_click)
                        self.browser.click(me_click)

    def _del_medications(self, medications):
        _medication = [m.strip() for m in medications.split(',')] if isinstance(medications, str) else medications
        if 'all' in medications:
            [self.browser.click(e) for e in
             self.browser.get_elements(self.LCT.ET_EXISTINGMEDICATIONS + '//button')[::-1]]
        else:
            for m in _medication:
                if m.lower() not in [e.lower() for e in self.browser.get_texts(self.LCT.ET_EXISTINGMEDICATIONS)]:
                    raise Exception(f'Item `{m}` not found.')
                for m_value, m_click in zip(self.browser.get_elements(self.LCT.ET_EXISTINGMEDICATIONS)[::-1],
                                            self.browser.get_elements(self.LCT.ET_EXISTINGMEDICATIONS + '//button')[
                                            ::-1]):
                    if m.lower() == self.browser.get_text(m_value).lower():
                        self.browser.wait_visibility_of(m_click)
                        self.browser.click(m_click)

    def edit_template(self, template_title=None, del_current_symptoms=None, add_current_symptoms=None,
                      del_past_medicals=None, add_past_medicals=None, del_medications=None, add_medications=None,
                      answers=None, is_save=True):
        self.browser.click(self.LCT.MT_EDIT)
        if template_title:
            self.browser.input_text(self.LCT.ET_TITLE, template_title)
        if del_current_symptoms:
            self._delete_current_symptoms(del_current_symptoms)
        if add_current_symptoms:
            _symptoms = [e.strip() for e in add_current_symptoms.split(',')] if isinstance(
                add_current_symptoms, str) else add_current_symptoms
            for symptom in _symptoms:
                self.browser.click(self.LCT.ET_CURRENTSYMPTOMS)
                self.browser.wait_visibility_of_all_elements_located(self.LCT.ET_CURRENTSYMPTOMS_OPTIONS)
                self.browser.clicks(self.LCT.ET_CURRENTSYMPTOMS_OPTIONS,
                                    on_elements=lambda _, e: self.browser.get_text(e).lower() == symptom.lower(),
                                    stop_on_first=True)
        if del_past_medicals:
            self._delete_past_medical_histories(del_past_medicals)
        if add_past_medicals:
            _medicals = [me.strip() for me in add_past_medicals.split(',')] if isinstance(
                add_past_medicals, str) else add_past_medicals
            for medical in _medicals:
                self.browser.input_text(self.LCT.ET_PASTMEDICAL, medical)
                self.browser.wait_visibility_of_all_elements_located(self.LCT.ET_PASTMEDICAL_OPTIONS)
                if medical.lower() in [pm.lower() for pm in self.browser.get_texts(self.LCT.ET_PASTMEDICAL_OPTIONS)]:
                    self.browser.clicks(self.LCT.ET_PASTMEDICAL_OPTIONS,
                                        on_elements=lambda _, e: self.browser.get_text(e).lower() == medical.lower(),
                                        stop_on_first=True)
                elif medical.lower() not in [pm.lower() for pm in self.browser.get_texts(
                        self.LCT.ET_PASTMEDICAL_OPTIONS)]:  # item not exist
                    self.browser.click(self.LCT.ET_PASTMEDICAL_OPTIONS + '[1]')
        if del_medications:
            self._del_medications(del_medications)
        if add_medications:
            if isinstance(add_medications, dict):
                self._add_medication(**add_medications)
            elif isinstance(add_medications, list):
                [self._add_medication(**medication_dict) for medication_dict in add_medications]
        if answers:
            pass
        if is_save:
            self.browser.click(self.LCT.ET_SAVE)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.MT_TEMPLATE_MENUS)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.MT_TEMPLATE_SUBMENUS)

    def duplicate_template_on(self, template_path, facilities=None, is_duplicate=True):
        if template_path:
            self.view_template_details_on(template_path=template_path)
            self.browser.click(self.LCT.MT_DUPLICATE)
            self._select_facilities(facilities=facilities)
        if is_duplicate:
            self.browser.click(self.LCT.DUP_DUPLECATETEMPLATE)
        self.browser.refresh_page()
        self.browser.wait_visibility_of_all_elements_located(self.LCT.MT_TEMPLATE_MENUS)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.MT_TEMPLATE_SUBMENUS)

    def delete_template_on(self, template_path, is_delete=True):
        if template_path:
            self.view_template_details_on(template_path=template_path)
            self.browser.click(self.LCT.MT_DELETE)
        if is_delete:
            self.browser.click(self.LCT.DEL_YES)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.MT_TEMPLATE_MENUS)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.MT_TEMPLATE_SUBMENUS)
