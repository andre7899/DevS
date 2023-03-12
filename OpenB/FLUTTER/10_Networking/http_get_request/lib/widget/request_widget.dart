import 'package:flutter/material.dart';
import 'package:http_get_request/helpers/base_request.dart';
import 'package:http_get_request/models/item.dart';
import 'package:http_get_request/widget/error_widget.dart';
import 'package:http_get_request/widget/succes_widget.dart';

class HTTPWidget extends StatefulWidget {
  HTTPWidget(this._request);
  final HTTPRequest<Item> _request;
  @override
  State<HTTPWidget> createState() => _HTTPWidgetState();
}

class _HTTPWidgetState extends State<HTTPWidget> {
  late final Future<Item> futureItem;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureItem = widget._request.execute();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureItem,
      builder: (BuildContext context, AsyncSnapshot<Item> snapshot) {
        if (snapshot.hasError) {
          return ErrorItemWidget();
        }
        if (snapshot.hasData) {
          return SuccessWidget(snapshot.data);
        }
        return CircularProgressIndicator();
      },
    );
  }
}
