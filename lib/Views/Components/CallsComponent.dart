import 'package:flutter/material.dart';
import 'package:platform_converter_app/Model/Allcontacts.dart';

class CallsComponent extends StatefulWidget {
  const CallsComponent({Key? key}) : super(key: key);

  @override
  State<CallsComponent> createState() => _CallsComponentState();
}

class _CallsComponentState extends State<CallsComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          children: AllContact.map((e) => Container(
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage(e['image']),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${e['name']}",style: TextStyle(fontSize: 18),),
                    Text("${e['call_Time']}",style: TextStyle(color: Colors.grey),),
                  ],
                ),
                Spacer(),
               Icon(Icons.call,size: 30,color: Colors.green,),
              ],
            ),
          ),).toList(),
        ),
      )
    );
  }
}
