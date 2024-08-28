import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class loading_screen extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<loading_screen> {

  String time = 'helloo ';

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();
    
    setState(() {
      time = instance.time;
    });
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
        child:Image(
        image:NetworkImage('https://imgs.search.brave.com/uRhDCe-cWSiTFEpgAo5OarIv2p9QjiZ-NuDZOmageRg/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly91cGxv/YWQud2lraW1lZGlh/Lm9yZy93aWtpcGVk/aWEvY29tbW9ucy90/aHVtYi85LzliL0Zs/YWdfb2ZfTmVwYWwu/c3ZnLzUxMnB4LUZs/YWdfb2ZfTmVwYWwu/c3ZnLnBuZw'),
        width: 200, // optional, sets the image width
        height: 200,    
        alignment: Alignment.center, 
        ),
    ),
    
    );
  }
}