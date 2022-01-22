import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class ProgressDialog extends StatelessWidget {
  const ProgressDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircularProgressIndicator(
            color: primaryColor,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Please Wait',
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
