import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.centerLeft,
              color: Colors.blueGrey,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("assets/images/Piyu.jpeg"),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Priyanshi Baldha",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                    Text(
                      "+91 9512057000",
                      style: TextStyle(color: Colors.white54, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                children: [
                  SizedBox(height: 30,),
                  Row(
                    children: [
                      Icon(Icons.people_alt_outlined,size: 25,),
                      SizedBox(
                        width: 20,
                      ),
                      Text("New Group",style: TextStyle(fontSize: 18),),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Icon(Icons.person_outline_sharp,size: 25,),
                      SizedBox(
                        width: 20,
                      ),
                      Text("New Contact",style: TextStyle(fontSize: 18),),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Icon(Icons.call,size: 25,),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Calls",style: TextStyle(fontSize: 18),),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Icon(Icons.bookmark_border_outlined,size: 25,),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Saved Messages",style: TextStyle(fontSize: 18),),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Icon(Icons.settings,size: 25,),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Settings",style: TextStyle(fontSize: 18),),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
