import 'package:expense_manager/utils/constants.dart';
import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  const NoData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.hourglass_empty_outlined,
            size: 20,
            color: primaryColor,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'No records found.',
            style: TextStyle(
                fontFamily: 'GTWalsheimPro',
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
