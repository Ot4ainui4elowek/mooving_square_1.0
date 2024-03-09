import 'package:moov_square/presentation/router_page/router__screen.dart';
import 'package:moov_square/presentation/cube_page/widgets/cube_screen.dart';
import 'package:moov_square/presentation/user_form_page/user_form_screen.dart';

abstract class Routes {
  static String routerPage = '/';
  static String squareApp = '/square-app';
  static String userForm = '/user-form';
}

final routes = {
  Routes.routerPage: (context) => const RouterScreen(title: 'Выбирай'),
  Routes.squareApp: (context) => const CubeScreen(),
  Routes.userForm: (context) => UserForm(),
};
