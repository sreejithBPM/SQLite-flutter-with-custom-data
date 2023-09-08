import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'database.dart';
import 'model.dart';

Future<void> printBoloRoomMembersAsJson() async {
  final data = await DatabaseHelper.instance.getAllBoloRoomMembersAsJson();
  final jsonData = data.map((item) => Map<String, dynamic>.from(item)).toList();
  print(jsonData);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.instance.initDatabase(); // Initialize the database
  await printBoloRoomMembersAsJson();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bolo Room Member Database',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Insert a BoloRoomMember into the database
    final boloRoomMember = BoloRoomMember(
      roomMemberId: 1,
      boloRoomId: 1,
      boloUserId: 1,
      isRoomAdmin: 'admin',
      createdBy: 'John',
      createdOn: DateTime.now(),
      createdIP: '192.168.1.1',
      modifiedBy: 'Jane',
      modifiedOn: DateTime.now(),
      modifiedIP: '192.168.1.2',
    );

    DatabaseHelper.instance.insertBoloRoomMember(boloRoomMember);

    return Scaffold(
      appBar: AppBar(
        title: Text('Bolo Room Members'),
      ),
      body: Center(
        child: Text('Data inserted into SQLite database.'),
      ),
    );
  }
}