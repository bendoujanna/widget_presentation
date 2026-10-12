import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: RefreshDemo()));

class RefreshDemo extends StatefulWidget {
  const RefreshDemo({super.key});

  @override
  State<RefreshDemo> createState() => _RefreshDemoState();
}

class _RefreshDemoState extends State<RefreshDemo> {

  List<Map<String, String>> inbox = [
    {"message": "Pull down to refresh", "time": "10:05"},
    {"message": "Welcome to the presentation.", "time": "10:00"},
    {"message": "Hello everyone!", "time": "9:50"},
  ];

  Future<void> fetchNewMessage() async {
    // Fake a 2-second backend database delay
    await Future.delayed(const Duration(seconds: 2));

    final now = DateTime.now();
    final timeString = "${now.hour}:${now.minute.toString().padLeft(2, '0')}";

    setState(() {
      inbox.insert(0, {
        "message": "New message just arrived",
        "time": timeString
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Inbox")),
      
      // Wrap the list so it can be pulled
      body: RefreshIndicator(
        onRefresh: fetchNewMessage,
        color: const Color.fromARGB(215, 73, 1, 86), 
        
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: inbox.length,
          itemBuilder: (context, index) {
            
            // How each message looks
            return Card(
              child: ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.mail),
                ),
                title: Text(inbox[index]["message"]!),
                trailing: Text(
                  inbox[index]["time"]!,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
            );
            
          },
        ),
      ),
    );
  }
}