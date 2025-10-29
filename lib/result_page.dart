import 'package:flutter/material.dart';
import 'home_page.dart';

class ResultPage extends StatelessWidget {
  final String dosha;
  const ResultPage({super.key, required this.dosha});

  Map<String, Map<String, String>> get prakritiData => {
        'Vata': {
          'traits':
              'Dry skin and hair, light build, active and creative mind, tends to anxiety when imbalanced.',
          'diet':
              'Eat warm, oily, and moist foods like soups and stews. Avoid raw and cold foods. Maintain regular routines.',
          'lifestyle':
              'Follow a steady schedule, get enough rest, stay warm, practice yoga and calming meditation.'
        },
        'Pitta': {
          'traits':
              'Medium build, sharp mind, warm body, easily irritable under stress when imbalanced.',
          'diet':
              'Favor cooling foods such as cucumbers, melons, and dairy. Avoid spicy, oily, and sour foods.',
          'lifestyle':
              'Stay cool physically and emotionally, avoid overworking, practice relaxation and deep breathing.'
        },
        'Kapha': {
          'traits':
              'Heavy build, smooth skin, calm and stable nature, may feel lethargic when imbalanced.',
          'diet':
              'Eat light, warm, and spicy foods. Avoid sweet, oily, and heavy meals. Prefer warm water and herbal teas.',
          'lifestyle':
              'Exercise daily, stay active, and engage in stimulating and social activities to stay energized.'
        },
      };

  @override
  Widget build(BuildContext context) {
    final data = prakritiData[dosha]!;
    return Scaffold(
      appBar: AppBar(title: const Text("Your Prakriti Result")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Card(
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "🌿 Your Prakriti: $dosha",
                      style: const TextStyle(
                          fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    Text("Traits: ${data['traits']}",
                        style: const TextStyle(fontSize: 18)),
                    const SizedBox(height: 10),
                    Text("Diet Tips: ${data['diet']}",
                        style: const TextStyle(fontSize: 18)),
                    const SizedBox(height: 10),
                    Text("Lifestyle Suggestions: ${data['lifestyle']}",
                        style: const TextStyle(fontSize: 18)),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => const HomePage()),
                          (route) => false,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text("Retake Test",
                          style:
                              TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
