import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String url;
  String flag;
  String time;
  String location;

  WorldTime ({this.url, this.flag}){
    location = url.substring(url.indexOf('/') + 1);
  }

  Future<void> getTime() async {
    try {
      //make the request
      Response response = await get(
          'http://worldtimeapi.org/api/timezone/$url');
      Map timeData = jsonDecode(response.body);

      //getting the needed data
      String datetime = timeData['datetime'];
      String offset = timeData['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      time = DateFormat.jm().format(now);
    }
    catch(e){
      print('caught error: $e');
      time = "Couldn't get time data";
    }
  }
}