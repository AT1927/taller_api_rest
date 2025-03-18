import 'package:flutter/material.dart';

import 'package:app_flutter_rest/models/phone.dart';
import 'package:app_flutter_rest/screens/phone_detail_screen.dart';

class PhoneCard extends StatelessWidget {
  final Phone phone;

  const PhoneCard({super.key, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        leading: CircleAvatar(
          backgroundColor: const Color.fromARGB(255, 243, 162, 69),
          child: Text(
            phone.id.substring(0, 1),
            style: const TextStyle(color: Color.fromARGB(255, 32, 31, 31)),
          ),
        ),
        title: Text(
          phone.name.toString(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [const SizedBox(height: 4.0), Text(phone.name)],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PhoneDetailScreen(phone: phone),
            ),
          );
        },
      ),
    );
  }
}
