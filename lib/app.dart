import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rudy_project/app/features/auth/screens/splash_screen.dart';
class RudyProject extends StatelessWidget {
  const RudyProject({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SplashScreen(),
      title: 'Rudy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: TextTheme(
              bodyLarge: TextStyle(
                fontSize: 24,
              ),
              bodySmall: TextStyle(
                  fontSize: 16
              )
          ),
          appBarTheme: AppBarTheme(
            // backgroundColor: colorGreen,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  // backgroundColor: colorGreen,
                  elevation: 1,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  )
              )
          ),
          fontFamily: 'poppins'
      ),
    );
  }
}
