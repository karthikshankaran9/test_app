import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ModulesScreens extends StatelessWidget {
  // ModulesScreens({super.key, required int initialIndex});
  final List<Map<String, dynamic>> modules = [
    {"title": "Beat Cravings", "isLocked": false},
    {"title": "Practise Imagery", "isLocked": false},
    {"title": "Saying NO", "isLocked": false},
    {"title": "Mindfulness", "isLocked": false},
    {"title": "Guilt and Shame", "isLocked": true},
    {"title": "Relationship Issues", "isLocked": true},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 60),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildIconWithText(Icons.emoji_events, "11"),
                  _buildIconWithText(Icons.shield, "7"),
                  _buildIconWithText(Icons.emoji_events, "3"),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: modules.length,
                itemBuilder: (context, index) {
                  final module = modules[index];
                  final String title = module["title"];
                  final bool isLocked = module["isLocked"];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: const BorderSide(
                          color: Color.fromARGB(255, 90, 90, 90), width: 1),
                    ),
                    color: isLocked ? Colors.grey[300] : Colors.white,
                    child: Container(
                      height: 80,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      alignment: Alignment.centerLeft,
                      child: ListTile(
                        title: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Icon(
                          isLocked ? Icons.lock : Icons.arrow_forward_ios,
                          color: isLocked ? Colors.grey : Colors.black,
                        ),
                        onTap: isLocked
                            ? null
                            : () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Opening $title")),
                                );
                              },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildIconWithText(IconData icon, String text, {Color iconColor = const Color.fromRGBO(9, 9, 9, 1), Color textColor = Colors.grey}) {
    return Column(
      children: [
        Icon(icon, size: 50, color: iconColor),
        const SizedBox(height: 5),
        Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}









