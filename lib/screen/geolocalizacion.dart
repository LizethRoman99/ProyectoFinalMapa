import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GeolocalizacionScreen extends StatefulWidget {
  const GeolocalizacionScreen({Key? key}) : super(key: key);

  @override
  _GeolocalizacionScreenState createState() => _GeolocalizacionScreenState();
}

class _GeolocalizacionScreenState extends State<GeolocalizacionScreen> {
  Position? _position;

  @override
  void initState() {
    super.initState();
    _getPosition();
  }

  Future<void> _getPosition() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          // El usuario negó los permisos, puedes manejarlo de acuerdo a tus necesidades
          return;
        }
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );
      setState(() {
        _position = position;
      });
    } catch (e) {
      print('Error obteniendo la ubicación: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Geolocalización',
           style: TextStyle(color: Colors.black, fontSize: 30),
        ),
         backgroundColor: const Color.fromARGB(255, 234, 170, 225),
        
      ),
      body: Center(
        child: _position != null
            ? Text(
                'Latitud: ${_position!.latitude}\nLongitud: ${_position!.longitude}',
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
