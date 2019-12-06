import 'package:assignment/screens/homePage.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final userWidget = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      ClipRRect(
        borderRadius: BorderRadius.circular(40.0),
        
        child: Container(
          width: 30,
          height: 30,
          child: Image.asset("images/img_user.jpg"),
        ),
      ),
      SizedBox(
        width: 5.0,
      ),
      Text(
        'Sammy',
        style: TextStyle(
            color: Colors.grey, fontSize: 18.0, fontWeight: FontWeight.w300),
      ),
      SizedBox(
        width: 5.0,
      ),
      Icon(
        LineIcons.chevron_down,
        color: Colors.black,
        size: 15.0,
      )
    ],
  );
  int selectedIndex = 0;
  final widgetOptions = [
    FirstPage(),
    Text('Add new beer'),
    Text('Favourites'),
    Text('Add new beer'),
    Text('Favourites'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(LineIcons.bars),
          onPressed: null,
        ),
        elevation: 0.0,
        centerTitle: true,
        title: userWidget,
        actions: <Widget>[
          IconButton(
            onPressed: null,
            icon: Icon(LineIcons.plus_circle),
          )
        ],
      ),
      body:widgetOptions[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(LineIcons.bars), title: Text('New Beer')),
          BottomNavigationBarItem(
              icon: Icon(LineIcons.clipboard), title: Text('New Beer')),
          BottomNavigationBarItem(
              icon: Icon(LineIcons.envelope_o), title: Text('Favourites')),
          BottomNavigationBarItem(
              icon: Icon(LineIcons.clock_o), title: Text('New Beer')),
          BottomNavigationBarItem(
              icon: Icon(LineIcons.user_plus), title: Text('Favourites')),
        ],
        currentIndex: selectedIndex,
        fixedColor: Colors.black,
        unselectedItemColor: Colors.grey[600],
        onTap: onItemTapped,
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
