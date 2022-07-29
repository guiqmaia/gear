import 'package:flutter/material.dart';

import '../../../shared/widgets/top_bar_app.dart';
import 'bar_chart_sample1.dart';
import 'container_daily_sales.dart';
import 'container_ranking_sales.dart';

class BodyStatisticsPage extends StatefulWidget {
  const BodyStatisticsPage({Key? key}) : super(key: key);

  @override
  State<BodyStatisticsPage> createState() => _BodyStatisticsPageState();
}

class _BodyStatisticsPageState extends State<BodyStatisticsPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const TopBarApp(
            title: 'Estatísticas',
            isProfile: true,
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            child: const BarChartSample1(),
          ),
          const ContainerRankingSales(),
          const ContainerDailySales(),
        ],
      ),
    );
  }
}
