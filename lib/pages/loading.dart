import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async{
    WorldTime worldTime = WorldTime(flag: 'egypt.png', url: 'Africa/Cairo');
    await worldTime.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location' : worldTime.location,
      'flag' : worldTime.flag,
      'time' : worldTime.time
    }); //the third parameter to share data between screens
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Text('Loading..'),
      ),
    );
  }
}
