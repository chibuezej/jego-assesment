import 'package:flutter/material.dart';
import 'package:jego_test/screens/vehicle_list_page.dart';
import 'pages/vehicle_preview_page.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vehicle Rental App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const VehiclePreviewPage(),
         routes: {
        '/vehicle-list': (context) => const VehicleListPage()
      },
    );
  }
}
