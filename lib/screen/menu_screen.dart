import 'package:flutter/material.dart';
import 'package:fotoproyecto/screen/agregarfoto.dart';
import 'package:fotoproyecto/screen/geolocalizacion.dart';
 // Importa la pantalla de geolocalización

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MenuScreen(),
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Trabajo Final',
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
        backgroundColor: const Color.fromARGB(255, 234, 170, 225),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: const Text('Tomar Foto'),
                  leading: const Icon(Icons.camera,
                      color: Color.fromARGB(255, 234, 170, 225)),
                  trailing: const Icon(Icons.navigate_next_outlined,
                      color: Color.fromARGB(255, 234, 170, 225)),
                  onTap: () {
                    //ABRIR OTRO SCREEN
                    final route = MaterialPageRoute(
                      builder: (context) => const RegistrarProyecto(),
                    );
                    Navigator.push(context, route);
                  },
                ),
                ListTile(
                  title: const Text('Geolocalización'),
                  leading: const Icon(Icons.location_on,
                      color: Color.fromARGB(255, 234, 170, 225)),
                  trailing: const Icon(Icons.navigate_next_outlined,
                      color: Color.fromARGB(255, 234, 170, 225)),
                  onTap: () {
                    // Navegar a la pantalla de geolocalización
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GeolocalizacionScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
