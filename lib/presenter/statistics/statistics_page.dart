import 'package:flutter/material.dart';

import 'widget/body_statistics_page.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  static const route = '/statistics';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyStatisticsPage(),
    );
  }
}

