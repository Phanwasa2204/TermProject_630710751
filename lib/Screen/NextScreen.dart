import 'package:flutter/material.dart';

class NextScreen extends StatelessWidget {
  final List<Map<String, dynamic>> selectedMenu;

  const NextScreen({Key? key, required this.selectedMenu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[200],
        title: Text('Selected Menu'),
      ),
      body: ListView.builder(
        itemCount: selectedMenu.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              title: Text(
                selectedMenu[index]['name'],
                style: TextStyle(fontSize: 18),
              ),
              subtitle: Text(
                'Price: ${selectedMenu[index]['price']}.-',
                style: TextStyle(fontSize: 16),
              ),
            ),
          );
        },
      ),
    );
  }
}