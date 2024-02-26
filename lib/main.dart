import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  double value=0;
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.lightBlueAccent,
                    Colors.blueAccent
                  ],
                  begin:Alignment.bottomCenter,
                  end: Alignment.topCenter
              ),
            ),
          ),
          SafeArea(
              child: Container(
                width: 200.0,
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    DrawerHeader(child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircleAvatar(
                          radius: 50.0,
                          backgroundImage:
                          AssetImage('assets/me.jpeg'),
                        ),
                        SizedBox(height: 10.0,),
                        Text(
                          "@zain_dev_",
                          style: TextStyle(color: Colors.white,fontSize: 15.0,fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          ListTile(
                            onTap: (){},
                            leading: const Icon(
                              Icons.home,
                              color: Colors.white,
                            ),
                            title: const Text("Home",style: TextStyle(color: Colors.white),),
                          ),
                          ListTile(
                            onTap: (){},
                            leading: const Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            title: const Text("Profile",style: TextStyle(color: Colors.white),),
                          ),
                          ListTile(
                            onTap: (){},
                            leading: const Icon(
                              Icons.settings,
                              color: Colors.white,
                            ),
                            title: const Text("Settings",style: TextStyle(color: Colors.white),),
                          ),
                          ListTile(
                            onTap: (){},
                            leading: const Icon(
                              Icons.login_outlined,
                              color: Colors.white,
                            ),
                            title: const Text("Logout",style: TextStyle(color: Colors.white),),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
          ),
          TweenAnimationBuilder(
              tween: Tween<double>(begin: 0,end:value),
              duration: const Duration(microseconds: 5000),
              curve: Curves.easeIn,
              builder: (_,double val,__){
                return(
                    Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3,2,0.001)
                        ..setEntry(0,3,200*val)
                        ..rotateY((pi/6)*val),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Scaffold(
                          appBar: AppBar(
                            title: const Text("@zain_dev_",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),
                            backgroundColor: Colors.lightBlueAccent,
                          ),
                          body: const Center(
                            child: Text("Swipe Right To Open The Menu"),
                          ),
                        ),
                      ),
                    )
                );
              }),
          GestureDetector(
            onHorizontalDragUpdate: (e){
              if(e.delta.dx>0)
              {
                setState(() {
                  value=1;
                });
              }
              else{
                setState(() {
                  value=0;
                });
              }
            },
          )
        ],
      ),
    );
  }
}
