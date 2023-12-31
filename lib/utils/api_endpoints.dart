class Api{
  Api._();
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
  static String CANCEL_ATTENDANCE_REQUEST = "/attendance/status/cancel";
  static String REQUEST_LEAVE = "/leave/store";
  static String ALL_NOTIFICATION = "/notifications";
  static String ALL_UNREAD_NOTIFICATION = "/notifications?unread=true";
  static String NOTIFICATION_AS_READ = "/notification/read";
  static String NOTIFICATION_AS_ALL_READ = "/notification/all/read";
  static String EMPLOYEE_BANK_INFORMATION = "/employee/bank-information";
  static String ANNOUNCEMENT = "/employee/announcement";
  static String LEAVE_ALLOWANCE_DETAILS = "/leave/allowance-details";
  static String START_BREAK = "/attendance/break-start";
  static String END_BREAK = "/attendance/break-end";
}