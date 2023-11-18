import 'package:flutter/material.dart';
import 'package:untitled2/Screen/Menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ReservationScreen(),
    );
  }
}

class ReservationScreen extends StatefulWidget {
  @override
  _ReservationScreenState createState() => _ReservationScreenState();
}

enum RoomType { normal, private, event }

class _ReservationScreenState extends State<ReservationScreen> {
  int _selectedPeople = 1;
  RoomType? _selectedRoom;
  List<String> amenities = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/food.jpg'), // Replace with your image asset path
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'จำนวนคน',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButton<int>(
                    value: _selectedPeople,
                    onChanged: (int? newValue) {
                      setState(() {
                        _selectedPeople = newValue!;
                      });
                    },
                    items: List.generate(20, (index) {
                      return DropdownMenuItem<int>(
                        value: index + 1,
                        child: Padding(
                          padding: EdgeInsets.only(left: 40),
                          child: Text(
                            '${index + 1} คน',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'ห้อง',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: RadioListTile<RoomType>(
                        title: Text('ห้องธรรมดา'),
                        value: RoomType.normal,
                        groupValue: _selectedRoom,
                        onChanged: (RoomType? value) {
                          setState(() {
                            _selectedRoom = value;
                          });
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: RadioListTile<RoomType>(
                        title: Text('ห้องส่วนตัว'),
                        value: RoomType.private,
                        groupValue: _selectedRoom,
                        onChanged: (RoomType? value) {
                          setState(() {
                            _selectedRoom = value;
                          });
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: RadioListTile<RoomType>(
                        title: Text('ห้องสำหรับจัดงานเลี้ยง'),
                        value: RoomType.event,
                        groupValue: _selectedRoom,
                        onChanged: (RoomType? value) {
                          setState(() {
                            _selectedRoom = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'สิ่งอำนวยความสะดวก',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CheckboxListTile(
                    title: Text('เครื่องปรับอากาศ'),
                    value: amenities.contains('เครื่องปรับอากาศ'),
                    onChanged: (bool? value) {
                      updateAmenities('เครื่องปรับอากาศ', value);
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CheckboxListTile(
                    title: Text('พัดลม'),
                    value: amenities.contains('พัดลม'),
                    onChanged: (bool? value) {
                      updateAmenities('พัดลม', value);
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CheckboxListTile(
                    title: Text('พื้นที่สูบบุหรี่'),
                    value: amenities.contains('พื้นที่สูบบุหรี่'),
                    onChanged: (bool? value) {
                      updateAmenities('พื้นที่สูบบุหรี่', value);
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CheckboxListTile(
                    title: Text('ห้องปลอดบุหรี่'),
                    value: amenities.contains('ห้องปลอดบุหรี่'),
                    onChanged: (bool? value) {
                      updateAmenities('ห้องปลอดบุหรี่', value);
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CheckboxListTile(
                    title: Text('บริการอินเทอร์เน็ต'),
                    value: amenities.contains('บริการอินเทอร์เน็ต'),
                    onChanged: (bool? value) {
                      updateAmenities('บริการอินเทอร์เน็ต', value);
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CheckboxListTile(
                    title: Text('นำสัตว์เลี้ยงเข้าได้'),
                    value: amenities.contains('นำสัตว์เลี้ยงเข้าได้'),
                    onChanged: (bool? value) {
                      updateAmenities('นำสัตว์เลี้ยงเข้าได้', value);
                    },
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.fromLTRB(850, 30, 100, 30),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MenuScreen()),
                      );
                    },
                    child: Text('ต่อไป'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void updateAmenities(String amenity, bool? value) {
    setState(() {
      if (value != null && value) {
        amenities.add(amenity);
      } else {
        amenities.remove(amenity);
      }
    });
  }
}