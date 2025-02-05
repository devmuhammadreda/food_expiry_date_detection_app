// ignore_for_file: public_member_api_docs, sort_constructors_first, depend_on_referenced_packages
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_expiry_date_detection_app/core/extensions/build_context.dart';
import 'package:food_expiry_date_detection_app/l10n/messages.dart';
import 'package:get/get.dart';
import 'package:food_expiry_date_detection_app/l10n/messages.dart'
    as common_messages;
import 'app/routes/app_pages.dart';
import 'core/constants/theme/theme_manager.dart';
import 'core/services/bindings.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          navigatorObservers: [BotToastNavigatorObserver()],
          initialRoute: AppPages.INITIAL,
          onGenerateTitle: (context) => context.translate.app_name,
          debugShowCheckedModeBanner: false,
          initialBinding: InitialBindings(),
          getPages: AppPages.routes,
          darkTheme: ThemeManager.darkTheme,
          theme: ThemeManager.lightTheme,
          themeMode: ThemeMode.light,
          locale: Locale("en", "US"),
          localizationsDelegates: const [
            ...S.localizationsDelegates,
            common_messages.S.delegate,
          ],
          supportedLocales: S.supportedLocales,
          defaultTransition: Transition.fadeIn,
          builder: (context, child) {
            child = botToastBuilder(context, child!);
            return child;
          },
        );
      },
    );
  }
}
