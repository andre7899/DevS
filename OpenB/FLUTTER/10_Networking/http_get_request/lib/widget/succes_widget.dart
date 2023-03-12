import 'package:flutter/material.dart';
import 'package:http_get_request/models/item.dart';

class SuccessWidget extends StatelessWidget {
  SuccessWidget(this.item, {super.key});

  Item? item;

  @override
  Widget build(BuildContext context) {
    if (item != null) {
      return Text('${item!.id} - ${item!.title}');
    } else {
      return Text('No data to show');
    }
  }
}
