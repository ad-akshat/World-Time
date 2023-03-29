import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';


class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url2: 'Asia/Kolkata', location: 'Kolkata', flag: 'india.png'),
    WorldTime(url2: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url2: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url2: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url2: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url2: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url2: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url2: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url2: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime' : instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    //print('build fn ran');
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
        child: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  onTap: () {
                    print(locations[index].location);
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('${locations[index].flag}'),
                  ),
                ),
              );
            },),
      ),
    );
  }
}
