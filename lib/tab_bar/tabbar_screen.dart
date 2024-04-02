import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
              ),
              Tab(
                icon: Icon(Icons.location_city),
              ),
              Tab(
                text: 'Hello',
              ),
              Tab(
                text: 'Gender',
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: TabBarView(
            children: [
              const Center(
                  child: Text(
                'Welcome',
                style: TextStyle(fontSize: 30, color: Colors.blue),
              )),
              const Center(
                  child: Text(
                'Good Morning',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.red),
              )),
              ListView.builder(
                itemCount: 8,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Hello Tabs'),
                      ),
                      InkWell(
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.deepOrange),
                          width: double.infinity,
                          child: const Center(
                              child: Text(
                            'Save',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                        onTap: () {},
                      ),
                    ],
                  );
                },
              ),
              const Center(
                  child: Text(
                'Payment',
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
