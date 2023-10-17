import 'package:flutter/material.dart';
import 'package:flutter_maps_v1/app/ui/pages/home/home_page.dart';
import 'package:flutter_maps_v1/app/ui/pages/request_permission/request_permission_page.dart';
import 'package:flutter_maps_v1/app/ui/pages/splash/splash_page.dart';
import 'package:flutter_maps_v1/app/ui/routes/routes.dart';

Map<String, Widget Function(BuildContext)> appRoutes() {
  return {
    Routes.SPLASH: (_) => const SplashPage(),
    Routes.PERMISSIONS: (_) => const RequestPermissionPage(),
    Routes.HOME: (_) => const HomePage(),
  };
}
