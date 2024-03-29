import 'package:conexion_api_tiempo/modelo/modelo_tiempo.dart';
import 'package:conexion_api_tiempo/modelo/modelo_tiempo_dia.dart';
import 'package:conexion_api_tiempo/servicios/cliente_tiempo_api.dart';
import 'package:conexion_api_tiempo/vistas/informacion_adicional.dart';
import 'package:conexion_api_tiempo/vistas/tiempo_actual.dart';
import 'package:conexion_api_tiempo/vistas/lista_tiempo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  ClienteTiempoApi cliente = ClienteTiempoApi();
  Tiempo? tiempo;
  List<TiempoDia>? tiempoSemanal;
  String ciudad = "Ibi";

  Future<void> getData() async {
    tiempo = await cliente.getTiempoActual(ciudad);
    tiempoSemanal = await cliente.getTiempoSemanal(ciudad);
  }

  Future<void> _seleccionarCiudad() async {
    final ciudadSeleccionada = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Seleccionar Ciudad'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'Madrid');
              },
              child: const Text('Madrid'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'Barcelona');
              },
              child: const Text('Barcelona'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'Londres');
              },
              child: const Text('Londres'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'Ibi');
              },
              child: const Text('Ibi'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 'Alcoy');
              },
              child: const Text('Alcoy'),
            ),
          ],
        );
      },
    );

    if (ciudadSeleccionada != null) {
      setState(() {
        ciudad = ciudadSeleccionada;
      });
      await getData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromARGB(255, 167, 212, 255), Color.fromARGB(255, 2, 90, 255)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: const Text(
            "El Tiempo",
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: _seleccionarCiudad,
              icon: const Icon(Icons.gps_fixed),
              color: Colors.white,
            )
          ],
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done && tiempo != null && tiempoSemanal != null) {
              return SingleChildScrollView(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        tiempoActual("${tiempo!.icono}", "${tiempo!.temperatura}º", "${tiempo!.nombreCiudad}"),
                        const SizedBox(height: 40.0),
                        const Divider(),
                        ListaTiempo(tiempoSemanal: tiempoSemanal!),
                        const SizedBox(height: 40.0),
                        const Text(
                          "Información adicional",
                          style: TextStyle(
                            fontSize: 24.0,
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Divider(),
                        informacionAdicional("${tiempo!.viento}", "${tiempo!.humedad}", "${tiempo!.presion}", "${tiempo!.sensacionTermica}"),
                      ],
                    ),
                  ),
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
