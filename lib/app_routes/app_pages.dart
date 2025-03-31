import 'package:focus_as_you_wish/app_routes/app_routes.dart';
import 'package:focus_as_you_wish/bindings/detection_binding.dart';
import 'package:focus_as_you_wish/pages/detection_page.dart';
import 'package:focus_as_you_wish/pages/home_page.dart';
import 'package:focus_as_you_wish/pages/stream_detection_page.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class AppPages{
  static final pages = [
    GetPage(
      name: AppRoutes.homePage,
      page: () => const HomePage(),
    ),
    GetPage(
      binding: DetectionBinding(),
      name: AppRoutes.detectionPage,
      page: () => const DetectPicture(),
    ),
    GetPage(
      binding: DetectionBinding(),
      name: AppRoutes.streamPage,
      page: () => const StreamDetectionPage(),
    )
  ];
}