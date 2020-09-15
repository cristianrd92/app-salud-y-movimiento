import 'package:cronometro/src/share_prefs/preferencias_usuario.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';


class AjustesPage extends StatefulWidget {

  static final String routeName = 'settings';

  @override
  _AjustesPageState createState() => _AjustesPageState();
}

class _AjustesPageState extends State<AjustesPage> {

  bool _colorSecundario;
  int _genero;

  TextEditingController _textController;

  final prefs = new PreferenciasUsuarios();

  @override
  void initState() {
    super.initState();

    prefs.ultimaPagina = AjustesPage.routeName;

    _genero = prefs.genero;
    _colorSecundario = prefs.colorSegundario;

    _textController = new TextEditingController(text: prefs.nombreUsuario);
  }

  _setSelectedRadio ( int valor ) {

    prefs.genero = valor;
    _genero = valor;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajustes de Usuario"),
        backgroundColor: (prefs.colorSegundario) ? Colors.teal : Colors.blue,
      ),
      body: ListView(
        children: <Widget> [
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text("Settings", style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold)),
          ),
          Divider(),
          SwitchListTile(
            value: _colorSecundario,
            title: Text("Color Secundario"),
            onChanged: ( value ) { 
              setState(() {
                _colorSecundario = value;
                prefs.colorSegundario = value;
               });
            },
          ),
          RadioListTile(
            value: 1,
            title: Text("Masculino"),
            groupValue: _genero,
            onChanged: _setSelectedRadio,
          ),
          RadioListTile(
            value: 2,
            title: Text("Femenino"),
            groupValue: _genero,
            onChanged: _setSelectedRadio,
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: "Nombre",
                helperText: "Nombre de la persona usando el telefono",
              ),
              onChanged: ( value ){
                prefs.nombreUsuario = value;
              },
            ),
          ),
        ],
      )
    );
  }
}
