import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopung_ui/res/app_colors.dart';
import 'package:shopung_ui/res/app_style.dart';
import 'package:shopung_ui/res/binding/build_binding.dart';
import 'package:shopung_ui/res/utils/routs/route_name.dart';
import 'package:shopung_ui/res/utils/routs/route_view.dart';
import 'package:shopung_ui/view/home/home_view.dart';
import 'package:shopung_ui/view/main/main_view.dart';
import 'package:get/get.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // scrollBehavior: const CupertinoScrollBehavior(),
      theme: kAppThemeData,
      // theme: ThemeData(
      //   scaffoldBackgroundColor: AppColors.kscaffoldColor,
      // colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
      // useMaterial3: true,
      //  textTheme: GoogleFonts.mulishTextTheme(),
        // primarySwatch: Colors.blue,
      // ),
      getPages: RouteView().getRoute(),
      initialBinding: BuildBinding(),
      initialRoute: RouteName.mainView,
      // home:  MainView(),
    );
  }
  
  
}
final ThemeData kAppThemeData = _buildThemeData();
ThemeData _buildThemeData()
  {
    final base = ThemeData.light();
    final baseTextTheme = GoogleFonts.interTextTheme(base.textTheme);
    return base.copyWith(
      scaffoldBackgroundColor: AppColors.kscaffoldColor,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
      useMaterial3: true,
      textTheme: baseTextTheme.copyWith(
        titleLarge: AppStyles.titleLarge,
        titleMedium: AppStyles.titleMedium,
        titleSmall: AppStyles.titleSmall,
        bodyLarge: AppStyles.bodyLarge,
        bodyMedium: AppStyles.bodyMedium,
        bodySmall: AppStyles.bodySmall,
        

      ),
    );
  }
