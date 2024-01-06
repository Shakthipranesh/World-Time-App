import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {



  void setupworld_time() async {
   WorldTime instance = WorldTime(location: "India", flag: "india.png", url: "Asia/Kolkata");
   await instance.getTime();
   Navigator.pushReplacementNamed(context, '/home', arguments: {
     'location': instance.location,
     'flag': instance.flag,
     'time': instance.time,
     'isDayTime': instance.isDayTime,
   });


  }

  void initState() {
    super.initState();
    setupworld_time();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.black87,
          size: 100.0,
        ),
      )
    );
  }
}
