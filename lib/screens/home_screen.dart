import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/drink_tracker_provider.dart';
import '../widgets/drink_chart.dart';
import '../widgets/grid_item.dart';

class HomeScreen extends StatelessWidget {
  void showPopup(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              child:const Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    final drinkProvider = Provider.of<DrinkTrackerProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF6F6F6),
        body: Padding(
          padding:const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          CircularProgressIndicator(
                            value: 0.6,
                            strokeWidth: 6,
                            backgroundColor: Colors.grey.shade300,
                            valueColor:const AlwaysStoppedAnimation<Color>(Colors.black),
                          ),
                          const Text("60%", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
                     const SizedBox(height: 8),
                     const Text("Plan Progress", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const Text("Drink Less, Save Money", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  const Icon(Icons.arrow_forward_ios),
                ],
              ),
              const SizedBox(height: 5),
             const SizedBox(
                height: 200,
                child: DrinkChart(),
              ),
              const SizedBox(height:20),
             const Text("Last 5 Drinking and Spending Patterns", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
             const SizedBox(height: 20),
              Container(
                padding:const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'images/beer-mug.png',
                      width: 30,
                      height: 30,
                    ),
                    if (drinkProvider.drinks > 0)
                      IconButton(
                        icon:const Icon(Icons.remove),
                        onPressed: drinkProvider.decreaseDrinks,
                      ),
                     const SizedBox(width: 10),
                    Text(
                      drinkProvider.drinks.toString(),
                      style:const  TextStyle(fontSize: 24),
                    ),
                    IconButton(
                      icon:const Icon(Icons.add),
                      onPressed: drinkProvider.increaseDrinks,
                    ),
                    IconButton(
                      icon:const Icon(Icons.settings),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  physics:const NeverScrollableScrollPhysics(),
                 children: [
                    GridItem(
                      title: "Add Goal",
                      icon: Icons.flag,
                      onTap: () => showPopup(context, "Add Goal", "Set a new goal for yourself."),
                    ),
                    GridItem(
                      title: "My Training",
                      icon: Icons.fitness_center,
                      onTap: () => showPopup(context, "My Training", "View and manage your training sessions."),
                    ),
                    GridItem(
                      title: "Reflect",
                      icon: Icons.self_improvement,
                      onTap: () => showPopup(context, "Reflect", "Take time to reflect on your progress."),
                    ),
                    GridItem(
                      title: "My Progress",
                      icon: Icons.show_chart,
                      onTap: () => showPopup(context, "My Progress", "Track your achievements and progress."),
                    ),
                    GridItem(
                      title: "Helpline",
                      icon: Icons.phone,
                      onTap: () => showPopup(context, "Helpline", "Contact support for assistance."),
                    ),
                    GridItem(
                      title: "SOS",
                      icon: Icons.warning,
                      isCircle: true,
                      onTap: () => showPopup(context, "SOS", "Emergency alert activated!"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

