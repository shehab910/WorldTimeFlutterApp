import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {}; //the data passed from loading

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;

    //set background
    String bgImage = data['isDayTime'] ? 'day.jpg' : 'night.jpg';
    Color bgColor  = data['isDayTime'] ? const Color.fromRGBO(172, 147, 132, 1) : const Color.fromRGBO(2, 46, 57, 1);
    Color uiColor = data['isDayTime'] ? Colors.white : Colors.grey[300];
    EdgeInsetsGeometry uiPadding = data['isDayTime'] ? const EdgeInsets.fromLTRB(5, 190, 0, 0) : const EdgeInsets.fromLTRB(5, 290, 0, 0);

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: uiPadding,
            child: Column(
              children: [
                FlatButton.icon(
                    onPressed: (){
                      Navigator.pushNamed(context, '/location');
                    },
                    icon: Icon(Icons.edit_location_rounded, color: uiColor,),
                    label: Text('Change Location', style: TextStyle(color: uiColor),),
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        color: uiColor,
                        letterSpacing: 2.0,
                        fontSize: 29.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0,),
                Text(
                  data['time'],
                  style: TextStyle(
                    color: uiColor,
                    fontSize: 65.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/*
* credits to:
* alexander-andrews-yOIT88xWkbg-unsplash
* ravi-sharma-hNv5s6NEYig-unsplash
*
*/
