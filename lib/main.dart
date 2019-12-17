import 'package:assignment/screens/indexPage.dart';
import 'package:assignment/store/PatientCardStore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/addMedicalNotes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        routes: {
          "/addMedicalNotes": (_) => AddMedicalNotes()
        },
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
            headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            title: TextStyle(
                fontSize: 36.0,
                fontStyle: FontStyle.italic,
                color: Colors.black),
            body1: TextStyle(
                fontSize: 14.0, fontFamily: 'Hind', color: Colors.black),
          ),
        ),
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => PatientCardStore()),
          ],
          child: HomePage(),
        ));
  }
}
