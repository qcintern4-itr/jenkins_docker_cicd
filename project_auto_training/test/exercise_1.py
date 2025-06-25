
def calculate_age(year_of_birth):
    current_year = datetime.now().year
    return current_year - year_of_birth


if __name__ == "__main__":
    # Kiểm tra nếu không có tham số đầu vào
    if len(sys.argv) == 1:
        print("Usage: python exercise_1.py --name <name> --dob <year_of_birth>")
        sys.exit(1)

    # Tạo parser để xử lý tham số
    parser = argparse.ArgumentParser(description="Calculate age based on name and date of birth.")
    parser.add_argument("--name", required=True, help="Your name")
    parser.add_argument("--dob", type=int, required=True, help="Year of birth (e.g., 1995)")
    parser.add_argument("--gender", required=True, help="gender")
    try:
        args = parser.parse_args()
        name = args.name
        dob = args.dob
        gen = args.gender

        age = calculate_age(dob)
        print(f"Name: {name}")
        print(f"Age: {age}")
        print(f"Gender: {gen}")
    except argparse.ArgumentError as e:
        print(f"Error: {e}")
        sys.exit(1)