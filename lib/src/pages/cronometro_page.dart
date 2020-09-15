import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class CronometroPage extends StatefulWidget {
  State createState() => new _MiCronometroState();
}

var assetsImage = new AssetImage('images/logo.png'); //<- Creates an object that fetches an image.
var image = new Image(image: assetsImage, fit: BoxFit.cover); //<- Creates a widget that displays an image.

class _MiCronometroState extends State<CronometroPage> {
    
  Timer _timer;
  int _start = 7;
  int _tiempo_descanso = 5;
  int _tiempo_serie = 10;
  bool _ejecutado = true;
  String _estado = "Serie";

  void startTimer() {
    if (_timer != null) {
      _timer.cancel();
      _ejecutado=false;
      _timer = null;
    } else {
      _ejecutado = true;
      _timer = new Timer.periodic(
        const Duration(seconds: 1),
        (Timer timer) => setState(
          () {
            _ejecutado=true;
            if (_start == 0) {
              if (_estado == "Serie"){
                _start = _tiempo_descanso;
                _estado = "Descanso";
              }else{
                _start = _tiempo_serie;
                _estado = "Ejercicio";
              }
            } else {
              _start = _start - 1;
            }
          },
        ),
      );
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text("Temporizador Ejercicios")),
      body: _build_body(),
    );
  }

  Widget _build_body() {
    return Column(
      children: <Widget>[
        Container(child: image),
        RaisedButton(
                child: Icon(_ejecutado ? Icons.play_arrow : Icons.stop),
                onPressed: startTimer,
              ),
                Expanded(
                  
          child: FittedBox(
            fit: BoxFit.none,
            child: Text("$_start", style: TextStyle(fontSize: 72)),
            ),
          ),
          Expanded(
          child: FittedBox(
            fit: BoxFit.none,
            child: Text("$_estado", style: TextStyle(fontSize: 72)),
            ),
          ),
      ],
    );
  }
  Future<AudioPlayer> playLocalAsset() async {
    AudioCache cache = new AudioCache();
    return await cache.play("myCustomSoundEffect.mp3");
  }
}


