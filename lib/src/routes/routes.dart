import 'package:cronometro/src/pages/ajustes_page.dart';
import 'package:cronometro/src/pages/cronometro_page.dart';
import 'package:cronometro/src/pages/home_page.dart';
import 'package:flutter/material.dart';

Map<String,WidgetBuilder> getAplicationRoutes(){

  return <String, WidgetBuilder>{
    '/' : (BuildContext context ) => HomePage(),
    'cronometro' : (BuildContext context ) => CronometroPage(),
    'ajustes' : (BuildContext context ) => AjustesPage(),
  };

}


