import 'package:assignment/screens/folderIcon.dart';
import 'package:assignment/store/PatientCardStore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    final heightWidget = SizedBox(
      height: 20.0,
    );
    final headerWidget = Container(
        margin: const EdgeInsets.only(left: 40.0, top: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Medical Records",
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w300),
            ),
            heightWidget,
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              child: Material(
                elevation: 3.0,
                borderRadius: BorderRadius.all(Radius.circular(5)),
                child: TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 14.0),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      border: InputBorder.none),
                ),
              ),
            )
          ],
        ));
    Widget mostRecentWidget() {
      return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 2.78,
        child: Consumer<PatientCardStore>(
          builder: (consumer, patientCardStore, _) {
            return GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 17.0,
                  mainAxisSpacing: 7.0),
              padding: const EdgeInsets.all(10.0),
              itemBuilder: (context, i) {
                final files = patientCardStore.patientCards[i];
                return GestureDetector(
                  onTap: () {
                    if (files.fileName == 'Lab tests'){
                      Navigator.pushNamed(context, '/addMedicalNotes');
                    }
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center, //add this
                    children: <Widget>[
                      FileIcon(),
                      SizedBox(
                        height: 10.0,
                      ),
                      Center(
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Text(files.fileName),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Text(
                                files.dateAdded,
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: patientCardStore.patientCards.length,
            );
          },
        ),
      );
    }


    sheetTag(String text) {
      return ClipRRect(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0)),
          child: Container(
            color: Colors.grey[300],
            child: Padding(
              padding: EdgeInsets.all(9.0),
              child: Text(
                text,
                style: TextStyle(color: Colors.grey[500]),
              ),
            ),
          ));
    }

    return Container(
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          headerWidget,
          heightWidget,
          sheetTag("Most Recent"),
          mostRecentWidget(),
          sheetTag("Last Month"),
          mostRecentWidget(),
        ],
      )),
    );
  }
}
