import 'package:computer_store/features/authentication/screens/OnBoarding/onboarding.dart';
import 'package:computer_store/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
          themeMode: ThemeMode.system,
          theme: UAppTheme.lightApp,
          darkTheme: UAppTheme.darkApp,
          debugShowCheckedModeBanner: false,
          home: const OnBoardingScreen(),
        );
  }
}
