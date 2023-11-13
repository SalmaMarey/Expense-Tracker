import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/ThemePage.dart';
import 'widgets/expenses.dart';

void main() {
  runApp(const MyApp());
}

// var myColorScheme = ColorScheme.fromSeed(
//   seedColor: const Color.fromARGB(255, 59, 96, 179),
// );
// var myDarkColorScheme = ColorScheme.fromSeed(
//   seedColor: const Color.fromARGB(255, 59, 96, 179),
// );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String title = 'Light & Dark Theme';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          themeMode: themeProvider.themeMode,
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          // Widget build(BuildContext context) {
          //   return const MaterialApp(
          //     debugShowCheckedModeBanner: false,
          //     // themeMode: ThemeMode.dark,
          //     // theme: ThemeData().copyWith(
          //     //     useMaterial3: true,
          //     //     colorScheme: myColorScheme,
          //     //     appBarTheme: const AppBarTheme().copyWith(
          //     //         backgroundColor: myColorScheme.onPrimaryContainer,
          //     //         foregroundColor: myColorScheme.primaryContainer),
          //     //     cardTheme: const CardTheme().copyWith(
          //     //       color: myColorScheme.secondaryContainer,
          //     //       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          //     //     ),
          //     //     elevatedButtonTheme: ElevatedButtonThemeData(
          //     //       style: ElevatedButton.styleFrom(
          //     //         backgroundColor: myColorScheme.primaryContainer,
          //     //       ),
          //     //     ),
          //     //     textTheme: ThemeData().textTheme.copyWith(
          //     //         titleLarge: TextStyle(
          //     //             fontWeight: FontWeight.normal,
          //     //             color: myColorScheme.onSecondaryContainer,
          //     //             fontSize: 17))),
          //     // darkTheme: ThemeData.dark().copyWith(
          //     //   useMaterial3: true,
          //     //   colorScheme: myColorScheme,

          //     //   bottomSheetTheme: const BottomSheetThemeData()
          //       .copyWith(backgroundColor: myDarkColorScheme.inversePrimary),
          //   appBarTheme: const AppBarTheme().copyWith(
          //       backgroundColor: myDarkColorScheme.onPrimaryContainer,
          //       foregroundColor: myDarkColorScheme.primaryContainer),
          //   cardTheme: const CardTheme().copyWith(
          //     color: myDarkColorScheme.secondaryContainer,
          //     margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          //   ),
          //   elevatedButtonTheme: ElevatedButtonThemeData(
          //     style: ElevatedButton.styleFrom(
          //         backgroundColor: myDarkColorScheme.onPrimaryContainer,
          //         foregroundColor: myDarkColorScheme.primaryContainer),
          //   ),
          //   textTheme: ThemeData().textTheme.copyWith(
          //         titleLarge: TextStyle(
          //             fontWeight: FontWeight.normal,
          //             color: myDarkColorScheme.onSecondaryContainer,
          //             fontSize: 17),
          //       ),
          // ),
          home: Expenses(),
        );
      });
}
