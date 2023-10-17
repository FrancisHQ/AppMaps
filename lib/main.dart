import 'package:flutter/material.dart';
import 'package:flutter_maps_v1/app/ui/routes/pages.dart';
import 'package:flutter_maps_v1/app/ui/routes/routes.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mapas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, brightness: Brightness.dark),
      initialRoute: Routes.SPLASH,
      routes: appRoutes(),
    );
  }
}
