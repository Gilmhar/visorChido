// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:visor_xml/Datos%20Peticiones/Mapa_Cap.dart';

class DBprovider {
  static Database? _database;
  static final DBprovider db = DBprovider._();
  DBprovider._();

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final Path = join(documentsDirectory.path, "PaqueteDatos.db");

    return await openDatabase(
      Path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute("""
        CREATE TABLE PDatos(
          id INTEGER PRIMARY KEY,
          identificador TEXT,
          cap TEXT,
          res TEXT)
        """);
      },
    );
  }

  Future<int> nuevoPaquete(PaqueteDatos paquete) async {
    final db = await database;
    final res = await db!.insert("PDatos", paquete.toJson());
    return res;
  }

  Future<PaqueteDatos?> paqueteById(int id) async {
    final db = await database;
    final res = await db!.query("PDatos", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? PaqueteDatos.fromJson(res.first) : null;
  }

  Future<List<PaqueteDatos?>> getTodosLosPaquetes() async {
    final db = await database;
    final res = await db!.query("PDatos");
    return res.isNotEmpty ? res.map((s) => PaqueteDatos.fromJson(s)).toList() : [];
  }

  Future<List<dynamic>?> getPaquetePorTipo(String tipo) async {
    final db = await database;
    final res = await db!.query("PDatos");
    return res.isNotEmpty ? res.map((s) => PaqueteDatos.fromJson(s)).toList() : [];
  }

  Future<int> updatePaquete(PaqueteDatos paquete) async {
    final db = await database;
    final res = await db!.update("PDatos", paquete.toJson(),
        where: "id = ?", whereArgs: [paquete.id]);
    return res;
  }

  Future<int> deletePaquete(int id) async {
    final db = await database;
    final res = await db!.delete("PDatos", where: "id = ?", whereArgs: [id]);
    return res;
  }

  Future<int> deleteAllPaquetes() async {
    final db = await database;
    final res = await db!.delete("PDatos");
    return res;
  }
}
