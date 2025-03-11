import 'package:flutter/material.dart';
import '../widgets/weather_info_card.dart';
import '../providers/weather_provider.dart';

class WeatherInfoSection extends StatelessWidget {
  final Weather? weather;

  const WeatherInfoSection({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InfoCard(
          icon: Icons.lightbulb,
          title: "Today's Eco Tip",
          content: "Reduce water usage by taking shorter showers",
        ),
        weather != null
            ? InfoCard(
                icon: Icons.wb_sunny,
                title: "Weather",
                content: "${weather!.temperature}°F",
              )
            : InfoCard(
                icon: Icons.cloud,
                title: "Weather",
                content: "Loading...",
              ),
        InfoCard(
          icon: Icons.eco,
          title: "Climate Impact Score",
          content: "Your score will appear here",
        ),
      ],
    );
  }
}
