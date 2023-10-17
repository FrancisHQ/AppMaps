import 'package:flutter/material.dart';
import 'package:flutter_maps_v1/app/ui/pages/home/home_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeController>(
      create: (_) => HomeController(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Mapas'),
          backgroundColor: Colors.pink,
        ),
        body: Consumer<HomeController>(
          builder: (_, controller, __) => GoogleMap(
            markers: controller.markers,
            onMapCreated: controller.onMapCreated,
            initialCameraPosition: controller.initialCameraPosition,
            onTap: controller.onTap,
          ),
        ),
      ),
    );
  }
}
