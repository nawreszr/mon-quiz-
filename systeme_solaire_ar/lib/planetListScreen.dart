import 'package:flutter/material.dart';
import 'package:systeme_solaire_ar/planetDetailsScreen.dart';

class PlanetListScreen extends StatelessWidget {
  final List<Map<String, String>> planets = [
    {
      'name': 'Mercury',
      'image': 'assets/mercury.png',
      'description': 'Mercury is the smallest planet in our solar system...',
    },
    {
      'name': 'Venus',
      'image': 'assets/venus.png',
      'description': 'Venus is the second planet from the sun...',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Solar System'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: planets.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Image.asset(planets[index]['image']!),
              title: Text(planets[index]['name']!),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlanetDetailsScreen(
                      name: planets[index]['name']!,
                      image: planets[index]['image']!,
                      description: planets[index]['description']!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
