import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/ahadeeth_details.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:islami_app/sura_details.dart';
import 'package:provider/provider.dart';
import 'home/home.dart';
import 'my_theme_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  // get value
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MyProvider(),
        ),
        // ChangeNotifierProvider(
        //   create: (context) => SuraDetailsProvider(),
        // ),
      ],
      child: EasyLocalization(
          supportedLocales:const [
            Locale('en'),
            Locale('ar'),
          ],
          path: 'assets/translations',
          saveLocale: true,
          startLocale:const Locale("en"),
          child:const MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      themeMode: pro.appTheme,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetails.routeName: (context) => const SuraDetails(),
        AhadeethDetails.routeName: (context) => const AhadeethDetails(),
      },
    );
  }
}