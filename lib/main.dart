import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/weather_provider.dart';
import 'screens/home_screen.dart';
import 'screens/unusedScreens/mitigation_screen.dart';
import 'screens/adaptation_screen.dart';
import 'widgets/chatbot_overlay.dart'; // Import chatbot

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WeatherProvider()),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey, // Add global navigator key
        title: 'Climate App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/mitigation': (context) => MitigationScreen(),
          '/adaptation': (context) => AdaptationScreen(),
        },
      ),
    );
  }
}
