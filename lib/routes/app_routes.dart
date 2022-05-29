part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const LOGIN = _Paths.LOGIN;
  static const LOAD_AUTH = _Paths.LOAD_AUTH;
  static const MAIN = _Paths.MAIN;
}

abstract class _Paths {
  static const LOGIN = '/login';
  static const LOAD_AUTH = '/load_auth';
  static const MAIN = '/main';
}
