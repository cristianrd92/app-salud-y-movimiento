import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuarios {
  
  static final PreferenciasUsuarios _intancia = new PreferenciasUsuarios._internal();

  factory PreferenciasUsuarios(){
    return _intancia;
  }

  PreferenciasUsuarios._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  //Ninguna de estas propiedades se usa
  //bool _colorSecundario;
  //int _genero;
  //String _nombre;

  //GET y SET del Genero
  get genero {
    return _prefs.getInt('genero') ?? 1;
  }

  set genero (int valor){
    _prefs.setInt('genero', valor);
  }

 //GET y SET del Color
  get colorSegundario {
    return _prefs.getBool('colorSecundario') ?? false;
  }

  set colorSegundario (bool valor){
    _prefs.setBool('colorSecundario', valor);
  }

 //GET y SET del nombre
  get nombreUsuario {
    return _prefs.getString('nombreUsuario') ?? '';
  }

  set nombreUsuario (String valor){
    _prefs.setString('nombreUsuario', valor);
  }

  //GET y SET de la ultima pagina
  get ultimaPagina {
    return _prefs.getString('ultimaPagina') ?? 'home';
  }

  set ultimaPagina (String valor){
    _prefs.setString('ultimaPagina', valor);
  }

}