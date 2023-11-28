import 'package:flutter/material.dart';
import 'package:portfolio/app/section/main/main_section.dart';
import 'package:portfolio/core/providers/contact_form_provider.dart';
import 'package:portfolio/core/providers/scroll_provider.dart';
import 'package:portfolio/utils/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
         ChangeNotifierProvider(create: (context) => ScrollProvider()),
         ChangeNotifierProvider(create: (context) => ContactFormProvider()),
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      theme: buildDarkTheme(),
      debugShowCheckedModeBanner: false,
      home: MainSection(),
    );
  }
}

