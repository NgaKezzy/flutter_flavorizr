import 'package:flutter/material.dart';
import '../config/environment.dart';
import '../services/api_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ApiService _apiService = ApiService();
  String _response = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Flavor Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Current Environment:',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              EnvironmentConfig.instance.flavor.name.toUpperCase(),
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'API Base URL:',
              style: TextStyle(fontSize: 18),
            ),
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
          ],
        ),
      ),
    );
  }
}
