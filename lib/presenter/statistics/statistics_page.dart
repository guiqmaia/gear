import 'package:flutter/material.dart';

import 'widget/body_statistics_page.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyStatisticsPage(),
    );
  }
}

