import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:writopia_frontend/pages/login_page.dart';
import 'package:writopia_frontend/pages/signup_page.dart';

class Routes {
  static String home = '/';
  static String login = '/login';
  static String register = '/register';
  static String dashboard = '/dashboard';

  static String getHomeRoute() => home;
  static String getLoginRoute() => login;
  static String getRegisterRoute() => register;
  static String getDashboardRoute() => dashboard;

  static List<GetPage> routes = [
    GetPage(name: home, page: () => const LoginPage()),
    GetPage(name: login, page: () => const LoginPage()),
    GetPage(name: register, page: () => const SignUpPage()),
    GetPage(name: dashboard, page: () => const Placeholder()),
  ];
}
