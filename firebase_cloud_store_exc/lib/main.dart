import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_cloud_store_exc/database_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_cloud_store_exc/auth_services.dart';
import 'package:firebase_cloud_store_exc/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return StreamProvider.value(
    //   value: AuthServices.firebaseAuthStream,
    //   child: MaterialApp(
    //     home: Wrapper(),
    //   ),
    // );
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text("Cloud Firestore demo")),
          body: Container(
            child: Center(
              child: Column(
                children: [
                  RaisedButton(onPressed: (){
                    CloudFirestore.addOrUpdateData("1", harga: 10000, nama: "ayam");
                  }, child: Text("add masker data"),),
                  RaisedButton(onPressed: ()async{
                    DocumentSnapshot snapshot =  await CloudFirestore.getData("1");
                    print(snapshot.data());
                  }, child: Text("get masker data"),),
                  RaisedButton(onPressed: (){
                    CloudFirestore.deleteData("1");
                  }, child: Text("delete masker data"),),
                ],
              ),
            ),
          )),
    );
  }
}
