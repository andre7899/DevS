import 'package:flutter/material.dart';

class MyMobileBody extends StatelessWidget {
  const MyMobileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('MOBILE'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            //yotube video
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                margin: const EdgeInsets.all(10),
                color: Colors.deepPurple[400],
              ),
            ),

            //comment section $ recomended videos
            Expanded(
                child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  height: 120,
                  color: Colors.deepPurple[400],
                  child: Text('$index'),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
