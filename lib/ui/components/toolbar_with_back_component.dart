import 'package:flutter/material.dart';

class ToolbarWithBackComponent extends StatelessWidget {
  final String title;
  const ToolbarWithBackComponent({Key? key, required this.title})
      : super(key: key);

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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(
            Icons.arrow_back,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: const TextStyle(
                fontFamily: 'GTWalsheimPro',
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
