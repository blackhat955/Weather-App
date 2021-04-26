import 'package:flutter/material.dart';

class WeatherTile extends StatelessWidget {
  IconData icon;
  String tittle;
  String subtittle;
  WeatherTile(
      {@required this.icon, @required this.tittle, @required this.subtittle});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.redAccent,
          ),
        ],
      ),
      title: Text(
        tittle,
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        subtittle,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
