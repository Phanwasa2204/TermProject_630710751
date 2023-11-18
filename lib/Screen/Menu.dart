import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:untitled2/Screen/NextScreen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  MenuScreenState createState() => MenuScreenState();
}

class MenuScreenState extends State<MenuScreen> {
  List Menu = [];

  // Add a Set to keep track of selected menu items
  Set<int> selectedItems = Set<int>();

  Future<String> getData() async {
    var url = Uri.https('menu--pla070261.repl.co', 'menu', {'q': '{http}'});
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      print(jsonResponse);

      this.setState(() {
        Menu = jsonResponse;
      });
    }
    return 'success';
  }

  @override
  void initState() {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เมนูอาหาร'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: Menu.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: Icon(Icons.local_dining_sharp),
                title: Text(Menu[index]['id']),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${Menu[index]['name']}'),
                    Text('ราคา: ${Menu[index]['price']}.-'),
                  ],
                ),
                trailing: Checkbox(
                  value: selectedItems.contains(index),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value != null && value) {
                        selectedItems.add(index);
                      } else {
                        selectedItems.remove(index);
                      }
                    });
                  },
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle the selected items, you can navigate to the next screen and pass the selected items
          List<Map<String, dynamic>> selectedMenu = [];
          for (int selectedIndex in selectedItems) {
            selectedMenu.add(Menu[selectedIndex]);
          }

          // Navigate to the next screen and pass the selected menu
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NextScreen(selectedMenu: selectedMenu),
            ),
          );
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}