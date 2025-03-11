import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  // const ProfileScreen({super.key, required int initialIndex});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF6F6F6),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Color.fromARGB(255, 34, 33, 33),
                    child: Icon(Icons.person, size: 40, color: Colors.white),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Test User99",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "testuser99@domain.com",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.settings, color: Colors.grey[600]),
                ],
              ),
              const SizedBox(height: 20),
              _buildProfileCard(Icons.flag, "My Primary Goal", "Save Money"),
              _buildProfileCard(
                  Icons.refresh, "My Current Plan", "Keep track of drinks"),
              _buildProfileCard(
                  Icons.local_drink, "My Usual Drink", "Beer, Medium"),
              _buildProfileCard(Icons.format_list_numbered,
                  "My Regular Drink Counts", "8 drinks"),
              _buildProfileCard(
                  Icons.calendar_today, "My Drinking Pattern", "Weekly"),
              _buildProfileCard(
                  Icons.phone, "My Emergency Contact", "George Smith"),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildProfileCard(IconData icon, String title, String subtitle) {
    return Card(
      // elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: BorderSide(color: Colors.grey[400]!, width: 1),
      ),
      child: SizedBox(
        height: 80, // Fixed height for each card
        child: ListTile(
          leading: Icon(icon, color: Colors.grey[700]),
          title: Text(title,
              style: TextStyle(fontSize: 12, color: Colors.grey[600])),
          subtitle: Text(subtitle,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          trailing: Icon(Icons.edit, color: Colors.grey[700]),
        ),
      ),
    );
  }
}