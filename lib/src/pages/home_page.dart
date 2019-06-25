import 'package:flutter/material.dart';
import 'package:s10_preferencias_usuario/src/shared_prefs/preferencias_usuario.dart';
import 'package:s10_preferencias_usuario/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = "home";
  final prefs = PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {

    this.prefs.ultimaPagina = HomePage.routeName;
    return Scaffold(
      appBar: AppBar(
        title: Text("Preferencias del usuario"),
        backgroundColor:
            this.prefs.colorSecundario ? Colors.pink : Colors.lightBlue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Color secundario :${this.prefs.colorSecundario}"),
          Divider(),
          Text("Genero ${this.prefs.genero}"),
          Divider(),
          Text("Nombre de usuario ${this.prefs.nombreUsuario}"),
          Divider()
        ],
      ),
      drawer: MenuWidget(),
    );
  }
}
