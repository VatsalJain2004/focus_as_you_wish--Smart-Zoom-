import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:focus_as_you_wish/controllers/detection_controller.dart';
import 'package:get/get.dart';

class StreamDetectionPage extends GetView<DetectionController> {
  const StreamDetectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Widget> renderBoxes (Size screen){
      if(controller.imageHeight.value == 0.0 || controller.imageWidth.value == 0.0){
        return [];
      }

      // double factorX = screen.width;
      // double factorY = controller.imageWidth / controller.imageWidth.value * screen.width;

      double factorX = screen.height;
      double factorY = controller.imageWidth / controller.imageHeight.value * screen.width;
      Color boundaryColor = Colors.red;

      return controller.recognitions.map((re) {
        if(re['confidenceInClass'] as double >= 0.5){
          return Positioned(
            left: (re['rect']['x'] * factorX),
            top: (re['rect']['y'] * factorY),
            width: (re['rect']['w'] * factorX),
            height: (re['rect']['h'] * factorY),

            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(8.0),
                ),
                border: Border.all(
                  color: boundaryColor,
                  width: 2,
                ),
              ),
              child: Text('${re['detectedClass']} ${(re['confidenceInClass'] * 100).toString()}',
                style: TextStyle(
                  background: Paint()..color = boundaryColor,
                  color: Colors.white,
                  fontSize: 15.0
                ),
              ),
            ),
          );
        }
        else{
          return Text('');
        }
      }).toList();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Detection', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
      ),
      body: Obx(
        () => controller.isInitialized.value
          ? Stack(
            children: [
              CameraPreview(controller.cameraController),
              ...renderBoxes(size),
            ],
          )
          : const Center(
            child: CircularProgressIndicator(),
          ),
        )
    );
  }
}
