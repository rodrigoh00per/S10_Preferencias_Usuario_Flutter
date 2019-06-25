import 'package:flutter/material.dart';
import 'package:s10_preferencias_usuario/src/shared_prefs/preferencias_usuario.dart';
import 'package:s10_preferencias_usuario/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = "settings";

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final prefs = new PreferenciasUsuario();

  bool _colorSecundario;
  int _genero;
  String _nombre;

  TextEditingController _textController;

  @override
  void initState() {
    super.initState();

    this._genero = prefs.genero;
    this._colorSecundario = prefs.colorSecundario;
    this._nombre = prefs.nombreUsuario;
    this.prefs.ultimaPagina = SettingsPage.routeName;

    this._textController = TextEditingController(text: this._nombre);
  }

  _cambiarGenero(int valor) async {
    setState(() {
      this._genero = valor;
      this.prefs.genero = valor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajustes"),
        backgroundColor:
            this.prefs.colorSecundario ? Colors.pink : Colors.lightBlue,
      ),
      body: ListView(children: <Widget>[
        Container(
            child: Center(
          child: Text("Settings", style: TextStyle(fontSize: 30)),
        )),
        Divider(),
        SwitchListTile(
          value: this._colorSecundario,
          title: Text("Color Secundario"),
          onChanged: (value) {
            setState(() {
              this.prefs.colorSecundario = value;
              this._colorSecundario = value;
            });
          },
        ),
        RadioListTile(
            value: 1,
            title: Text("Masculino"),
            groupValue: this._genero,
            onChanged: this._cambiarGenero),
        RadioListTile(
            value: 2,
            title: Text("Femenino"),
            groupValue: this._genero,
            onChanged: this._cambiarGenero),
        Divider(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            controller: this._textController,
            onChanged: (value) {
              setState(() {
                this._nombre = value;
                this.prefs.nombreUsuario = value;
              });
            },
            decoration: InputDecoration(
                labelText: "Nombre",
                helperText: "Nombre de la persona usando el telefono"),
          ),
        ),
      ]),
      drawer: MenuWidget(),
    );
  }
}
