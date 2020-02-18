import 'dart:io';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

/*
  File: db.dart
  Functionality: This file sets up our local database. It stores the countries geocode data. It has methods that
  allow the frontend to communicate and retreive/modify/store data within the
  database.
*/

// Store country cord data locally
class Country {
  String code;
  String name;
  double lat;
  double lon;

  Country({
    this.code,
    this.name,
    this.lat,
    this.lon,
  });

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'name': name.toLowerCase(),
      'lat': lat,
      'lon': lon,
    };
  }

  @override
  String toString() {
    return 'Country{code: $code, name: $name, lat: $lat, lon: $lon}';
  }
}

// singleton class to manage the database
class DB {
  // This is the actual database filename that is saved in the docs directory.
  static final _databaseName = "Coronavirus.db";
  // Increment this version when you need to change the schema.
  static final _databaseVersion = 1;

  // Make this a singleton class.
  DB._privateConstructor();
  static final DB instance = DB._privateConstructor();

  // Only allow a single open connection to the database.
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  // open the database
  _initDatabase() async {
    // The path_provider plugin gets the right directory for Android or iOS.
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    // Open the database. Can also add an onUpdate callback parameter.
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL string to create the database
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      create table country (
        code text primary key not null UNIQUE,
        name text not null,
        lat real not null,
        lon real not null
      )''');
  }

  // Database helper methods:

  // Add Country
  Future<int> insertCountry(Country country) async {
    Database db = await database;
    int id = await db.insert(
      'country',
      country.toMap(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
    return id;
  }

  Future<void> deleteCountry(String name) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Recipe from the Database.
    await db.delete(
      'country',
      // Use a `where` clause to delete a specific country.
      where: "name = ?",
      // Pass the Country's name as a whereArg to prevent SQL injection.
      whereArgs: [name],
    );
  }

  Future<void> clearCountries() async {
    Database db = await database;
    await db.delete('country');
  }

  Future<List<Country>> countries() async {
    // Get a reference to the database.
    final Database db = await database;

    // Query the table for all The Countries.
    final List<Map<String, dynamic>> maps = await db.query('country');

    // Convert the List<Map<String, dynamic> into a List<Country>.
    return List.generate(maps.length, (i) {
      return Country(
        code: maps[i]['code'],
        name: maps[i]['name'],
        lat: maps[i]['lat'],
        lon: maps[i]['lon'],
      );
    });
  }

  Future<LatLng> getCords(String name) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Recipe from the Database.
    var country = await db.query(
      'country',
      // Use a `where` clause to delete a specific country.
      where: "name = ?",
      // Pass the Country's name as a whereArg to prevent SQL injection.
      whereArgs: [name.toLowerCase()],
    );
    if (country.length > 0) {
      return LatLng(country[0]['lat'], country[0]['lon']);
    } else {
      return LatLng(0, 0);
    }
  }
}
