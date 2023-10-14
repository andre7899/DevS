import 'package:flutter/material.dart';

class MyDesktopBody extends StatelessWidget {
  const MyDesktopBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('DESKTOP'),
      ),
      body: Row(
        children: [
          //First Column
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  //yotube video
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      color: Colors.green[400],
                    ),
                  ),

                  //comment section $ recomended videos
                  Expanded(
                      child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(20),
                        height: 120,
                        color: Colors.green[400],
                        child: Text('$index'),
                      );
                    },
                  ))
                ],
              ),
            ),
          ),

          //Second Coolumn
          Container(
            width: 200,
            color: Colors.green[400],
          )
        ],
      ),
    );
  }
}
