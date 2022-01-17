import '../../constants.dart';
import '../../ui/components/chart_component.dart';
import '../../ui/components/toolbar_component.dart';
import 'package:flutter/material.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ToolbarComponent(
              title: 'Stats',
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Net balance',
                      style: TextStyle(
                          fontFamily: 'GTWalsheimPro',
                          color: Colors.grey.shade400,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Rs 3000',
                      style: TextStyle(
                          fontFamily: 'GTWalsheimPro',
                          fontSize: 26,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(height: 300, child: ChartComponent()),
                    Row(
                      children: [],
                    )
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                color: secondaryColor, shape: BoxShape.circle),
                            child: Icon(
                              Icons.keyboard_arrow_left_rounded,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Income',
                            style: TextStyle(
                                fontFamily: 'GTWalsheimPro',
                                color: Colors.grey.shade400,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            'Rs 3000',
                            style: TextStyle(
                                fontFamily: 'GTWalsheimPro',
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                color: primaryColor, shape: BoxShape.circle),
                            child: Icon(
                              Icons.keyboard_arrow_right_rounded,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Income',
                            style: TextStyle(
                                fontFamily: 'GTWalsheimPro',
                                color: Colors.grey.shade400,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            'Rs 3000',
                            style: TextStyle(
                                fontFamily: 'GTWalsheimPro',
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
