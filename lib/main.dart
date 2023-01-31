import 'package:flutter/material.dart';
import 'list.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  int _select = 0;
  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  _selected(int index) {
    setState(() {
      _select = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 30.0, right: 10.0, left: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(
                        Icons.arrow_back_ios,
                        size: 30,
                      ),
                      Text(
                        'STATISTICS',
                        style: TextStyle(fontSize: 20),
                      ),
                      Icon(
                        Icons.file_download_outlined,
                        size: 30,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      width: 350,
                      //color: Colors.pink,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: all.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () => _onSelected(index),
                              child: Container(
                                height: 20,
                                width: 70,
                                decoration: BoxDecoration(
                                  color: (_selectedIndex == index)
                                      ? const Color(0xff558683)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                    child: Text(
                                  all[index],
                                  style: const TextStyle(fontSize: 20),
                                )),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10.0),
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                        border: const Border.fromBorderSide(
                            BorderSide(color: Colors.black)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            'Expense',
                            style: TextStyle(fontSize: 20),
                          ),
                          const Icon(Icons.keyboard_arrow_down_sharp)
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 150,
                  width: 350,
                  child: LineChart(
                    LineChartData(
                      minX: 0,
                      maxX: 11,
                      minY: 0,
                      maxY: 6,
                      gridData: FlGridData(
                        show: false,
                        drawVerticalLine: false,
                      ),
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            const FlSpot(0, 3),
                            const FlSpot(2.6, 2),
                            const FlSpot(4.9, 5),
                            const FlSpot(6.8, 2.5),
                            const FlSpot(8, 4),
                            const FlSpot(9.5, 3),
                            const FlSpot(11, 4),
                          ],
                          isCurved: true,
                          barWidth: 5,
                          color: const Color(0xff558683),
                          belowBarData: BarAreaData(
                            show: true,
                          ),
                        ),
                      ],
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        bottomTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    height: 50,
                    // color: Colors.black,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: month.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () => _selected(index),
                            child: Container(
                              height: 60,
                              width: 60,
                              //color: Colors.pink,
                              child: Center(
                                  child: (_select == index)
                                      ? Text(month[index],
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: Color(0xff558683)))
                                      : Text(month[index],
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.grey))),
                            ),
                          ),
                        );
                      },
                    )),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Top Exchange',
                        style: TextStyle(fontSize: 20),
                      ),
                      const Icon(
                        Icons.currency_exchange,
                        size: 30,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  title: const Text('StarBucks'),
                  leading: CircleAvatar(
                      maxRadius: 40,
                      child: Image.network(
                        'https://tse1.mm.bing.net/th?id=OIP.JnpneIv-zp0VHHwkZTBoUQHaHa&pid=Api&P=0',
                      )),
                  subtitle: const Text('Jan12, 2022'),
                  trailing: const Text(
                    '-\$150',
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),
                ),
                ListTile(
                  title: const Text('Transfer'),
                  leading: CircleAvatar(
                      maxRadius: 40,
                      child: Image.network(
                        'https://tse4.mm.bing.net/th?id=OIP.1QysJNe_72tkDTp-Pw8GKwHaHa&pid=Api&P=0',
                      )),
                  subtitle: const Text('Yesterday'),
                  trailing: const Text(
                    '-\$85',
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),
                ),
                ListTile(
                  title: const Text('Youtube'),
                  leading: CircleAvatar(
                      maxRadius: 40,
                      child: Image.network(
                        'https://1.bp.blogspot.com/-qdRfUNOtjkM/XeI_00z9pzI/AAAAAAAAF4E/FeD2SvVFnKUjPAKQ_cNM6-D2ahjKb0HkQCLcBGAsYHQ/s1600/Youtube-Icon-square-2340x2340-2.png',
                      )),
                  subtitle: const Text('Jan16, 2022'),
                  trailing: const Text(
                    '-\$11.99',
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: CurvedNavigationBar(
            items: const [
              Icon(Icons.home,color:Color(0xff558683),),
              Icon(Icons.bar_chart_sharp,color: Color(0xff558683),),
              Icon(Icons.wallet,color: Color(0xff558683),),
              Icon(Icons.person,color: Color(0xff558683),),
            ],
            animationDuration: const Duration(seconds: 1),
            backgroundColor: Colors.transparent,
            animationCurve: Curves.fastOutSlowIn,
            //color: const Color(0xff558683),
          )),
    );
  }
}


