import 'package:flutter/material.dart';

import 'LabComponant/AIR-Condation.dart';
import 'LabComponant/Curtain.dart';
import 'LabComponant/Data-Show.dart';
import 'LabComponant/Door.dart';
import 'LabComponant/LED.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xE36D1900),
        title: const Text(
          "SMART LAB ",
          style: TextStyle(
              fontSize: 45,
              color: Color(0xE1E9E5E3),
              fontStyle: FontStyle.italic),
        ),
        centerTitle: true,
      ),
      body: Center(
          child: Container(
        height: MediaQuery.of(context).size.height * .8,
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 3,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              child: InkWell(
                child: Column(
                  children: const [
                    Icon(Icons.air_outlined),
                    Text("AIR CONDATIOn")
                  ],
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AirCondation()));
                },
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .2,
              child: InkWell(
                child: Column(
                  children: const [
                    Icon(Icons.currency_bitcoin_sharp),
                    Text("Curtain")
                  ],
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Curtain()));
                },
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .2,
              child: InkWell(
                child: Column(
                  children: const [
                    Icon(Icons.show_chart_outlined),
                    Text("DATA SHOW")
                  ],
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DataShow()));
                },
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .2,
              child: InkWell(
                child: Column(
                  children: const [Icon(Icons.door_back_door), Text("Door")],
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Door()));
                },
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .2,
              child: InkWell(
                child: Column(
                  children: const [Icon(Icons.light), Text("LED")],
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const LED()));
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
