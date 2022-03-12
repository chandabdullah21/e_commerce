import 'package:e_commerce/screens/auth/login/login_screen.dart';
import 'package:e_commerce/screens/auth/phone/phone_screen.dart';
import 'package:e_commerce/screens/auth/register/register_screen.dart';
import 'package:e_commerce/screens/auth/verification/verification_screen.dart';
import 'package:e_commerce/screens/other/category/category_screen.dart';
import 'package:e_commerce/screens/other/messages/message_screen.dart';
import 'package:e_commerce/screens/other/notifications/notification_screen.dart';
import 'package:e_commerce/screens/tabs/home/home_screen.dart';
import 'package:e_commerce/screens/tabs/profile/profile_screen.dart';
import 'package:e_commerce/screens/tabs/tabs.dart';
import 'package:get/get.dart';

class Routes {
  static const initial = '/';

  static final routes = [
    GetPage(name: '/', page: () => LoginScreen()),
    GetPage(name: '/nav', page: () => const Tabs()),
    GetPage(name: '/register', page: () => RegisterScreen()),
    GetPage(name: '/phone', page: () => PhoneScreen()),
    GetPage(name: '/verification', page: () => const VerificationScreen()),
    GetPage(name: '/home', page: () => const HomeScreen()),
    GetPage(name: '/profile', page: () => const ProfileScreen()),
    GetPage(name: '/message', page: () => const MessageScreen()),
    GetPage(name: '/notification', page: () => const NotificationScreen()),
    GetPage(name: '/category', page: () => const CategoryScreen()),
    
  ];
}
