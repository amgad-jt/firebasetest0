import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
//import 'package:firebase_database/ui/firebase_animated_list.dart';

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

// Import the firebase_core plugin

class AirCondation extends StatefulWidget {
  //lib core الاساسية لربط الاتصال
  // ignore: use_key_in_widget_constructors
  const AirCondation({this.app});
  final FirebaseApp? app;

  @override
  _AirCondationState createState() => _AirCondationState();
}

class _AirCondationState extends State<AirCondation> {
// lib databaseلربط مع الداتا بيز real time علشان اضع داتا بها
  final referenceDatase = FirebaseDatabase.instance;
  bool status7 = false;

  //late DatabaseReference _counterRef; //علشان نجيب بيانات من الداتابيزobj

  @override
  void initState() {
    //علشان نوصل للداتا الموجودة اول فتح الصفحة
    //عمل objمن كلاس الداتا بيز بعد التاكد من الاتصال
    final FirebaseDatabase database = FirebaseDatabase(app: widget.app);
    //اخد مرجع بيانات الداتا ووصول الي مكان تخزين معين باسم
    // _counterRef = database.reference().child('Door');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //obj  من كلاس الداتابيز   referece    علشان اضع بيانات من خلال تحديد مكانها obj
    final AIR_Condition = referenceDatase.reference();

    return Scaffold(

        ///app bar
        appBar: AppBar(
          backgroundColor: const Color(0xE36D1900),
          title: const Text(
            "AIR_Condition ",
            style: TextStyle(
                fontSize: 45,
                color: Color(0xE1E9E5E3),
                fontStyle: FontStyle.italic),
          ),
        ),

        ///body
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: const Color(0x00a9867a),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Text("statue:$status7"),

                      ///the button
                      FlutterSwitch(
                        width: 150.0,
                        height: 70.0,
                        toggleSize: 50.0,
                        value: status7,
                        borderRadius: 30.0,
                        padding: 2.0,
                        activeToggleColor: const Color(0xFF952907),
                        inactiveToggleColor: const Color(0xFFE7A261),
                        activeSwitchBorder: Border.all(
                          color: const Color(0xFFAC2F09),
                          width: 6.0,
                        ),
                        inactiveSwitchBorder: Border.all(
                          color: const Color(0xFFE7A261),
                          width: 6.0,
                        ),
                        activeColor: const Color(0xFFC8A989),
                        inactiveColor: Colors.white,
                        activeIcon: const Icon(
                          Icons.lightbulb,
                          color: Color(0xFFFBC513),
                        ),
                        inactiveIcon: const Icon(
                          Icons.lightbulb,
                          color: Color(0xFF908865),
                        ),
                        onToggle: (val) {
                          setState(() {
                            status7 = val;

                            if (val) {
                              AIR_Condition //استخدام كائن من كلاس الداتا نفسة علشان ادخل بيانات
                                      .child(
                                          'AIR_Condition') //ادخال بيانات باسم رئيسي(اب) للبيانات الفرعية

                                  .child('state') //عمل اسم متفرع(ابن)
                                  .set('on') //قيمة للابن من الادخال
                                  .asStream();
                            } else {
                              AIR_Condition //استخدام كائن من كلاس الداتا نفسة علشان ادخل بيانات
                                      .child(
                                          'AIR_Condition') //ادخال بيانات باسم رئيسي(اب) للبيانات الفرعية

                                  .child('state') //عمل اسم متفرع(ابن)
                                  .set('off') //قيمة للابن من الادخال
                                  .asStream();
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

/*
  Flexible(               //عمل قائمة للادخالات التي موجودة في الداتا بيز
                child: FirebaseAnimatedList(
                  shrinkWrap: true,
                  query: _counterRef, //المرجع بيانات قائمة معينة في الداتا معرفة اعلي في فتح الصفحة
               itemBuilder: (BuildContext context,    //بناء جلب البيانات
                  DataSnapshot snapshot,    // الداتا بترجع في لقطة بيانات لها هنا
                 Animation<dynamic>animation,
                 dynamic index
                  ){
                
                var i =snapshot.key;
                 var m =snapshot.value.toString();
                    return  ListTile(    // رجوع علي هيئة ليست
                      trailing: Icon(Icons.wifi,color:  Color(0xFFAC2F09),size: 30,),
                      //عرض بيانات من لقطة البيانات المستلمة ووصول الي قيمة الاولي 
                      title:Text(i,
                      style: TextStyle(
                        fontSize: 30,color: Color(0x8C6E341A)
                        ,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),),
                      subtitle:Text(m,
                      style: TextStyle(
                        fontSize: 50,color: Color(0x8CDD4D0B),fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),) ,
                                 );
                  

                  }
                ),
                ),
*/

//------------
