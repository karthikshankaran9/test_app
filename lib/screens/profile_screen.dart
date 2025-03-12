import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Define user profile data
  List<Map<String, String>> profileData = [
    {"title": "My Primary Goal", "subtitle": "Save Money"},
    {"title": "My Current Plan", "subtitle": "Keep track of drinks"},
    {"title": "My Usual Drink", "subtitle": "Beer, Medium"},
    {"title": "My Regular Drink Counts", "subtitle": "8 drinks"},
    {"title": "My Drinking Pattern", "subtitle": "Weekly"},
    {"title": "My Emergency Contact", "subtitle": "George Smith"},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[900],
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Color.fromARGB(255, 34, 33, 33),
                    child: Icon(Icons.person, size: 40, color: Colors.white),
                  ),
                   SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Text(
                          "Test User99",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        Text("testuser99@domain.com", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                   Icon(Icons.settings, color: Colors.white),
                ],
              ),
              const SizedBox(height: 20),
              
              // Build profile cards dynamically
              Expanded(
                child: ListView.builder(
                  itemCount: profileData.length,
                  itemBuilder: (context, index) {
                    return _buildProfileCard(
                      profileData[index]["title"]!,
                      profileData[index]["subtitle"]!,
                      index,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard(String title, String subtitle, int index) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: BorderSide(color: Colors.grey[400]!, width: 1),
      ),
      child: ListTile(
        leading: const Icon(Icons.flag, color: Colors.grey),
        title: Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        subtitle: Text(subtitle, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        trailing: IconButton(
          icon: const Icon(Icons.edit, color: Colors.grey),
          onPressed: () => _showEditPopup(context, index), // Pass index to update specific item
        ),
      ),
    );
  }

  void _showEditPopup(BuildContext context, int index) {
    TextEditingController titleController = TextEditingController(text: profileData[index]["title"]);
    TextEditingController subtitleController = TextEditingController(text: profileData[index]["subtitle"]);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Edit Details"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: "Title"),
              ),
              TextField(
                controller: subtitleController,
                decoration: const InputDecoration(labelText: "Subtitle"),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text("Save"),
              onPressed: () {
                setState(() {
                  profileData[index]["title"] = titleController.text;
                  profileData[index]["subtitle"] = subtitleController.text;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
