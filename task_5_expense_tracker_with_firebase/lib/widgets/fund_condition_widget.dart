// // ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MoneyCondition extends StatelessWidget {
  final String type;
  final String amount;
  final String icon;

  const MoneyCondition({
    super.key,
    required this.type,
    required this.amount,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 2.4,
            color: Colors.blueGrey,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 30,
            width: 30,
            child: Image.asset("images/$icon.png"),
          ),
          const SizedBox(width: 12.4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                type,
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.5,
                ),
              ),
              const SizedBox(height: 3),
              Padding(
                padding: const EdgeInsets.only(left: 0.4),
                child: Text(
                  "Rs.$amount",
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 14, 16, 41),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
