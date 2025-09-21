import 'package:flutter/material.dart';
import 'package:portfolio/app/section/footer/controller/footer_provider.dart';
import 'package:portfolio/app/section/main/view/main_section.dart';
import 'package:portfolio/core/providers/animated_provider.dart';
import 'package:portfolio/core/providers/contact_form_provider.dart';
import 'package:portfolio/core/providers/scroll_provider.dart';
import 'package:portfolio/core/utils/theme.dart';
import 'package:provider/provider.dart';
import 'app/section/main/controller/main_section_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ScrollProvider()),
      ChangeNotifierProvider(create: (context) => ContactFormProvider()),
      ChangeNotifierProvider(create: (context) => AnimateProvider()),
      ChangeNotifierProvider(create: (context) => MainSectionProvider()),
      ChangeNotifierProvider(create: (context) => FooterProvider())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      themeMode: ThemeMode.dark,
      theme: buildDarkTheme(),
      darkTheme: buildDarkTheme(),
      debugShowCheckedModeBanner: false,
      home: MainSection(),
    );
  }
}