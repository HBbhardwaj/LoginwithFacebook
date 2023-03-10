import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:working/serivces/auth_services.dart';

class Testing extends StatefulWidget {
  const Testing({super.key});

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("SigUp"),
        backgroundColor: Colors.blue.shade200,
      ),
   body: Container(
    height: Get.height,
    width: Get.width,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment:  CrossAxisAlignment.center,
      children: [
        ElevatedButton(onPressed: (){
      AuthService().signInWithGoogle();
        }, child:Text("Google")
        )
      ],
    ),
   ),
    );
  }
}