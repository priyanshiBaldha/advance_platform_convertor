import 'package:flutter/material.dart';
import 'package:platform_converter_app/Views/Components/CallsComponent.dart';
import 'package:platform_converter_app/Views/Components/ChatsComponent.dart';
import 'package:platform_converter_app/Views/Components/MyDrawer.dart';
import 'package:platform_converter_app/Views/Components/SettingsComponent.dart';
import '../Components/StepperComponent.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  PageController pageController = PageController();

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: Drawer(child: MyDrawer()),
        appBar: AppBar(
          title: Text("Platform Convertor",style: TextStyle(fontSize: 25),),
          bottom: TabBar(
              controller: tabController,
              onTap: (val) {
                pageController.animateToPage(val,
                    duration: Duration(milliseconds: 500,),
                    curve: Curves.easeInOut,);
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
            Switch(value: false, onChanged: (val){},),
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
        floatingActionButton:  FloatingActionButton(
          onPressed: () {
            setState(() {
              showDialog(context: context, builder: (context)=>AlertDialog(
                content: Container(
                  height: 300,
                  width: 300,
                  child: StepperComponent(),
                ),
              ),);
            });
          },
          child: Icon(
            Icons.add,
            size: 40,
          ),
        ),
      ),
    );
  }
}