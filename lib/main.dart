import 'package:conexion_api_tiempo/modelo/modelo_tiempo.dart';
import 'package:conexion_api_tiempo/servicios/cliente_tiempo_api.dart';
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
  ClienteTiempoApi cliente = ClienteTiempoApi();
  Tiempo? tiempo;

  Future<void> getData() async {
    tiempo = await cliente.getTiempoActual("Ibi");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: const Text(
            "El Tiempo",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
            color: Colors.black,
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.gps_fixed),
              color: Colors.black,
            )
          ],
        ),
        body: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done && tiempo != null) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    tiempoActual("${tiempo!.icono}", "${tiempo!.temperatura}º", "${tiempo!.nombreCiudad}"),
                    const SizedBox(
                      height: 60.0,
                    ),
                    const Text(
                      "Información Adicional",
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 20.0,
                    ),
                    informacionAdicional("${tiempo!.viento}", "${tiempo!.humedad}", "${tiempo!.presion}", "${tiempo!.sensacionTermica}")
                  ],
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Container();
            }));
  }
}
