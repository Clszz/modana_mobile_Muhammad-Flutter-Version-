import 'package:flutter/material.dart';
import 'dart:async';
import 'package:modana_mobile_muhammad_flutter/services/Services.dart';

import 'models/publics.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PublicList(),
    );
  }
}

class PublicList extends StatefulWidget {
  PublicList() : super();

  final String title = "API TEST";

  @override
  PublicListState createState() => PublicListState();
}

class PublicListState extends State<PublicList> {
  Publics publics;
  String title;

  @override
  void initState() {
    super.initState();
    publics = Publics();

    Services.getPublics().then((publicsFromServer) {
      setState(() {
        publics = publicsFromServer;
        title = widget.title;
      });
    });
  }

  Widget list() {
    return publics.entries.isNotEmpty
        ? Expanded(
            child: ListView.builder(
            itemCount: publics.entries == null ? 0 : publics.entries.length,
            itemBuilder: (BuildContext context, int index) {
              return row(index);
            },
          ))
        : Center(
            child: Container(
              padding: EdgeInsets.fromLTRB(100, 300, 100, 100),
              child: Text(
                'NO DATA',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
              ),
            ),
          );
  }

  Widget row(int index) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              publics.entries[index].Description ?? '',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            Chip(
              label: Text(
                publics.entries[index].Category ?? '',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
              backgroundColor: Colors.lightBlue,
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              publics.entries[index].Link ?? '',
              style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.lightBlue,
                  decoration: TextDecoration.underline),
            ),
          ],
        ),
      ),
    );
  }

  Widget searchTF() {
    return Container(
      width: 350.0,
      child: TextField(
        decoration: InputDecoration(
          suffixIcon: Container(
            child: IconButton(
              icon: Image.asset('assets/search.png'),
              iconSize: 2,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(
                25.0,
              ),
            ),
          ),
          filled: true,
          fillColor: Colors.white60,
          contentPadding: EdgeInsets.all(15.0),
          hintText: 'Search by Category',
        ),
        onChanged: (string) {
          Services.getPublics().then((publicsFromServer) {
            setState(() {
              publics = Publics.filterList(publicsFromServer, string);
            });
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            searchTF(),
            SizedBox(
              height: 10.0,
            ),
            list(),
          ],
        ),
      ),
    );
  }
}
