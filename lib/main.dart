import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Views/Components/CallsComponent.dart';
import 'Views/Components/ChatsComponent.dart';
import 'Views/Components/MyDrawer.dart';
import 'Views/Components/SettingsComponent.dart';
import 'Views/Components/StepperComponent.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

bool isIOS = false;

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late TabController tabController;
  PageController pageController = PageController();
  int currentCupertinoIndex = 0;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (isIOS == false)
        ? MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSwatch().copyWith(
                primary: Colors.blueGrey,
                secondary: Colors.blueGrey,
              ),
              appBarTheme: AppBarTheme(
                  backgroundColor: Colors.blueGrey,
                  foregroundColor: Colors.white),
            ),
            home: DefaultTabController(
              length: 3,
              child: Scaffold(
                drawer: const Drawer(
                  child: MyDrawer(),
                ),
                appBar: AppBar(
                  title: Text(
                    "Platform Convertor",
                    style: TextStyle(fontSize: 25),
                  ),
                  bottom: TabBar(
                    controller: tabController,
                    onTap: (val) {
                      pageController.animateToPage(
                        val,
                        duration: Duration(
                          milliseconds: 500,
                        ),
                        curve: Curves.easeInOut,
                      );
                    },
                    tabs: [
                      Tab(
                        text: "CHATES",
                      ),
                      Tab(
                        text: "CALLS",
                      ),
                      Tab(
                        text: "SETTINGS",
                      ),
                    ],
                    indicatorColor: Colors.white,
                    indicatorWeight: 4,
                  ),
                  actions: [
                    Switch(
                      value: isIOS,
                      onChanged: (val) {
                        setState(() {
                          isIOS = val;
                        });
                      },
                    ),
                  ],
                ),
                body: PageView(
                  onPageChanged: (val) {
                    tabController.animateTo(val);
                  },
                  controller: pageController,
                  children: [
                    ChatsComponent(),
                    CallsComponent(),
                    SettingsComponent(),
                  ],
                ),
                floatingActionButton: Builder(
                  builder: (context) {
                    return FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          showDialog(
                            context: context,
                            builder: (context) =>
                                AlertDialog(
                                  content: Container(
                                  height: 300,
                                width: 300,
                                child: StepperComponent(),
                              ),
                            ),
                          );
                        });
                      },
                      child: Icon(
                        Icons.add,
                        size: 40,
                      ),
                    );
                  }
                ),
              ),
            ),
          )
        : CupertinoApp(
            debugShowCheckedModeBanner: false,

            home: CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
               leading: Builder(builder: (context){
                 return GestureDetector(
                   child: Icon(Icons.menu,color: Colors.blueGrey,),
                   onTap: (){
                     showCupertinoDialog(context: context, builder: (context){
                       return Row(
                         children: [
                           Expanded(
                             flex:7 ,
                             child: MyDrawer(),
                           ),
                           Expanded(flex: 2,child: GestureDetector(
                             onTap: (){
                               Navigator.pop(context);
                             },
                             child: Container(
                               color: Colors.transparent,
                             ),
                           ),
                           ),
                         ],
                       );
                     },);
                   },
                 );
               },),
                middle: Text(
                  "Platform Convertor",
                  style: TextStyle(color: Colors.blueGrey, fontSize: 20),
                ),
                trailing: CupertinoSwitch(value: isIOS,  onChanged: (val) {
                  setState(() {
                    isIOS = val;
                  });
                },),
                backgroundColor: CupertinoColors.white,
              ),
              child: Container(
                alignment: Alignment.center,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    IndexedStack(
                      index: currentCupertinoIndex,
                      children: [
                        ChatsComponent(),
                        CallsComponent(),
                        SettingsComponent(),
                      ],
                    ),
                    CupertinoTabBar(
                      backgroundColor: CupertinoColors.white,
                      currentIndex: currentCupertinoIndex,
                      onTap: (val) {
                        setState(() {
                          currentCupertinoIndex = val;
                        });
                      },
                      items: [
                        BottomNavigationBarItem(
                          icon: Icon(
                            CupertinoIcons.chat_bubble_2,
                          ),
                          label: "Chats"
                        ),
                        BottomNavigationBarItem(
                            icon: Icon(
                              CupertinoIcons.phone,
                            ),
                            label: "Calls"
                        ),
                        BottomNavigationBarItem(
                            icon: Icon(
                              CupertinoIcons.settings,
                            ),
                            label: "Settings"
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              backgroundColor: Colors.white,
            ),
          );
  }
}
