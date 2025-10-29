import 'package:flutter/material.dart';
import 'result_page.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({super.key});

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  final Map<String, int> scores = {'Vata': 0, 'Pitta': 0, 'Kapha': 0};
  int currentQuestion = 0;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. What is your skin type?',
      'options': {
        'Dry': 'Vata',
        'Oily': 'Pitta',
        'Balanced/Smooth': 'Kapha',
      },
    },
    {
      'question': '2. What best describes your body build?',
      'options': {
        'Thin and light': 'Vata',
        'Muscular and medium': 'Pitta',
        'Heavy or broad': 'Kapha',
      },
    },
    {
      'question': '3. How is your hair type?',
      'options': {
        'Dry, frizzy': 'Vata',
        'Oily, fine': 'Pitta',
        'Thick, smooth': 'Kapha',
      },
    },
    {
      'question': '4. How are your eyes?',
      'options': {
        'Small and dull': 'Vata',
        'Medium and sharp': 'Pitta',
        'Large and calm': 'Kapha',
      },
    },
    {
      'question': '5. What is your general mindset?',
      'options': {
        'Restless and creative': 'Vata',
        'Intense and focused': 'Pitta',
        'Calm and steady': 'Kapha',
      },
    },
    {
      'question': '6. How is your memory?',
      'options': {
        'Quick but forgets easily': 'Vata',
        'Sharp and accurate': 'Pitta',
        'Slow but long-term': 'Kapha',
      },
    },
    {
      'question': '7. How are your emotions usually?',
      'options': {
        'Anxious or worried': 'Vata',
        'Irritable or angry': 'Pitta',
        'Content and patient': 'Kapha',
      },
    },
    {
      'question': '8. What kind of food do you prefer?',
      'options': {
        'Warm and oily': 'Vata',
        'Cool and refreshing': 'Pitta',
        'Light and spicy': 'Kapha',
      },
    },
    {
      'question': '9. How do you usually sleep?',
      'options': {
        'Light, disturbed sleep': 'Vata',
        'Moderate sleep': 'Pitta',
        'Deep and long sleep': 'Kapha',
      },
    },
    {
      'question': '10. How are your daily energy levels?',
      'options': {
        'Variable, bursts of energy': 'Vata',
        'High and consistent': 'Pitta',
        'Stable but low': 'Kapha',
      },
    },
    {
      'question': '11. Which weather do you prefer?',
      'options': {
        'Warm and cozy': 'Vata',
        'Cool and refreshing': 'Pitta',
        'Warm and dry': 'Kapha',
      },
    },
    {
      'question': '12. How do you respond to stress?',
      'options': {
        'Anxious and restless': 'Vata',
        'Irritable or frustrated': 'Pitta',
        'Calm or indifferent': 'Kapha',
      },
    },
  ];

  void selectOption(String dosha) {
    scores[dosha] = (scores[dosha] ?? 0) + 1;

    if (currentQuestion < questions.length - 1) {
      setState(() => currentQuestion++);
    } else {
      String result = scores.entries.reduce((a, b) => a.value > b.value ? a : b).key;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ResultPage(dosha: result),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final q = questions[currentQuestion];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Prakriti Assessment"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                q['question'],
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ...q['options'].entries.map((e) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      minimumSize: const Size(300, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () => selectOption(e.value),
                    child: Text(e.key,
                        style: const TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                );
              }),
              const SizedBox(height: 30),
              Text(
                "Question ${currentQuestion + 1} of ${questions.length}",
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
