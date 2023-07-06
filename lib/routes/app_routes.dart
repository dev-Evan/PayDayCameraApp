part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const SPLASH_SCREEN = _Paths.SPLASH_SCREEN;
  static const SIGN_IN = _Paths.SIGN_IN;
  static const FORGOT_PASSWORD = _Paths.FORGOT_PASSWORD;
  static const ONBOARD_SCREEN = _Paths.ONBOARD_SCREEN;
  static const ATTENDANCE_LOG = _Paths.ATTENDANCE_LOG;
  static const MORE_SCREEN = _Paths.MORE_SCREEN;
  static const HOME = _Paths.HOME;
  static const CALENDAR = _Paths.CALENDAR;
  static const PAYSLIP = _Paths.PAYSLIP;
  static const LEAVE = _Paths.LEAVE;
  static const PROFILE_VIEW = _Paths.PROFILE_VIEW;
  static const UPDATE_DOCUMENT = _Paths.UPDATE_DOCUMENT;
  static const NETWORK_ERROR = _Paths.NETWORK_ERROR;
  static const DOCUMENT_SCREEN = _Paths.DOCUMENT_SCREEN;
  static const JOB_HISTORY = _Paths.JOB_HISTORY;
  static const SALARY_OVERVIEW = _Paths.SALARY_OVERVIEW;
  static const BANK_DETAILS = _Paths.BANK_DETAILS;
  static const ADDRESS_DETAILS = _Paths.ADDRESS_DETAILS;
  static const ABOUT_PAGE = _Paths.ABOUT_PAGE;
  static const PAYRAN_BAGE = _Paths.PAYRAN_BAGE;
  static const NOTIFICATION_SCREEN = _Paths.NOTIFICATION_SCREEN;
  static const ANNOUNCE_SCREEN = _Paths.ANNOUNCE_SCREEN;
  static const LEAVE_ALLOWANCE_SCREEN = _Paths.LEAVE_ALLOWANCE_SCREEN;
  static const EDIT_PROFILE = _Paths.EDIT_PROFILE;
  static const CHANGE_PASSWORD = _Paths.CHANGE_PASSWORD;
  static const LEAVE_RECORD = _Paths.LEAVE_RECORD;
}

abstract class _Paths {
  _Paths._();

  static const SPLASH_SCREEN = '/splash-screen';
  static const SIGN_IN = '/signIn-screen';
  static const FORGOT_PASSWORD = "/forgot-screen";
  static const ONBOARD_SCREEN = "/onboard-screen";
  static const ATTENDANCE_LOG = "/attendLog-screen";
  static const MORE_SCREEN = "/more-screen";
  static const HOME = "/home";
  static const CALENDAR = "/calender-screen";
  static const PAYSLIP = "/payslip-screen";
  static const LEAVE = "/leave-screen";
  static const PROFILE_VIEW = "/profileView-screen";
  static const UPDATE_DOCUMENT = "/updateDocument-screen";
  static const NETWORK_ERROR = "/network-error";
  static const DOCUMENT_SCREEN = "/document-screen";
  static const JOB_HISTORY = "/jobHistory-screen";
  static const SALARY_OVERVIEW = "/salaryOverView-screen";
  static const BANK_DETAILS = "/bankDetails-screen";
  static const ADDRESS_DETAILS = "/addressDetails-screen";
  static const ABOUT_PAGE = "/aboutPage-screen";
  static const PAYRAN_BAGE = "/payrunBage-screen";
  static const NOTIFICATION_SCREEN = "/notification-screen";
  static const ANNOUNCE_SCREEN = "/announce-screen";
  static const LEAVE_ALLOWANCE_SCREEN = "/leave_allowance-screen";
  static const EDIT_PROFILE = "/edit_profile-screen";
  static const CHANGE_PASSWORD = "/change_password-screen";
  static const LEAVE_RECORD = "/leave_record-screen";
}
