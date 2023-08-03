import 'package:flutter/material.dart';

class SeenBody extends StatefulWidget {
  const SeenBody({super.key});

  @override
  State<SeenBody> createState() => _SeenBodyState();
}

class _SeenBodyState extends State<SeenBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("SeenBody"),
    );
  }
}