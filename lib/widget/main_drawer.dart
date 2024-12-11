import 'package:flutter/material.dart';

class Maindrawer extends StatefulWidget {
  const Maindrawer({super.key});

  @override
  State<Maindrawer> createState() => _MaindrawerState();
}

class _MaindrawerState extends State<Maindrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const SizedBox(height: 20),
          TextButton(
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text('Main'),
              )),
          const SizedBox(
            height: 20,
          ),
          TextButton(
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text('Sporting Movie'),
              )),
        ],
      ),
    );
  }
}
