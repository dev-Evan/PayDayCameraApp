class AppString {
  AppString._();

  // Apps url here
  static String BASE_URL = "https://payday.api.php8.gainhq.com/api";
  static String LOG_IN = "/login";
  static String LOG_OUT = "/logout";
  static String PUNCH_IN = "/attendance/punch-in";
  static String PUNCH_OUT = "/attendance/punch-out";
  static String CHECK_PUNCH_IN = "/attendance/check-is-punch-in";
  static String DAILY_LOG = "/attendance/daily-log";
  static String LOG_DETAILS = "/attendance/details";
  static String ATTENDANCE_REQUEST = "/attendance/request";
  static String CHANGE_LOG = "/attendance/log";
  static String DOCUMENT_LIST = "/document/index";
  static String JOB_HISTORY = "/employee/job-history";
  static String DELETED_ADDRESS = "/employee/address-delete";
  static String USER_PROFILE = "/user/profile";
  static String SUMMARY_ALL_LOG = "/attendance/summaries-data-logs?";
  static String DETAILS_SUMMARY = "/attendance/details-summary?";
  static String REQUEST_ATTENDANCE = "/attendance/add-request";
  static String ATTENDANCE_STATUS = "/status?type=attendance";
  static String ADDRESS_UPDATE = "/employee/address-update";
  static String EMPLOYEE_ADDRESS = "/employee/addresses";
  static String USER_CHANGE_PASSWORD = "/user/change-password";
  static String ADDRESS_DETAILS = "/employee/addresses";
  static String BASIC_INFO = "/basic-information";
  static String UPDATE_PROFILE_DATA = "/user/profile/update";
  static String DOCUMENT_UPLOAD = "/document/store";
  static String DOCUMENT_STORE = "/document/index";
  static String UPDATE_DOCUMENT = "/document/update";
  static String PAYSLIP_LIST = "/payroll/payslip-list";
  static String POST = "POST";
  static String PAYSLIP_SUMMARY = "/payroll/payslip-summary";
  static String PAYSLIP_VIEW = "/payroll/payslip/";
  static String RESET_PASSWORD = "/password-reset";
  static String PAYSLIP_DOWNLOAD = "/payroll/payslip/pdf/";
  static String PAYRUN_BADGE = "/payroll/payrun-and-badge";
  static String DELETED_DOCUMENT = "/document/delete";
  static String USER_CHANGE_PICTURE = "/user/change-picture";
  static String SALARY_OVERVIEW = "/employee/salary-overview";
  static String LOG_SUMMARY_BY_THIS_MONTH =
      "/attendance/summary?within=thisMonth";
  static String LOG_SUMMARY_BY_THIS_YEAR =
      "/attendance/summary?within=thisYear";
  static String LEAVE_ALLOWANCE = "/leave/allowance";
  static String LEAVE_SUMMARY = "/leave/summary";
  static String LEAVE_RECORD = "/leave/record?per_page=50";
  static String LEAVE_TYPE = "/leave/type";
  static String INDIVIDUAL_DATE_LEAVE = "/leave/list/view";
  static String LEAVE_DETAILS = "/leave/log";
  static String CANCEL_LEAVE = "/leave/cancel";
  static String REQUEST_LEAVE = "/leave/store";
  static String ALL_NOTIFICATION = "/notifications";
  static String ALL_UNREAD_NOTIFICATION = "/notifications?unread=true";
  static String NOTIFICATION_AS_READ = "/notification/read";
  static String NOTIFICATION_AS_ALL_READ = "/notification/all/read";
  static String EMPLOYEE_BANK_INFORMATION = "/employee/bank-information";

  // Apps string here
  static const String exampleText = "";
  static const String text_in = "In";
  static const String text_out = "Out";
  static const String text_total = "Total";
  static const String text_month = "Month";
  static const String text_year = "Year";
  static const String text_yes = "Yes";
  static const String text_no = "No";
  static const String text_error = "Error!";
  static const String notification = "Notification";
  static const String text_log_out = "Log Out";
  static const String text_all_logs = "All Logs";
  static const String text_summary = "Summary";
  static const String text_deleted = "Delete";
  static const String text_balance = "Balance";
  static const String textCustom = "Custom";
  static const String textMonth = "This Month";
  static const String textYear = "This Year";
  static const String text_filter = "Filter";
  static const String mark_read = "Mark as Read";
  static const String select_leave_type = "Select Leave Type";
  static const String text_select_time_range = "Select Time Range";
  static const String text_leave_status = "Leave Status";
  static const String text_leave_duration = "Leave Duration";
  static const String text_approved = "Approved";
  static const String text_duration = "Duration";
  static const String text_pending = "Pending";
  static const String text_rejected = "Rejected";
  static const String text_rejection = "Rejection";
  static const String text_hours = "Hours";
  static const String text_add_note_here = "Add Note Here";
  static const String text_note = "Note";
  static const String text_single_day = "Single Day";
  static const String text_multi_day = "Multi Day";
  static const String text_first_half = "First Half";
  static const String text_last_half = "Last Half";
  static const String text_are_you_sure = "Are you sure?";
  static const String text_export_attendance = "Export Attendance?";
  static const String text_dialog_dec = "If you do this, you cannot turn back";
  static const String text_dialog_dec_pdf = "December Attendance.pdf";

  static String error_text = "Something went wrong! Please try again";
  static String text_reload = "Reload";
  static String text_change_log = "Change Log";
  static String text_start_time = "Start Time";
  static String text_end_time = "End Time";
  static String text_skip = "Skip";
  static String text_please_selected_date = "Please selected date";
  static String text_please_selected_document = "Please selected document";
  static String text_field_is_requird = "Field is required !";
  static String text_document_name_is_required = "Document name is required !";
  static String text_alert = "Alert";
  static String text_next = "Next";
  static String text_search = "Search";
  static String text_leave_type = "Leave Type";
  static String text_search_typing_to_search = "Start typing to search";
  static String text_notications = "Notifications";

  static const String text_attendance_status = "Attendance Status";
  static const String text_entry_type = "Entry Type";
  static const String text_attendance_behavior = "Attendance Behavior";
  static const String text_single = "Single";
  static const String text_multi = "Multi";
  static const String text_bank_name = "Bank Name";
  static const String text_early = "Early";
  static const String text_no_document_found = "No Document Found";
  static const String text_regular = "Regular";
  static String text_scheduled = "Scheduled";
  static String text_remaining = "Remaining";
  static String text_change_file = "Change file";
  static String text_overtime = "Overtime";
  static String text_remember_me = "Remember me";
  static String text_forgot_password = "Forgot password?";
  static String text_log_in = "Log In";
  static String text_attendance = "Attendance";
  static String text_leave = "Leave";
  static String text_payslip = "Payslip";
  static String text_more = "More";
  static String text_today = "Today";
  static String text_enter_phone_number = "Enter phone number";
  static String text_enter = "Enter";
  static String text_this_week = "This Week";
  static String text_last_week = "Last Week";
  static String text_last_month = "Last Month";
  static String text_last_year = "Last Year";
  static String text_leave_response = "Leave Response";
  static String text_requstAttendance = "Request Attendance";
  static String text_attendance_log = "Attendance Logs";
  static String todays_log = "Today’s logs";
  static String start_out_day = "Ready to start your day?";
  static String note_text = "Note (optional)";
  static String text_cancel = "Cancel";
  static String text_log_details = "Log Details";
  static String text_punch_in = "Punch In";
  static String text_punch_out = "Punch Out";
  static String text_my_location = "My Location";
  static String text_ip_address = "IP Address";
  static String text_edit = "Edit";
  static String text_edit_attendance = "Edit Attendance";
  static String text_save = "Save";
  static String text_no_data_found = "No data found !";
  static String text_in_time = "In Time";
  static String text_out_time = "Out Time";
  static String text_select_time = "Select Time";
  static const String onboardTileMainAttend = 'Maintain\nAttendance';
  static const String onboardTileEasy = 'Easy\nLeave apply';
  static const String onboardTileReceivePay = 'Receive\nPayments';
  static const String onboardTileMainAttendDes =
      'Manage your daily attendance, keep track of your goal and easily request for a new log or changing the existing log data. ';
  static const String onboardTileEasyDes =
      'Apply leave at ease, keep track of the leave records and stay updated on the paid and unpaid leave balance.';
  static const String onboardTileReceivePayDes =
      'Receive your payslips, keep track of the payment data and stay updated on the payday details.';
  static String text_punch_in_note = 'Punch In Note';
  static String text_punch_out_note = 'Punch Out Note';
  static String text_request_attendance = 'Request Attendance';
  static String text_request = 'Request';
  static String text_date = 'Date';
  static String text_select_date = 'Select Date';

  // Leave modules string here
  static const String text_leve_records = "Leve Records";
  static const String text_availability = "Availability";
  static const String text_taken = "Taken";
  static const String text_casual = "Casual";
  static const String text_sick = "Sick";
  static const String text_paid_sick = "Paid Sick";
  static const String text_apply_leve = "Apply Leave";
  static const String text_apply = "Apply";
  static const String text_leave_records = "Leave Records";
  static const String text_upcomming = "Upcoming";
  static const String text_singleDay = "Single Day";
  static const String text_multiday = "Multi Day";
  static const String text_attendance_duration = "Attendance Duration";
  static const String text_leave_details = "Leave Details";
  static const String text_3_hour = "3 hours";
  static const String text_two_attachments = "Two Attachments";
  static const String text_paid_casual = "Paid Casual";
  static const String text_two_attachment = "Two Attachments";
  static const String text_cancel_leave = "Cancel Leave";
  static const String text_log_response = "Log Response";
  static const String text_leve_note = "Leave note";
  static const String text_half_day = "Half Day";
  static const String text_start_day = "Start Day";
  static const String text_end_day = "End Day";
  static const String text_interval = "Interval";
  static const String text_last = "Last";
  static const String text_first = "First";

  static const String text_enter_first_name = "Enter first name";
  static const String text_enter_last_name = "Enter last name";
  static const String text_enter_email = "Enter email";
  static const String text_not_added_yet = "Not added yet";
  static const String text_add_about_me_here = "Add about me here";



  static const String text_if_any = "(if any)";
  static const String text_attachments = "Attachments";
  static const String text_add_reason_note_here = "Add reason note here";

  //PaySlip modules string here

  static const String text_paid = "Paid";
  static const String text_unpaid = "Unpaid";
  static const String text_unpaid_casual = "Unpaid Casual";
  static const String text_unpaid_sick = "Unpaid Sick";
  static const String text_conflicted = "Conflicted";
  static const String text_sent = "Sent";
  static const String text_payslip_for = "Payslip for";
  static const String text_create_at = "Create at";
  static const String text_beneficiary = "Beneficiary";
  static const String text_allowances = "Allowances";
  static const String text_bonus = "Bonus";
  static const String text_medical = "Medical";
  static const String text_food_ = "Food";
  static const String text_percent = " 2\%";
  static const String text_transport = "Transport";
  static const String text_deductions = "Deductions";
  static const String text_tax = "Tax";
  static const String text_total_summary = "Total Summary";
  static const String text_download_payslip = "Download Payslip";
  static String text_payrun_details = "Payrun Details";
  static String text_period = "Period";
  static String text_consider_type = "Consider Type";
  static String text_monthly = "Monthly";
  static String text_no_included = "N/A";
  static String text_hour = "Hour";
  static String text_2 = "2";
  static String text_included = "Included";
  static String text_button_button = "Bottom Button!";
  static String text_Enter_phone_number = "Enter phone Number";
  static String text_enter_area = "Enter area";
  static String text_enter_city = "Enter city";
  static String text_enter_state = "Enter state";
  static String text_enter_zip_code = "Enter zip code";
  static String text_enter_address = "Enter zip address";
  static String text_add_address = "Add Address";

  // More modules
  static const String text_user_name = "Steve Roggers";
  static const String text_user_email = "steave@gain.media";
  static const String text_active = "Active";
  static const String text_view_profile = "View Profile";
  static const String text_job_desk = "Job Desk";
  static const String text_documents = "Documents";
  static const String text_my_profile = "My profile";
  static const String text_total_file = "Total Files";
  static const String text_doctor_slips = "Doctor's Slips";
  static const String text_doctor_prescription = "Doctor Prescription.pdf";
  static const String text_medical_certificated = "Total Files";
  static const String text_add_documents = "Add Documents";
  static const String text_calender = "Calender";
  static const String text_job_history = "Job History";
  static const String text_salary_overview = "Salary Overview";
  static const String text_bank_details = "Bank Details";
  static const String text_address_details = "Address Details";
  static const String text_other = "Other";
  static const String text_enter_document_name = "Enter document name";
  static const String text_name = "Name";
  static const String text_click = "Click";
  static const String text_to_add_fils = "to add files";
  static const String text_to_replace_fil = "to replace files";
  static const String text_jpeg_jpg_png_etc =
      "jpeg, jpg, png, pdf, txt, doc, docx, csv. (Max file size is 5MB)";
  static const String text_change_password = "Change Password";
  static String text_language = "Language";
  static String text_11_jan_2023 = "11 Jan 2023 - Present";
  static String text_english = "English";
  static String text_ux_deginer = "UX Designer";
  static String text_basic_salary = "Basic Salary";
  static String text_$30 = "\$30,000";
  static String text_salary_increment = "Salary Increment";
  static String text_will_be_effective_from = "Will be effective from ";
  static String text_worked = "Worked";
  static String text_leave_hour = "Leave Hour";
  static String text_behaviour = "Behaviour";
  static String text_availablity = "Availability";
  static String text_available = "Available";

  static String text_permanent = "Permanent ";
  //static String text_permanent_address = "permanent_address";
 // static String text_present_address = "present_address";
  static String text_about_me = "About me";
  static String text_about_this_app = "About This App";
  static String text_version_2_1_0_1 = "Version: 2.1.0.1";
  static String text_last_update_may_2023 = "last update May 2023";
  static String text_general = "General";
  static String text_laravel = "Laravel";
  static String text_email = "Email";
  static String text_department = "Department";
  static String text_contact = "Contact";
  static String text_shift = "Shift";
  static String text_workShift = "Work shift";
  static String text_phone_number = "+8801234567890";
  static String text_address = "Address ";
  static String text_details = "Details";
  static String text_birthday = "Birthday";
  static String text_date_of_birth = "Date of Birth";
  static String text_phone = "Phone";
  static String text_personal = "Personal";
  static String text_job_histroy = "Job History";
  static String text_ui_designer = "UX Designer";
  static String text_project_manager = "Project Manager";
  static String text_hr_manager = "HR Manager";
  static String text_joining_date = "Joining Date";
  static String text_designation = "Designation";
  static String text_address_dec =
      "465 Jayme Heights Suite 383 New Ninaburgh, ND 96195";
  static String text_role = "Role";
  static String text_work_shift = "Work Shift";
  static String text_employment = "Employment Status";
  static String text_ca_usa = "CA, USA";
  static String text_01_jan_1998 = "01-Jan-1998";
  static String text_gender = "Gender";
  static String text_gender_text = "Gender";
  static String text_county = "County";
  static String text_address_setails = "Address Details";
  static String text_edit_profile = "Edit Profile";
  static String text_select_gender = "Select gender";
  static String text_select_county = "Select County";
  static String text_old_password = "Old Password";
  static String text_new_password = "New Password";
  static String text_confirm_password = "Confirm Password";
  static String text_male = "Male";
  static String text_female = "Female";
  static String text_holiday = "Holidays";
  static String text_area = "Area";
  static String text_city = "City";
  static String text_ca = "CA";
  static String text_prosaccobury = "Prosaccobury";
  static String text_state = "State";
  static String text_zip_code = "Zip Code";
  static String text_768 = "768";
  static String text_usa = "USA";
  static String text_add = "Add ";
  static String text_save_changes = "Save Changes ";
  static String text_texas = "Texas";
  static String text_current_address = "Current Address";
  static String text_2022 = "2022";
  static String text_payrun_badge = "Payrun & Badge";
  static String text_february_2022 = "February 2022";
  static String text_this_year = "This Year";
  static String text_this_year2 = "thisYear";
  static String text_caleder = "Calender";
  static String text_this_month = "This month";
  static String text_success = "Success";
  static String text_enter_your_about = "Enter your about";
  static String text_enter_your_address = "Enter your address";
  static String text_back = "Back";

  static String text_branch = "Branch";
  static String text_bank_code = "Bank Code";
  static String text_account_holder = "Account Holder";
  static String text_account_number = "Account Number";
  static String text_tax_payer_id = "Tax Payer ID";
  static String text_account_title = "Account Title";
  static String text_add_bank_details = "Add Bank Details";
  static String text_edit_bank_details = "Edit Bank Details";

  static String text_enter_bank_name = "Enter bank name";
  static String text_enter_branch = "Enter branch";
  static String text_enter_bank_code = "Enter bank code";
  static String text_enter_name = "Enter name";
  static String text_enter_account_number = "Enter account number";
  static String text_enter_title = "Enter title";
  static String text_enter_id = "Enter ID";

  static String text_enter_massage = "Enter message";
  static String text_password_change_successfully =
      "Password changed successfully";
  static String text_deleted_address_successfully =
      "Deleted address successfully";
  static String text_deleted_document_successfully =
      "Deleted document successfully";
  static String text_document_upload_successfully =
      "Document uploaded successfully!";
  static String text_document_update_successfully =
      "Document update successfully!";
  static String text_profile_update_successfully =
      "Profile update successfully!";
  static String text_profile_picture_update_successfully =
      "Profile picture has been updated successfully";
  static String text_file_upload_update_successfully =
      "File upload has been updated successfully";  static String text_file_upload_file =
      "Failed to upload file";
  static String text_bank_details_deleted_successfully =
      "Bank details has been deleted successfully";
  static String text_bank_details_update_successfully =
      "Bank details has been update successfully";
  static String text_address_deleted_successfully =
      "Address deleted successfully";
  static String text_password_update_successfully =
      "Password has been updated successfully";
  static String text_address_update_successfully =
      "Address has been updated successfully";static String text_address_added_successfully =
      "Address has been added successfully";
  static String text_payslip_download_successfully =
      "Payslip download successfully!";
  static String text_something_wrong = "Something wrong !";
  static String no_internet_title_text = "No internet!!";
  static String no_internet_subtitle_text =
      "Make sure your Wi-Fi or cellular data is turned on and then try again";
  static String text_enter_your_old_password = "Enter your old password";
  static String text_enter_new_password = "Enter new password";
  static String text_confirm_your_new_password = "Confirm your new password";
  static String text_retry = "Retry";

  static String text_this_enter_phone_number = "Enter phone Number";
  static String text_this_all_holiday = "All Holiday";
  static String text_calender_text = "Calender";
  static String text_about_me_dec =
      "Hello. I am an UX/UI designer. I am in love with designing since my childhood. It gives me the freedom of my mind and helps me to express myself and my personality ";

  // Local store string here
  static const String ID_STORE = "store";
  static const String ACCESS_TOKEN = "access_token";
  static const String USER_NAME = "user_name";
  static const String STORE_TOKEN = "storeToken";
  static const String LOGIN_CHECK_KEY = "loginCheckValue";
  static const String STORE_DATE = "storeData";
  static const String STORE_ADDRESS = "storeAddress";
  static const String STORE_DOC_USER_ID = "StoreDocUserId";
  static const String LOGIN_VALUE = "LogInValue";
  static const String REMEMBER_VALUE = "rememberValue";
  static const String REMEMBER_KEY = "rememberKey";
  static const String CURRENT_DATE = "currentDate";
  static const String STORE_COUNTY = "storeCounty";
  static const String STORE_CURRENCY = "storeCurrency";
  static const String STORE_PAYSLIP_LIST_ID = "storePayslipListId";
  static const String STORE_DOC_NAME = "storeDocName";
  static const String STORE_DOC_NAME_TEXT = "store_doc_text";
  static const String STORE_DOC_Id = "store_doc_id";
  static const String BANK_USER_ID_STORE = "bank_user_id";
  static const String PAYSLIP_DATE_RANGE = "payslip_date_range";
  static const String STORE_CURRENT_PASSWORD = "store_current_password";

// Auth String

  static const String forgotPassword = "Forgot password?";
  static const String rememberMe = "Remember me";
  static const String fieldIsRequired = "Field is required !";
  static const String the_first_name_field_is_required = "The first name field is required.";
  static const String the_password_field_is_required = "The password field is required.";
  static const String please_insert_a_valid_email_address = "Please insert a valid email address";
  static const String incorrect_user_or_password = "Incorrect user or password";
  static const String the_details_must_be_at_least_3_character = "The details must be at least 3 characters";
  static const String old_password_incorrect = "Old password is incorrect";
  static const String please_add_permanent_address = "Please add permanent address";


  static const String the_old_password_field_is_required = "The old password field is required.";
  static const String the_new_password_field_is_required = "The new password field is required.";
  static const String the_confirm_password_field_is_required = "The confirm password field is required.";

  static const String the_old_password_must_be_at_least_6_character= "The old password must be at least 6 characters.";
  static const String cant_not_be_correct_please_follow_this= "Can't be correct please follow this  ( r#AG!3c4 )";
  static const String password_must_contains_number_and_etc= "Password must contains number, lowercase, uppercase and special character";
  static const String the_password_must_be_at_least_8_character= "The password must be at least 8 characters.";
  static const String the_password_confirmation_does_not_match= "The password confirmation does not match.";





  static const String the_email_field_is_required = "The email field is required.";
  static const String the_gender_field_is_required = "The gender field is required.";
  static const String enterYourPassword = "Enter your password";
  static const String enterYourEmail = "Enter your email";
  static const String password = "Password";
  static const String email = "Email";
  static const String login = "Log In";
  static const String hi_login_to_your_dashboard =
      "Hi, login to your dashboard ";

  // Route string here
  static const String splashScreen = "/splash_screen";
  static const String signInScreen = "/signIn_screen";
  static const String forgotScreen = "/forgot_screen";
  static const String receiveScreen = "/receive_screen";
  static const String onboardScreen = "/onboard_screen";
  static const String attendLogScreen = "/attendLog_screen";
  static const String moreScreen = "/more_screen";
  static const String home = "/home";
  static const String calender = "/calender_screen";
  static const String payslip = "/payslip_screen";
  static const String leave = "/leave_screen";
  static const String profileView = "/profileView_screen";
  static const String updateDocument = "/updateDocument_screen";
  static const String network_error = "/network_error";
  static const String documentScreen = "/document_screen";
  static const String jobHistory = "/jobHistory_screen";
  static const String salaryOverView = "/salaryOverView_screen";
  static const String bankDetails = "/bankDetails_screen";
  static const String addressDetails = "/addressDetails_screen";
  static const String aboutPage = "/aboutPage_screen";
  static const String payrunBage = "/payrunBage_screen";
  static const String notification_screen = "/notification_screen";
}
