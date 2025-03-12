import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import '../providers/drink_tracker_provider.dart';
import '../widgets/drink_chart.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  void showPopup(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              child: const Text("Close"),
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
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: SafeArea(
        child: Column(
          children: [
            // Upper Section
            Container(
              color: Colors.blue[900],
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Prevent excessive height
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          alignment: Alignment.center, 
                          children: [
                            Container(
                              width:100, 
                              height: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                    Colors.grey[200], 
                              ),
                            ),
                            
                            CircularPercentIndicator(
                              radius: 55.0, 
                              lineWidth: 10.0,
                              percent: 1.0, 
                              progressColor: Colors.white, 
                              backgroundColor: Colors.transparent,
                            ),
                            CircularPercentIndicator(
                              radius: 50.0, 
                              lineWidth: 8.0,
                              percent: 0.87, 
                              center:const Text(
                                "87%",
                                style: TextStyle(
                                  fontSize: 22, 
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Colors.green, 
                                ),
                              ),
                              progressColor: Colors.green, 
                              backgroundColor: Colors.transparent,
                              circularStrokeCap: CircularStrokeCap
                                  .round, 
                              startAngle:
                                  190, 
                            ),
                          ],
                        ),
                      const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Plan Progress",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                            Text("Drink less, Save Money",
                                style: TextStyle(color: Colors.white70)),
                          ],
                        ),
                        const Icon(Icons.arrow_forward_ios, color: Colors.white),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                 const SizedBox(height: 200, child: DrinkChart()),
                  const SizedBox(height: 10),
                  const Text("Last 5 Drinking and Spending Patterns",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: 400, 
                  child: Stack(
                    children: [
                      Positioned.fill(
                        top: 80, 
                        child: Container(
                          //height: 200,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(0),
                            ),
                          ),
                          padding: const EdgeInsets.all(16.0),
                          child: GridView.count(
                            crossAxisCount: 3,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              _buildMenuItem(
                                Icons.flag,
                                "Add Goal",
                                onTap: () => showPopup(context, "Add Goal",
                                    "Set a new goal for yourself."),
                              ),
                              _buildMenuItem(
                                Icons.psychology,
                                "My Training",
                                onTap: () => showPopup(context, "My Training",
                                    "View and manage your training sessions."),
                              ),
                              _buildMenuItem(
                                Icons.self_improvement,
                                "Reflect",
                                onTap: () => showPopup(context, "Reflect",
                                    "Take time to reflect on your progress."),
                              ),
                              _buildMenuItem(
                                Icons.bar_chart,
                                "My Progress",
                                onTap: () => showPopup(context, "My Progress",
                                    "Track your achievements and progress."),
                              ),
                              _buildMenuItem(
                                Icons.phone,
                                "Helpline",
                                onTap: () => showPopup(context, "Helpline",
                                    "Contact support for assistance."),
                              ),
                              _buildMenuItem(
                                Icons.sos,
                                "SOS",
                                color: Colors.red,
                                onTap: () => showPopup(context, "SOS",
                                    "Emergency alert activated!"),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 16,
                        right: 16,
                        top: 30,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 6,
                                spreadRadius: 2,
                                offset: const Offset(2, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                'images/beer-mug.png',
                                width: 30,
                                height: 30,
                              ),
                              if (drinkProvider.drinks > 0)
                                IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: drinkProvider.decreaseDrinks,
                                ),
                              Text(
                                drinkProvider.drinks.toString(),
                                style: const TextStyle(fontSize: 24),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: drinkProvider.increaseDrinks,
                              ),
                              IconButton(
                                icon:const Icon(Icons.filter_list),
                                onPressed: () => showPopup(
                                    context,
                                    "Drink Count",
                                    "You have had ${drinkProvider.drinks} drinks."),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildMenuItem(IconData icon, String label,
      {Color color = Colors.blue, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 5),
            Text(label, style: const TextStyle(color: Colors.black)),
          ],
        ),
      ),
    );
  }
}