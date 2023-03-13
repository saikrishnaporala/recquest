import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

// import 'package:recquest_21/services/notification.service.dart';
import 'package:recquest_21/utils/auth_controller.dart';

import 'core/app_export.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Permission.notification.isDenied.then(
  //   (bool value) {
  //     if (value) {
  //       Permission.notification.request();
  //     }
  //   },
  // );
  // await BackgroundController.instance.getLocation();
  // await NotificationService.clearIrrelevantNotificationChannels();
  // await NotificationService.initializeAwesomeNotification();
  // await NotificationService.listenToActions();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  // await PushNotificationService().setupInteractedMessage();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    // Workmanager().registerOneOffTask("taskone", "locationSending",
    //     constraints: Constraints(networkType: NetworkType.connected));
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.standard,
      ),
      translations: AppLocalization(),
      locale: Get.deviceLocale, // for setting localization strings
      fallbackLocale: Locale('en', 'US'),
      title: 'recquest_21',
      initialBinding: InitialBindings(),
      initialRoute: AppRoutes.initialRoute,
      getPages: AppRoutes.pages,
    );
  }
}
