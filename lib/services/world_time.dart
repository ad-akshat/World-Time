import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  late String location;
  late String time;
  late String flag; //url to asset flag
  late String url2; //location url for api endpoint
  bool isDaytime = true ;


  WorldTime({required this.location, required this.flag, required this.url2});

  Future <void> getTime() async {
    Uri url = Uri.parse('https://worldtimeapi.org/api/timezone/$url2');
    Response response = await get(url);
    Map data = jsonDecode(response.body);

    String? datetime = data['datetime'];
    String? offset = data['utc_offset'];
    // print(datetime ?? 'datetime is null');
    // print(offset ?? 'offset is null');

    DateTime now = DateTime.parse(datetime!);
    // now = now.add(Duration(minutes: int.parse((offset!.substring(1,3))*60 + (offset!.substring(4,6))));
    now = now.add(Duration(minutes: int.parse(offset!.substring(1,3)) * 60 + int.parse(offset!.substring(4,6))));
    isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
    time = DateFormat.jm().format(now);
    //print(now);
  }

}

