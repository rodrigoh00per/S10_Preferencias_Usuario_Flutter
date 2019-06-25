import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  SharedPreferences _prefs;

  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  /* Propiedades que estan dentro de las preferencias del usuario  */

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  get genero {
    return this._prefs.getInt("genero") ?? 1;
  }

  set genero(int valor) {
    this._prefs.setInt("genero", valor);
  }

  get colorSecundario {
    return this._prefs.getBool("colorSecundario") ?? false;
  }

  set colorSecundario(bool valor) {
    this._prefs.setBool("colorSecundario", valor);
  }

  get nombreUsuario {
    return this._prefs.getString("nombreUsuario") ?? "";
  }

  set nombreUsuario(String valor) {
    this._prefs.setString("nombreUsuario", valor);
  }

  get ultimaPagina {
    return this._prefs.getString("ultimaPagina") ?? "home";
  }

  set ultimaPagina(String valor) {
    this._prefs.setString("ultimaPagina", valor);
  }
}
