import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:focus_as_you_wish/app_routes/app_routes.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, Vatsal Jain!', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                Get.toNamed(AppRoutes.streamPage, arguments: {"type" : "streaming"});
              },
              child: const Text('Start Detection!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),

            SizedBox(height: 30,),

            ElevatedButton(
              onPressed: (){
                Get.toNamed(AppRoutes.detectionPage, arguments: {"type" : "picture"});
              },
              child: const Text('Take Picture!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
