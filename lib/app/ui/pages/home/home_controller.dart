import 'package:flutter/widgets.dart';
import 'package:flutter_maps_v1/app/ui/utils/map_style.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeController extends ChangeNotifier {
  final Map<MarkerId, Marker> _markers = {};
  Set<Marker> get markers => _markers.values.toSet();

  final initialCameraPosition = const CameraPosition(
    target: LatLng(-12.0136918, -76.988491),
    zoom: 15,
  );

  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(mapStyle);
  }

  void onTap(LatLng position) async {
    final id = _markers.length.toString();
    final markerId = MarkerId(id);

    final icon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      'assets/nyancat.png',
    );

    final marker = Marker(
        markerId: markerId,
        position: position,
        draggable: true,
        anchor: const Offset(0, 1),
        icon: icon,
        onTap: () {
          print(markerId.toString());
        },
        onDragEnd: (newPosition) {
          print("new position $newPosition");
        });
    _markers[markerId] = marker;
    notifyListeners();
  }
}
