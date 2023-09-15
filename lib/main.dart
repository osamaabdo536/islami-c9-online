import 'package:flutter/material.dart';
import 'package:flutter_islami_app/home/hadeth/hadeth_details_screen.dart';
import 'package:flutter_islami_app/home/home_screen.dart';
import 'package:flutter_islami_app/home/quran/sura_details_screen.dart';
import 'package:flutter_islami_app/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName : (context) => HomeScreen(),
        SuraDetailsScreen.routeName : (context) => SuraDetailsScreen(),
        HadethDetailsScreen.routeName : (context) => HadethDetailsScreen(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: MyTheme.lightTheme,
      locale: Locale('ar'),
    );
  }
}
