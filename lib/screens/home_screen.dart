import 'package:flutter/material.dart';
import '../widgets/weather_card.dart';
import '../providers/weather_provider.dart';
import '../utils/dialog_utils.dart';
import '../features/feature_button.dart';
import '../features/features.dart';
import 'package:provider/provider.dart';
import '../widgets/chatbot_overlay.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showChat = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<WeatherProvider>(context, listen: false).fetchWeather();
    });
  }

  void toggleChat() {
    setState(() {
      showChat = !showChat;
    });
  }

  void navigateTo(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    final weather = Provider.of<WeatherProvider>(context).weather;

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 158, 223, 166),
            title: const SelectableText('GreenStride'),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () => showAuthDialog(context, "Login"),
                    child: const SelectableText("Login",
                        style: TextStyle(color: Colors.black)),
                  ),
                  const SizedBox(width: 10),
                  TextButton(
                    onPressed: () => showAuthDialog(context, "Signup"),
                    child: const SelectableText("Signup",
                        style: TextStyle(color: Colors.black)),
                  ),
                ],
              ),
            ],
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade100, Colors.green.shade200],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsets.all(25.0),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SelectableText(
                      "Planting Green, Growing Life",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    const SelectableText(
                      "Your investment is susceptible to greater vulnerability from external influences.",
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    if (weather != null) WeatherCard(weather: weather),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              MediaQuery.of(context).size.width > 650 ? 5 : 3,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio:
                              MediaQuery.of(context).size.width > 650
                                  ? 1.5
                                  : 1.2,
                        ),
                        itemCount: featureList.length,
                        itemBuilder: (context, index) {
                          return FeatureButton(
                            icon: featureList[index][1] as IconData,
                            label: featureList[index][0] as String,
                            screen: featureList[index][2] as Widget,
                            navigateTo: navigateTo,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: toggleChat,
            child: Icon(Icons.chat),
          ),
        ),
        if (showChat) ChatbotOverlay(onClose: toggleChat),
      ],
    );
  }
}
