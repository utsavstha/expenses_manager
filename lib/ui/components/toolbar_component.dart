import 'package:flutter/material.dart';

class ToolbarComponent extends StatelessWidget {
  final String title;
  const ToolbarComponent({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(14),
              bottomRight: Radius.circular(14))),
      padding: const EdgeInsets.all(8),
      height: 60,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontFamily: 'GTWalsheimPro',
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
          const Icon(
            Icons.calendar_today_rounded,
          )
        ],
      ),
    );
  }
}
