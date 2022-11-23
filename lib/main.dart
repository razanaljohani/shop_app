import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay/pay.dart';
import 'package:razan_project/logic/controllers/cart_controller.dart';
import 'package:razan_project/logic/controllers/payment_controller.dart';
import 'package:razan_project/logic/controllers/theme_controller.dart';
import 'package:razan_project/routes/routes.dart';
import 'package:razan_project/utils/my_string.dart';
import 'package:razan_project/utils/thems/theme.dart';
import 'package:razan_project/view/screens/welcome_screen.dart';
import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'language/localization.dart';

// void main() async {
// WidgetsFlutterBinding.ensureInitialized();

// await GetStorage.init();
// await Firebase.initializeApp();

//   runApp(const MyApp());
// }
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  await Firebase.initializeApp();
  await SentryFlutter.init(
    (options) => options.dsn = 'https://<key>@sentry.io/<project>',
    appRunner: () => runApp(MyApp()),
  );

  // or define SENTRY_DSN via Dart environment variable (--dart-define)
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final controller = Get.put(CartController());
  final controller2 = Get.put(PayMentController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Asroo Shop',
      debugShowCheckedModeBanner: false,
      locale: Locale(GetStorage().read<String>('lang').toString()),
      translations: LocaliztionApp(),
      fallbackLocale: Locale(ene),
      theme: ThemesApp.light,
      darkTheme: ThemesApp.dark,
      themeMode: ThemeController().themeDataGet,
      initialRoute: FirebaseAuth.instance.currentUser != null ||
              GetStorage().read<bool>('auth') == true
          ? AppRoutes.MainScreens
          : AppRoutes.welcome,
      getPages: AppRoutes.routes,
    );
  }
}
