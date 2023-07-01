import 'package:flutter/material.dart';
import 'package:moroccan_guide/models/trips.dart';
import 'package:moroccan_guide/screens/Tabs_Screen.dart';
import 'package:moroccan_guide/screens/category_trip_item.dart';
import 'app_data.dart';

import './screens/category_trip_item.dart';

import './screens/trip_infos_screen.dart';
import './screens/Filtre_Page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'summer': false,
    'winter': false,
    'family': false,
  };

  List<Trip> _availabaleTeips = Trips_data;

  void _changeFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availabaleTeips = Trips_data.where((trip) {
        if (_filters['summer'] == true && trip.isInSummer != true) {
          return false;
        }
        if (_filters['winter'] == true && trip.isInWinter != true) {
          return false;
        }
        if (_filters['family'] == true && trip.isForFamilies != true) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Morroccan Guide',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.amber,
          fontFamily: 'Kanit',
          textTheme: ThemeData.light().textTheme.copyWith(
              headline5: TextStyle(
                  color: Colors.blue,
                  fontSize: 24,
                  fontFamily: 'Kanit',
                  fontWeight: FontWeight.bold),
              headline6: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: 'Kanit',
                  fontWeight: FontWeight.bold))),
      // home: CategoryScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(),
        '/Category-Trips': (ctx) => CategoryTrip(_availabaleTeips),
        '/Trip-Infos': (ctx) => TripInfos(),
        '/FiltrePage': (ctx) => FiltrePage(_filters, _changeFilters),
      },
    );
  }
}
