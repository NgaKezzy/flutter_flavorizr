import 'package:cupertino_calendar_picker/cupertino_calendar_picker.dart';
import 'package:flutter/material.dart';
import '../config/environment.dart';
import '../services/api_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ApiService _apiService = ApiService();
  String _response = '';
  DateTime dateTimeNow = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Flavor Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Current Environment:', style: TextStyle(fontSize: 18)),
            Text(
              EnvironmentConfig.instance.flavor.name.toUpperCase(),
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text('API Base URL:', style: TextStyle(fontSize: 18)),
            Text(
              EnvironmentConfig.instance.baseUrl,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                try {
                  final result = await _apiService.getUsers();
                  setState(() {
                    _response = result.toString();
                  });
                } catch (e) {
                  setState(() {
                    _response = 'Error: ${e.toString()}';
                  });
                }
              },
              child: Text('Test API Call'),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(_response),
            ),
            GestureDetector(
              onTap: () {
                _dialogBuilder(context);
              },
              child: SizedBox(child: Text(dateTimeNow.toString())),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.zero,
          content: SizedBox(
            width: 300,
            child: CupertinoCalendar(
              minimumDateTime: DateTime(2024, 7, 10),
              maximumDateTime: DateTime(2025, 7, 10),
              initialDateTime: DateTime.now(),
              currentDateTime: DateTime(2024, 8, 15),
              timeLabel: 'Ends',
              mode: CupertinoCalendarMode.date,
              onDateSelected: (value) {
                print(value);
                setState(() {
                  dateTimeNow = value;
                });
              },
              type: CupertinoCalendarType.inline,
            ),
          ),
        );
      },
    );
  }
}
