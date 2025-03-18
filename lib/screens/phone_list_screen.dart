import 'package:flutter/material.dart';

import 'package:app_flutter_rest/models/phone.dart';
import 'package:app_flutter_rest/services/api_service.dart';
import 'package:app_flutter_rest/widgets/error_message.dart';
import 'package:app_flutter_rest/widgets/phone_card.dart';

class PhoneListScreen extends StatefulWidget {
  const PhoneListScreen({super.key});

  @override
  State<PhoneListScreen> createState() => _PhoneListScreenState();
}

class _PhoneListScreenState extends State<PhoneListScreen> {
  final ApiService _apiService = ApiService();
  late Future<List<Phone>> _phonesFuture;

  @override
  void initState() {
    super.initState();
    _loadPhones();
  }

  void _loadPhones() {
    setState(() {
      _phonesFuture = _apiService.getPhones();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Phone List')),
      body: FutureBuilder<List<Phone>>(
        future: _phonesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return ErrorMessage(
              message: 'Failed to load phones: ${snapshot.error}',
              onRetry: _loadPhones,
            );
          } else if (snapshot.hasData && snapshot.data!.isEmpty) {
            return const Center(child: Text('No phones found'));
          } else if (snapshot.hasData) {
            return RefreshIndicator(
              onRefresh: () async {
                _loadPhones();
              },
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return PhoneCard(phone: snapshot.data![index]);
                },
              ),
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
