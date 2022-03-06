import 'package:e_commerce/screens/auth/login/login_screen.dart';
import 'package:e_commerce/screens/auth/register/register_screen.dart';
import 'package:e_commerce/screens/home/home_screen.dart';
import 'package:e_commerce/screens/navigation/nav.dart';
import 'package:e_commerce/screens/profile/profile_screen.dart';
import 'package:get/get.dart';

class Routes {
  static const initial = '/';

  static final routes = [
    GetPage(name: '/', page: () => LoginScreen()),
    GetPage(name: '/nav', page: () => const Navigation()),
    GetPage(name: '/register', page: () => RegisterScreen()),
    GetPage(name: '/home', page: () => const HomeScreen()),
    GetPage(name: '/profile', page: () => const ProfileScreen()),
  ];
}
