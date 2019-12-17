import 'package:assignment/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddMedicalNotes extends StatefulWidget {
  @override
  _AddMedicalNotesState createState() => _AddMedicalNotesState();
}

class _AddMedicalNotesState extends State<AddMedicalNotes> {
  final _formKey = GlobalKey<FormState>();

  final _vaccine = TextEditingController();
  final _duration = TextEditingController();
  final _notes = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget vaccineNameField = TextFormField(
      // This handles the email field of the for the application
      obscureText: false,
      decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 17.0),
          hintText: "Vaccine name",
          filled: true,
          fillColor: Color(0xFFF7F7FB),
          border: InputBorder.none),
      // enabled: _sending ? false : true,
      keyboardType: TextInputType.text,
      controller: _vaccine,
      validator: (value) {
        if (value.isEmpty) {
          return 'Kindly fill in the form.';
        } else if (value == ' ') {
          return 'Form can\'t be empty';
        } else if (value.length < 6) {
          return 'Tags too short';
        }
        return null;
      },
    );

    Widget durationField = TextFormField(
      obscureText: false,
      decoration: InputDecoration(
          suffixIcon: Icon(Icons.calendar_today),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 17.0),
          hintText: "Recieved date",
          filled: true,
          fillColor: Color(0xFFF7F7FB),
          border: InputBorder.none),
      // enabled: _sending ? false : true,
      keyboardType: TextInputType.text,
      controller: _duration,
      validator: (value) {
        if (value.isEmpty) {
          return 'Kindly fill in the form.';
        } else if (value == ' ') {
          return 'Form can\'t be empty';
        } else if (value.length < 6) {
          return 'Tags too short';
        }
        return null;
      },
    );

    Widget notesField = TextFormField(
      obscureText: false,
      maxLines: 7,
      decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 17.0),
          hintText: "Notes",
          filled: true,
          fillColor: Color(0xFFF7F7FB),
          border: InputBorder.none),
      // enabled: _sending ? false : true,
      keyboardType: TextInputType.text,
      controller: _notes,
      validator: (value) {
        if (value.isEmpty) {
          return 'Kindly fill in the form.';
        } else if (value == ' ') {
          return 'Form can\'t be empty';
        } else if (value.length < 6) {
          return 'Tags too short';
        }
        return null;
      },
    );

    Widget sizedBox = SizedBox(
      height: 20,
    );

    Widget formGroup = Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 0),
        child: Column(
          children: <Widget>[
            sizedBox,
            vaccineNameField,
            sizedBox,
            durationField,
            sizedBox,
            notesField
          ],
        ),
      ),
    );

    Widget secondPart = Padding(
      padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          sizedBox,
          Text(
            'Optional',
            style: TextStyle(fontSize: 20.0),
          ),
          sizedBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Reminder',
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w800),
              ),
              CupertinoSwitch(
                onChanged: (value) => print(value),
                value: true,
              )
            ],
          ),
          sizedBox,
          Divider(),
          sizedBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Reminder Time'),
              Text(
                'Apr 23, 2019 - 16:45',
                style: TextStyle(color: Colors.blue),
              ),
              // Icon(Icons.arrow_right)
            ],
          ),
          sizedBox,
          Divider(),
          sizedBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Alert'),
              Text(
                '1 hour before',
                style: TextStyle(color: Colors.blue),
              ),
              // Icon(Icons.arrow_right)
            ],
          ),
          sizedBox,
          Divider(),
          sizedBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Repeat'),
              Text(
                'Never',
                style: TextStyle(color: Colors.blue),
              ),
              // Icon(Icons.arrow_right)
            ],
          )
        ],
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Add Vacines Manual',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left),
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: <Widget>[
          FlatButton(
            child: Text(
              "Save",
              style: TextStyle(color: Colors.blue),
            ),
            onPressed: () => print('hello world'),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[formGroup, secondPart, SizedBox(height: 40,)],
        ),
      ),
    );
  }
}
