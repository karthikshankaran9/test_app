// import 'package:demoapp_ka/screens/home_screen.dart';
import 'package:demoapp_ka/screens/main_screen.dart';
import 'package:demoapp_ka/screens/modules_screen.dart';
import 'package:demoapp_ka/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class DrinkBuddyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: const Text(
                  "Hey there, Welcome back!\nPlease find useful quick links below.",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 16),
              // Quick Links with Navigation to Existing Screens
              _buildQuickLink(
                  Icons.dashboard, "My Dashboard", context, MainScreen()),
              _buildQuickLink(
                  Icons.school,
                  "My Training Modules",
                  context,
                  ModulesScreens()),
              _buildQuickLink(
                  Icons.person,
                  "My Profile",
                  context,
                   ProfileScreen()),
              const SizedBox(height: 16),
              // Show More Options
              TextButton(
                onPressed: () {
                  // Handle more options
                },
                child: const Text(
                  "Show more options",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildQuickLink(
      IconData icon, String title, BuildContext context, Widget screen) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey[400]!, width: 1),
        color: Colors.white,
      ),
      child: ListTile(
        leading: Icon(icon, size: 28, color: Colors.black54),
        title: Text(title, style: const TextStyle(fontSize: 16)),
        trailing: const Icon(Icons.arrow_forward_ios,
            size: 18, color: Colors.black54),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => screen));
        },
      ),
    );
  }
}










