import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const name = 'progress_screen';
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Screen'),
      ),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            'Circular Progress Indicator',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          CircularProgressIndicator.adaptive(
            strokeWidth: 2,
          ),
          SizedBox(
            height: 20,
          ),
          Text('Circular indicator controlado'),
          _ControlledCircularProgress()
        ],
      ),
    );
  }
}

class _ControlledCircularProgress extends StatelessWidget {
  const _ControlledCircularProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Stream.periodic(
          Durations.medium2,
          (value) {
            print(value);
            return (value * 2) / 100;
          },
        ).takeWhile((value) => value <= 1),
        builder: (context, snapshot) {
          final progressValue = snapshot.data ?? 0.0;
          print('snapshot: $progressValue');
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator.adaptive(
                  strokeWidth: 2,
                  backgroundColor: Colors.black12,
                  value: progressValue,
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: LinearProgressIndicator(
                  value: progressValue,
                )),
              ],
            ),
          );
        });
  }
}
