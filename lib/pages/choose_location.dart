import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async {
    WorldTime worldTime = locations[index];
    await worldTime.getTime();
    // navigate to home screen
    Navigator.pop(context, {
      'location' : worldTime.location,
      'flag' : worldTime.flag,
      'time' : worldTime.time,
      'isDayTime' : worldTime.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[600],
        centerTitle: true,
        elevation: 0,
        title: Text('Choose Location'),
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
              child: Card(
                child: ListTile(
                  onTap: (){
                    updateTime(index);
                  },
                  title: Text(
                    locations[index].location,
                    style: TextStyle(
                      letterSpacing: 1.3,
                      fontSize: 23,
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }
          ),
    );
  }
}
