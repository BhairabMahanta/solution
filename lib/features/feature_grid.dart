import 'package:flutter/material.dart';
import '../features/feature_button.dart';
import '../features/features.dart';

class FeatureGrid extends StatelessWidget {
  final Function(BuildContext, Widget) navigateTo;

  const FeatureGrid({Key? key, required this.navigateTo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.2,
      children: [
        FeatureButton(
          icon: Icons.directions_walk,
          label: "Carbon Footprint",
          screen: featureList[0][2] as Widget,
          navigateTo: navigateTo,
        ),
        FeatureButton(
          icon: Icons.show_chart,
          label: "Climate Stats",
          screen: featureList[1][2] as Widget,
          navigateTo: navigateTo,
        ),
        FeatureButton(
          icon: Icons.warning,
          label: "Risk Alerts",
          screen: featureList[2][2] as Widget,
          navigateTo: navigateTo,
        ),
        FeatureButton(
          icon: Icons.more_horiz,
          label: "More Actions",
          screen: featureList[3][2] as Widget,
          navigateTo: navigateTo,
        ),
      ],
    );
  }
}
