import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:focus_as_you_wish/controllers/detection_controller.dart';
import 'package:get/get.dart';

class DetectPicture extends GetView<DetectionController> {
  const DetectPicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detect Pictures',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Obx(() {
        if(controller.isInitialized.value == false){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        else {
          return Stack(
            alignment: Alignment.center,
            children: [
              CameraPreview(controller.cameraController),
              AspectRatio(aspectRatio: 9.0/16.0),
              Positioned(
                right: 10,
                bottom: 10,
                child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black45.withOpacity(0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Obx(
                          () => Text(controller.result.value,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.redAccent,
                        ),
                      ),
                    )
                ),
              )
            ],
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await controller.takePicture();
        } ,
        child: const Icon(Icons.camera, size: 40,)
      ),
    );
  }
}
