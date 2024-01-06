import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time= "";
  String flag;
  String url;
  bool isDayTime = true;

  WorldTime({ required this.location, required this.flag, required this.url});

  Future<void> getTime() async {

    try{
      Response response = await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      //print(data);

      String datetime = data['utc_datetime'];
      String offset = data['utc_offset'].substring(1,6);
      List<String> parts = offset.split(":");
      /*offset = parts[0] +"."+ parts[1];
      print(offset);*/
      //print(datetime);
      //print(offset);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(parts[0]), minutes: int.parse(parts[1]) ));

      isDayTime = now.hour > 6 && now.hour < 20 ? true : false ;
      time = DateFormat.jm().format(now);
    }
    catch (e){
      print("caught error: $e");
      time = "could not load time";
    }
  }


}