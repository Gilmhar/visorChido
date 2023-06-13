// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:visor_xml/Datos_User/Map_User.dart';

class DBprovider {

  //Aqui declaramos la base para inisializar
  static Database? _database;
  static final DBprovider db = DBprovider._();
  DBprovider._();

  //Esta solo es una comprobacion apra saber si ya existe o no
  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  //Aqui abrimos la abse y declaramos los datos y columnas de que tipo son etc.
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory(); //Directorio donde se almacenara
    final Path = join(documentsDirectory.path, "Usuario.db"); //Nombre de DB
    return await openDatabase(
      Path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute("""
        CREATE TABLE User(
        id INTEGER PRIMARY KEY,
        idcelular TEXT,
        nombre TEXT,
        celular TEXT,
        correo TEXT,
        contra TEXT,
        fechaDescarga TEXT,
        fechaFinalPruena TEXT,
        pruebaOPago TEXT,
        fechaPago TEXT)
        """);
      },
    );
  }
   
   //Estas son todas las funciones que se pueden usar en la DB el CRUD
  Future<int> nuevoUsuario(Usuario usuario) async {
    final db = await database;
    final res = await db!.insert("User", usuario.toJson());
    return res;
  }

  Future<Usuario?> userById(int id) async {
    final db = await database;
    final res = await db!.query("User", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Usuario.fromJson(res.first) : null;
  }

  Future<List<Usuario?>> getTodosLosUser() async {
    final db = await database;
    final res = await db!.query("User");
    return res.isNotEmpty ? res.map((s) => Usuario.fromJson(s)).toList() : [];
  }

  Future<List<dynamic>?> getUserPorTipo(String tipo) async {
    final db = await database;
    final res = await db!.query("User");
    return res.isNotEmpty ? res.map((s) => Usuario.fromJson(s)).toList() : [];
  }

  Future<int> updateUser(Usuario usuario) async {
    final db = await database;
    final res = await db!.update("User", usuario.toJson(),
        where: "id = ?", whereArgs: [usuario.id]);
    return res;
  }

  Future<int> deleteUser(int id) async {
    final db = await database;
    final res = await db!.delete("User", where: "id = ?", whereArgs: [id]);
    return res;
  }

  Future<int> deleteAllUser() async {
    final db = await database;
    final res = await db!.delete("User");
    return res;
  }
}
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
// class DataBase {
//   static const int _version = 1;
//   static const String _dbName = 'Usuario.db';
//   static Future<Database> _openDB() async {
//     return openDatabase(join(await getDatabasesPath(), _dbName),
//         onCreate: (db, version) async => await db.execute('''
//       CREATE TABLE  $_dbName(
//         id INTEGER PRIMARY KEY,
//         idcelular INTEGER NOT NULL,
//         nombre TEXT NOT NULL,
//         celular INTEGER NOT NULL
//         correo TEXT NOT NULL,
//         contra TEXT NOT NULL,
//         fechaDescarga TEXT NOT NULL,
//         fechaFinalDescarga TEXT NOT NULL,
//         pruebaPago INTEGER NOT NULL,
//         fechaPago TEXT NOT NULL
//       );'''), version: _version);
//   }

//   static Future<int> addusuario(Usuario usuario) async {
//     final db = await _openDB();
//     return await db.insert("Usuario", usuario.toJson(),
//         conflictAlgorithm: ConflictAlgorithm.replace);
//   }

//   static Future<int> updateusuario(Usuario usuario) async {
//     final db = await _openDB();
//     return await db.update(_dbName, usuario.toJson(),
//         where: 'id = ?',
//         whereArgs: [usuario.id],
//         conflictAlgorithm: ConflictAlgorithm.replace);
//   }

//   static Future<int> deleteusuario(Usuario usuario) async {
//     final db = await _openDB();
//     return await db.delete(_dbName,where: null);
//   }

//   static Future<List<Usuario>?> getusuarios() async {
//     final db = await _openDB();

//     final List<Map<String, dynamic>> maps = await db.query(_dbName);

//     if (maps.isEmpty) {return null;}return List.generate(maps.length, (index) => Usuario.fromJson(maps[index]));}
// }
