part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const splash = _Paths.splash;
  static const signIn = _Paths.splash;

}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const splash = '/splash_screen';
  static const signIn = '/splash_screen';
}


