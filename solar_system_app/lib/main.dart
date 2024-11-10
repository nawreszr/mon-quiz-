import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(SolarSystemApp());
}

class SolarSystemApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [const Locale('ar', '')],
      home: PlanetsScreen(),
    );
  }
}

class PlanetsScreen extends StatelessWidget {
  final  planets =
  FirebaseFirestore.instance.collection('planets');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('النظام الشمسي')),
      body: StreamBuilder<QuerySnapshot>(
        stream: planets.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const CircularProgressIndicator();
          final planetDocs = snapshot.data!.docs;
          return ListView.builder(
            itemCount: planetDocs.length,
            itemBuilder: (context, index) {
              final planet = planetDocs[index];
              return ListTile(
                title: Text(planet['name']),
                subtitle: Text(planet['description']),
              );
            },
          );
        },
      ),
    );
  }
}
