// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.black,
//           title: Text(
//             "Expense Tracker",
//             style:
//                 TextStyle(color: Colors.white, ),
//           ),
//           actions: [],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'widgets/expenses.dart';
//import 'package:flutter/services.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 96, 59, 181));
var kDarkColorScheme = ColorScheme.fromSeed(
    seedColor: Color.fromARGB(255, 5, 99, 125), brightness: Brightness.dark);
void main() {
  /*WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((fn) { return                   locks the screen orientation to potrait up             */ 
    
    runApp(MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkColorScheme,
        cardTheme: CardTheme().copyWith(
          color: kDarkColorScheme.onPrimaryContainer.withOpacity(0.35),
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          elevation: 5,
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
                backgroundColor: kDarkColorScheme.onPrimaryContainer,
                foregroundColor: kDarkColorScheme.primaryContainer)),
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
              iconSize: 30,
              backgroundColor:
                  kDarkColorScheme.onSecondaryContainer.withOpacity(0.2)),
        ),
        /* textTheme: ThemeData().textTheme.copyWith(
              titleMedium: TextStyle(
            color: kDarkColorScheme.primaryContainer,
            fontWeight: FontWeight.bold,
          )), */
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer.withOpacity(0.5),
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
          ),
        ),
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.primaryContainer),
        cardTheme: CardTheme().copyWith(
          color: kColorScheme.onPrimaryContainer.withOpacity(0.8),
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          elevation: 5,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        iconButtonTheme:
            IconButtonThemeData(style: IconButton.styleFrom(iconSize: 30)),
        /*  textTheme: ThemeData().textTheme.copyWith(
              titleMedium: TextStyle(
            color: kColorScheme.primaryContainer,
            fontWeight: FontWeight.bold, 
            
          )),  */ /*scaffoldBackgroundColor: Color.fromARGB(250, 55, 555, 55), appBarTheme:AppBarTheme(backgroundColor: Colors.teal),*/
        scaffoldBackgroundColor:
            kColorScheme.primaryContainer.withOpacity(0.99),
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: Expenses(),
    ));
  }

