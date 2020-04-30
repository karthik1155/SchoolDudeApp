import 'package:flutter/material.dart';
import './utility/dashboard_item.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class Person {
  String name;
  String profileImg;
  String grade;

  Person({this.name, this.profileImg, this.grade});
}

class _DashboardState extends State<Dashboard> {
  List<Person> persons = [
    Person(
        name: 'Suresh Kamath',
        profileImg: 'assets/pic-3.png',
        grade: "Grade II - B"),
  ];

  Widget personDetailCard(Person) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        color: Colors.yellow[700],
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(Person.profileImg)))),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    Person.name,
                    style: TextStyle(color: Colors.white, fontSize: 28),
                  ),
                  Text(
                    Person.grade,
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget personDetailCard1(Person) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        color: Colors.green[700],
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(Person.profileImg)))),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    Person.name,
                    style: TextStyle(color: Colors.white, fontSize: 28),
                  ),
                  Text(
                    Person.grade,
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.menu, size: 35, color: Colors.white),
                Text(
                  'Home',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                Icon(Icons.person_add, size: 35, color: Colors.white)
              ],
            ),
            Column(
                children: persons.map((p) {
              return personDetailCard(p);
            }).toList()),
             Expanded(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                ]),
                flex: 1),Wrap(
              spacing: 17,
              runSpacing: 17,
              children: [
                Item(title: 'Attendance', icon: Icons.home, color: 0xffFED525),
                Item(title: 'Dairy Notes', icon: Icons.message, color: 0xffFD637B),
                Item(
                    title: 'Marks',
                    icon: Icons.grade,
                    color: 0xff21CDFF),
                Item(title: 'Time Table', icon: Icons.calendar_today, color: 0xff7585F6)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
