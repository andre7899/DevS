import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView({
    super.key,
  });

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloperModeEnabled = true;
  Transportation groupValue = Transportation.car;
  bool wantsLunch = false;
  bool wantsBreakfast = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile.adaptive(
          title: const Text('Developer Mode'),
          subtitle: const Text('Controles adicionales'),
          value: isDeveloperModeEnabled,
          onChanged: (value) {
            setState(() {
              isDeveloperModeEnabled = value;
            });
          },
        ),
        ExpansionTile(
          title: const Text('Vehiculo de tranpsporte'),
          subtitle: Text(groupValue.name),
          children: [
            RadioListTile.adaptive(
              value: Transportation.car,
              title: const Text('By Car'),
              subtitle: const Text('viajar por carro'),
              groupValue: groupValue,
              onChanged: (value) {
                setState(() {
                  groupValue = value ?? Transportation.car;
                });
              },
            ),
            RadioListTile.adaptive(
              value: Transportation.boat,
              title: const Text('By Boat'),
              subtitle: const Text('viajar por barco'),
              groupValue: groupValue,
              onChanged: (value) {
                setState(() {
                  groupValue = value ?? Transportation.boat;
                });
              },
            ),
            RadioListTile.adaptive(
              value: Transportation.plane,
              title: const Text('By Plane'),
              subtitle: const Text('viajar por avion'),
              groupValue: groupValue,
              onChanged: (value) {
                setState(() {
                  groupValue = value ?? Transportation.plane;
                });
              },
            ),
            RadioListTile.adaptive(
              value: Transportation.submarine,
              title: const Text('By Submarine'),
              subtitle: const Text('viajar por submarino'),
              groupValue: groupValue,
              onChanged: (value) {
                setState(() {
                  groupValue = value ?? Transportation.submarine;
                });
              },
            ),
          ],
        ),
        CheckboxListTile.adaptive(
            value: wantsBreakfast,
            onChanged: (value) {
              setState(() {
                wantsBreakfast = value ?? false;
              });
            },
            title: const Text('Desayuno')),
        CheckboxListTile.adaptive(
            value: wantsLunch,
            onChanged: (value) {
              setState(() {
                wantsLunch = value ?? false;
              });
            },
            title: const Text('Almuerzo')),
        CheckboxListTile.adaptive(
            value: wantsDinner,
            onChanged: (value) {
              setState(() {
                wantsDinner = value ?? false;
              });
            },
            title: const Text('Cena')),
      ],
    );
  }
}
