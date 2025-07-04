import 'package:flutter/material.dart';

const cards = <Map<String, dynamic>>[
  {
    'elevation': 0.0,
    'label': 'Elevation 0',
  },
  {
    'elevation': 1.0,
    'label': 'Elevation 1.0',
  },
  {
    'elevation': 2.0,
    'label': 'Elevation 2.0',
  },
  {
    'elevation': 3.0,
    'label': 'Elevation 3.0',
  },
  {
    'elevation': 4.0,
    'label': 'Elevation 4.0',
  },
  {
    'elevation': 5.0,
    'label': 'Elevation 5.0',
  },
];

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  static const String name = 'cards_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter + Material 3'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...cards.map(
              (e) => _CardType1(
                label: e['label'],
                elevation: e['elevation'],
              ),
            ),
            ...cards.map(
              (e) => _CardType2(
                label: e['label'],
                elevation: e['elevation'],
              ),
            ),
            ...cards.map(
              (e) => _CardType3(
                label: e['label'],
                elevation: e['elevation'],
              ),
            ),
            ...cards.map(
              (e) => _CardType4(
                label: e['label'],
                elevation: e['elevation'],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

class _CardType1 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType1({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.more_vert)),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(label),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardType2 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType2({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      shape: RoundedRectangleBorder(
          side: BorderSide(
            color: colors.primary,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.more_vert)),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(label),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardType3 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType3({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      color: colors.surfaceContainer,
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.more_vert)),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text('$label - Filled'),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardType4 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType4({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior:
          Clip.hardEdge, //Evita que los hijos salgan del contenido del padre
      elevation: elevation,
      child: Stack(
        children: [
          Image.network(
            'https://picsum.photos/id/${elevation.toInt()}/600/350',
            height: 350,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(20)),
                ),
                child: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.more_vert))),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(label),
          ),
        ],
      ),
    );
  }
}
