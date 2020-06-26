import 'package:flutter/material.dart';

class NextPage extends StatefulWidget {
  final text;
  final int jumlah;

  const NextPage({Key key, this.text, this.jumlah}) : super(key: key);
  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  List<Widget> widgets = List<Widget>();
  List<String> texts;
  String path = "assets/images/home.png";
  int jumlah = 0;

  @override
  void initState() {
    super.initState();
    jumlah = widget.jumlah;

    texts = widget.text.toString().split("@img");
    for (var i = 0; i < texts.length; i++) {
      widgets.add(Text(texts[i]));
      if (jumlah != 0) {
        widgets.add(Container(
            height: 150,
            width: 150,
            child: Image.asset(
              path,
              fit: BoxFit.fill,
            )));
            jumlah--;
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman view"),
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Container(
      child: SingleChildScrollView(
              child: Column(
          children: widgets == null ? [] : widgets,
        ),
      ),
    );
  }
}
