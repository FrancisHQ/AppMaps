import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_maps_v1/app/ui/pages/request_permission/request_permission_controller.dart';
import 'package:flutter_maps_v1/app/ui/routes/routes.dart';
import 'package:permission_handler/permission_handler.dart';

class RequestPermissionPage extends StatefulWidget {
  const RequestPermissionPage({super.key});

  @override
  _RequestPermissionPageState createState() => _RequestPermissionPageState();
}

class _RequestPermissionPageState extends State<RequestPermissionPage> {
  final _controller = RequestPermissionController(Permission.locationWhenInUse);
  late StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = _controller.onStatusChanged.listen(
      (status) {
        if (status == PermissionStatus.granted) {
          Navigator.pushReplacementNamed(context, Routes.HOME);
        }
      },
    );
  }

  @override
  void dispose() {
    _subscription.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(),
              Container(
                padding: const EdgeInsets.all(16.0),
                constraints: const BoxConstraints(maxWidth: 300.0),
                child: const Text(
                  "Para abrir esta aplicación, se requiere el permiso de ubicación de este dispositivo, selecciona 'Permitir' para continuar",
                  style: TextStyle(color: Colors.pinkAccent),
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                  foregroundColor: Colors.white,
                ),
                child: const Text("Permitir"),
                onPressed: () {
                  _controller.request();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
