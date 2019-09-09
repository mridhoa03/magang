import 'package:flutter/material.dart';
import './home.dart';
import './popular.dart';
import './news.dart';

void main() {
  runApp(DWTabs());
}


class DWTabs extends StatefulWidget {
  @override
  DWTabstate createState() => DWTabstate();
  
}

class DWTabstate extends State<DWTabs> with SingleTickerProviderStateMixin {


  // CODE BARU
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: 3); //LENGTH = TOTAL TAB YANG AKAN DIBUAT
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  // AKHIR CODE BARU

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('DW Tabs'),
          
          backgroundColor: Colors.red[800],
          //CODE BARU
           bottom: TabBar(
             controller: controller,
             tabs: <Tab>[
               Tab(icon: Icon(Icons.home),),
               Tab(icon: Icon(Icons.note),),
               Tab(icon: Icon(Icons.poll),),
             ],
           ),
           //ENDCODE
        ),
        //CODE BARU
        body: TabBarView(
          controller: controller,
          children: <Widget>[
            Home(),
            Popular(),
            News()
          ],
        ),
        //ENDCODE
      ),
    );
  }
}