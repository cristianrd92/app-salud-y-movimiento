import 'package:cronometro/src/pages/home_page.dart';
import 'package:cronometro/src/routes/routes.dart';
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salud y Movimiento',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: getAplicationRoutes(),
      onGenerateRoute: ( RouteSettings settings ){
        print( "Ruta llamada ${settings.name}" );
        return MaterialPageRoute(
          builder: (BuildContext context) => HomePage()
          );
      },
    );
  }
}