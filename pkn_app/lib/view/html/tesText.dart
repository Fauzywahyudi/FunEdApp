import 'package:flutter/material.dart';
import 'package:pkn_app/view/html/nextHalaman.dart';

class TestText extends StatefulWidget {
  @override
  _TestTextState createState() => _TestTextState();
}

class _TestTextState extends State<TestText> {
  TextEditingController tecIsiSubBab = TextEditingController();
  int _jumlah= 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tes TextField"),
        actions: [
          IconButton(icon: Icon(Icons.restore), onPressed: (){
            tecIsiSubBab.text="";
          }),
          IconButton(icon: Icon(Icons.play_arrow), onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => NextPage(text: tecIsiSubBab.text,jumlah: _jumlah,),))),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          tecIsiSubBab.text+=" \n@img\n";
          _jumlah++;
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
                  child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0),
                child: Material(
                  color: Colors.deepPurple.withOpacity(0.5),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: TextField(
                    controller: tecIsiSubBab,
                    maxLines: 30,
                    minLines: 15,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 15),
                    onChanged: (String value) {},
                    cursorColor: Colors.deepPurple,
                    decoration: InputDecoration(
                        hintText: "Isi Sub-Bab",
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 13)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
