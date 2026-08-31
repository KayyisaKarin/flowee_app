import 'package:flutter/material.dart';

class WaScreen extends StatelessWidget {
  const WaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "WhatsApp",
          style: TextStyle(
            color: Colors.green,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Icon(Icons.camera_alt_outlined, color: Colors.black, size: 25),
          SizedBox(width: 22),
          Icon(Icons.search, color: Colors.black, size: 25),
          SizedBox(width: 20),
          Icon(Icons.more_vert, color: Colors.black, size: 25),
        ],
      ),

      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.group)),
              title: Text("Bareng Ms Tia"),
              subtitle: Text("Tiba Tiba Challenge"),
              trailing: Text("09:03"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
      ),

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black87,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: "Chats",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_outline),
            label: "Updates",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_add_outlined),
            label: "Communities",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ring_volume_outlined),
            label: "Call",
          ),
        ],
      ),
    );
  }
}
