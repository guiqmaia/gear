import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gear/presenter/home/home_page.dart';
import 'package:gear/presenter/shared/widgets/top_bar_app.dart';

import 'widget/value_day.dart';
import 'widget/liders_product.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyResultsPage(),
    );
  }
}

class BodyResultsPage extends StatefulWidget {
  const BodyResultsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<BodyResultsPage> createState() => _BodyResultsPageState();
}

class _BodyResultsPageState extends State<BodyResultsPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const TopBarApp(
              title: 'Resultados', pageRoute: HomePage(), isProfile: false),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            child: const BarChartSample1(),
          ),
          Container(
            margin: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade500,
                    blurRadius: 3,
                    spreadRadius: 3,
                    offset: const Offset(5, 5)),
              ],
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  child: Text(
                    'Mais Vendidos',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Column(
                  
                  children: [
                    const ProductLeader(
                      product: "1. Mary Wells",
                      value: "R\$ 4198,41",
                    ),
                    Divider(
                      height: 20,
                      color: Colors.grey.shade300,
                      thickness: 1,
                      indent: 40,
                      endIndent: 40,
                    ),
                    const ProductLeader(
                      product: "2. Coca-Cola",
                      value: "R\$ 5704,55",
                    ),Divider(
                      height: 20,
                      color: Colors.grey.shade300,
                      thickness: 1,
                      indent: 40,
                      endIndent: 40,
                    ),
                    const ProductLeader(
                      product: "3. Perini-Malbec",
                      value: "R\$ 1567,00",
                    ),Divider(
                      height: 20,
                      color: Colors.grey.shade300,
                      thickness: 1,
                      indent: 40,
                      endIndent: 40,
                    ),
                    const ProductLeader(
                      product: "4. White Horse",
                      value: "R\$ 10015,31",
                    ),Divider(
                      height: 20,
                      color: Colors.grey.shade300,
                      thickness: 1,
                      indent: 40,
                      endIndent: 40,
                    ),
                    const ProductLeader(
                      product: "5. RedBull",
                      value: "R\$ 1651,45",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade500,
                    blurRadius: 3,
                    spreadRadius: 3,
                    offset: const Offset(5, 5)),
              ],
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  child: Text(
                    'Faturamento Diário',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Column(
                  
                  children: [
                    const ValueDay(value: "R\$ 3738,59", day: "Segunda"),
                    Divider(
                      height: 20,
                      color: Colors.grey.shade300,
                      thickness: 1,
                      indent: 40,
                      endIndent: 40,
                    ),
                    const ValueDay(value: "R\$ 2884,32", day: "Terça"),
                    Divider(
                      height: 20,
                      color: Colors.grey.shade300,
                      thickness: 1,
                      indent: 40,
                      endIndent: 40,
                    ),
                    const ValueDay(value: "R\$ 4247,21", day: "Quarta"),
                    Divider(
                      height: 20,
                      color: Colors.grey.shade300,
                      thickness: 1,
                      indent: 40,
                      endIndent: 40,
                    ),
                    const ValueDay(value: "R\$ 1987,56", day: "Quinta"),
                    Divider(
                      height: 20,
                      color: Colors.grey.shade300,
                      thickness: 1,
                      indent: 40,
                      endIndent: 40,
                    ),
                    const ValueDay(value: "R\$ 6875,04", day: "Sexta"),
                    Divider(
                      height: 20,
                      color: Colors.grey.shade300,
                      thickness: 1,
                      indent: 40,
                      endIndent: 40,
                    ),
                    const ValueDay(value: "R\$ 1745,51", day: "Sábado"),
                    Divider(
                      height: 20,
                      color: Colors.grey.shade300,
                      thickness: 1,
                      indent: 40,
                      endIndent: 40,
                    ),
                    const ValueDay(value: "R\$ 2154,52", day: "Domingo"),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BarChartSample1 extends StatefulWidget {
  final List<Color> availableColors = const [
    Colors.purpleAccent,
    Colors.yellow,
    Colors.lightBlue,
    Colors.orange,
    Colors.pink,
    Colors.redAccent,
  ];

  const BarChartSample1({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BarChartSample1State();
}

class BarChartSample1State extends State<BarChartSample1> {
  final Color barBackgroundColor = const Color(0xff72d8bf);
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;

  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        color: Colors.grey.shade400,                
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  const Text(
                    'Balanço Semanal',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                    'Distribuidora Bebidinhas',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 38,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: BarChart(mainBarData()),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color barColor = const Color.fromRGBO(202, 254, 72, 1),
    double width = 22,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          color: isTouched ? const Color.fromRGBO(202, 254, 72, 1) : barColor,
          width: width,
          borderSide: isTouched
              ? const BorderSide(
                  color: Color.fromRGBO(202, 254, 72, 0.85), width: 1)
              : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
            color: barBackgroundColor,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 3738.59, isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, 2884.32, isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, 4247.21, isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, 1987.56, isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(4, 6875.04, isTouched: i == touchedIndex);
          case 5:
            return makeGroupData(5, 1745.51, isTouched: i == touchedIndex);
          case 6:
            return makeGroupData(6, 2154.52, isTouched: i == touchedIndex);
          default:
            return throw Error();
        }
      });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.blueGrey,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String weekDay;
              switch (group.x.toInt()) {
                case 0:
                  weekDay = 'Segunda';
                  break;
                case 1:
                  weekDay = 'Terça';
                  break;
                case 2:
                  weekDay = 'Quarta';
                  break;
                case 3:
                  weekDay = 'Quinta';
                  break;
                case 4:
                  weekDay = 'Sexta';
                  break;
                case 5:
                  weekDay = 'Sábado';
                  break;
                case 6:
                  weekDay = 'Domingo';
                  break;
                default:
                  throw Error();
              }
              return BarTooltipItem(
                '$weekDay\n',
                const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: (rod.toY - 1).toString(),
                    style: const TextStyle(
                      color: Colors.yellow,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              );
            }),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: FlGridData(show: false),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('S', style: style);
        break;
      case 1:
        text = const Text('T', style: style);
        break;
      case 2:
        text = const Text('Q', style: style);
        break;
      case 3:
        text = const Text('Q', style: style);
        break;
      case 4:
        text = const Text('S', style: style);
        break;
      case 5:
        text = const Text('S', style: style);
        break;
      case 6:
        text = const Text('D', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }
}
