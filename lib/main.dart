import 'package:conexion_api_tiempo/vistas/informacion_adicional.dart';
import 'package:conexion_api_tiempo/vistas/tiempo_actual.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          "El Tiempo",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
          color: Colors.black,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          tiempoActual(Icons.wb_sunny_rounded, "26.3", "Ibi"),
          SizedBox(
            height: 60.0,
          ),
          Text(
            "Información Adicional",
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(),
          SizedBox(
            height: 20.0,
          ),
          informacionAdicional("24", "2", "1014", "24.6")
        ],
      ),
    );
  }
}
