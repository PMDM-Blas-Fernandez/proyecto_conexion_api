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
            onPressed: _seleccionarCiudad,
            icon: const Icon(Icons.gps_fixed),
            color: Colors.black,
          )
        ],
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done && tiempo != null && tiempoSemanal != null) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                tiempoActual("${tiempo!.icono}", "${tiempo!.temperatura}º", "${tiempo!.nombreCiudad}"),
                const SizedBox(height: 60.0),
                const Text(
                  "Información Adicional",
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(),
                const SizedBox(height: 20.0),
                informacionAdicional("${tiempo!.viento}", "${tiempo!.humedad}", "${tiempo!.presion}", "${tiempo!.sensacionTermica}"),
                const SizedBox(height: 20.0),
                const Text(
                  "Próximos 7 días",
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(),
                const SizedBox(height: 20.0),
                ListaTiempo(tiempoSemanal: tiempoSemanal!),
              ],
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container();
        },
      ),
    );
  }
}
