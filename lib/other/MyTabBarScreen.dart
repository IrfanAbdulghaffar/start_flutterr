import 'package:flutter/material.dart';

class MyTabBarScreen extends StatefulWidget {
  const MyTabBarScreen({Key? key}) : super(key: key);

  @override
  State<MyTabBarScreen> createState() => _MyTabBarScreenState();
}

class _MyTabBarScreenState extends State<MyTabBarScreen> {
  TabController? controller;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
            drawer: Drawer(
              child: ListView(
                children: [
                  DrawerHeader(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 45,
                              width: 45,
                              margin: EdgeInsets.only(left: 8),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/images/a.png'))),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Irfan Abdul ghaffar",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Text(
                                    "irfanjpj@gmail.com",
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 12),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.apps,
                    ),
                    title: const Text('Manage apps & device'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.notifications_outlined,
                    ),
                    title: const Text('Offers & notifications'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.payment,
                    ),
                    title: const Text('Payments & Subscriptions'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.shield_outlined,
                    ),
                    title: const Text('Play Protect'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.folder_outlined,
                    ),
                    title: const Text('Library'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.settings_outlined,
                    ),
                    title: const Text('Settings'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.help_outline),
                    title: Text("Help & feedback"),
                  )
                ],
              ),
            ),
            appBar: AppBar(
              actions: [
                PopupMenuButton<Text>(
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        child: Text("First"),
                      ),
                      PopupMenuItem(
                        child: Text(
                          "Second"
                        ),
                      ),
                      PopupMenuItem(
                        child: Text(
                          "Tj88888888"
                        ),
                       onTap: (){
                          PopupMenuButton(
                            itemBuilder: (context){
                              return[
                                PopupMenuItem(
                                  child: Text("First"),
                                ),
                                PopupMenuItem(
                                  child: Text(
                                      "Second"
                                  ),
                                ),
                              ];
                            }
                          );
                       },
                      ),
                    ];
                  },
                )
              ],
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: Icon(Icons.widgets_outlined));
                },
              ),
              bottom: TabBar(
                controller: controller,
                tabs: <Tab>[
                  Tab(text: "Tab 1", icon: Icon(Icons.bolt)),
                  Tab(
                    text: "Tab 1",
                  ),
                ],

              ),
            ),
            body: TabBarView(children: [
              Center(child: Text("Tab 1 body")),
              Center(child: Text("Tab 2 body")),
            ])),
      ),
    );
  }
}
