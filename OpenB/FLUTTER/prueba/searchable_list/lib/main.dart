import 'dart:async';

import 'package:flutter/material.dart';
import 'package:searchable_listview/searchable_listview.dart';


bool show =true;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: SafeArea(
          child: ExampleApp(),
        ),
      ),
    );
  }
}

class ExampleApp extends StatefulWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  State<ExampleApp> createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  final List<Actor> actors = [
    Actor(age: 47, name: 'Leonardo', lastName: 'DiCaprio'),
    Actor(age: 58, name: 'Johnny', lastName: 'Depp'),
    Actor(age: 78, name: 'Robert', lastName: 'De Niro'),
    Actor(age: 44, name: 'Tom', lastName: 'Hardy'),
    Actor(age: 66, name: 'Denzel', lastName: 'Washington'),
    Actor(age: 49, name: 'Ben', lastName: 'Affleck'),
  ];

  final Map<String, List<Actor>> mapOfActors = {
    'test 1': [
      Actor(age: 47, name: 'Leonardo', lastName: 'DiCaprio'),
      Actor(age: 66, name: 'Denzel', lastName: 'Washington'),
      Actor(age: 49, name: 'Ben', lastName: 'Affleck'),
    ],
    'test 2': [
      Actor(age: 58, name: 'Johnny', lastName: 'Depp'),
      Actor(age: 78, name: 'Robert', lastName: 'De Niro'),
      Actor(age: 44, name: 'Tom', lastName: 'Hardy'),
    ]
  };

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const Text('Searchable list with divider'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: expansionSearchableList(),
            ),
          ),
          
        ],
      ),
    );
  }

  // void addActor() {
  //   actors.add(Actor(
  //     age: 10,
  //     lastName: 'Ali',
  //     name: 'ALi',
  //   ));
  //   setState(() {});
  // }

  Widget expansionSearchableList() {
    return SearchableList<Actor>(
      initialList: actors,
      builder: (Actor user) => Visibility(
        visible: show,
        child: UserItem(user: user)),
      filter: (value) => actors
          .where(
            (element) => element.name.toLowerCase().contains(value) || element.lastName.toLowerCase().contains(value),
          )
          .toList(),
      emptyWidget: const EmptyView(),
      inputDecoration: InputDecoration(
        labelText: "Search Actor",
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(

          borderSide: const BorderSide(
            color: Colors.blue,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabled: show
      ),
    );
  }
}

class UserItem extends StatefulWidget {
  UserItem({required this.user, super.key});
  Actor user;

  @override
  State<UserItem> createState() => _UserItemState();
}

class _UserItemState extends State<UserItem> {
  @override
  Widget build(BuildContext context) {
    return Text('${widget.user.name} ${widget.user.lastName}');
  }
}

// class ActorItem extends StatelessWidget {
//   final Actor actor;

//   const ActorItem({
//     Key? key,
//     required this.actor,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         height: 60,
//         decoration: BoxDecoration(
//           color: Colors.grey[200],
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Row(
//           children: [
//             const SizedBox(
//               width: 10,
//             ),
//             Icon(
//               Icons.star,
//               color: Colors.yellow[700],
//             ),
//             const SizedBox(
//               width: 10,
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'Firstname: ${actor.name}',
//                   style: const TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   'Lastname: ${actor.lastName}',
//                   style: const TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   'Age: ${actor.age}',
//                   style: const TextStyle(
//                     color: Colors.black,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class EmptyView extends StatelessWidget {
  const EmptyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.error,
          color: Colors.red,
        ),
        Text('no actor is found with this name'),
      ],
    );
  }
}

class Actor {
  int age;
  String name;
  String lastName;

  Actor({
    required this.age,
    required this.name,
    required this.lastName,
  });
}
