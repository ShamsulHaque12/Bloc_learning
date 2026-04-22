import 'package:flutter/material.dart';

class SwithScreen extends StatefulWidget {
  const SwithScreen({super.key});

  @override
  State<SwithScreen> createState() => _SwithScreenState();
}

class _SwithScreenState extends State<SwithScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Switch')),
      body: Column(
        children: [
          SwitchListTile(
            title: Text("Switch theme"),
            value: false,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
