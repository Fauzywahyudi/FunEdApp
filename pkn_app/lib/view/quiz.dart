import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class QuizView extends StatefulWidget {
  @override
  _QuizViewState createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit,
        ),
        onPressed: (){},
      ),
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              decoration: BoxDecoration(color: Colors.deepPurple),
              height: 200,
            ),
          ),
          CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: <Widget>[
              // _first(),
              SliverAppBar(
                elevation: 0,
                title: Text(
                  "Daftar Pertanyaan",
                ),
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                floating: true,
                pinned: true,
                snap: false,
                expandedHeight: 200,
                flexibleSpace: Container(
                  
                ),
              ),
              // SliverPadding(
              //   padding: const EdgeInsets.all(16.0),
              //   sliver: SliverGrid(
              //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //           crossAxisCount: 2,
              //           childAspectRatio: 1.2,
              //           crossAxisSpacing: 10.0,
              //           mainAxisSpacing: 10.0),
              //       delegate: SliverChildBuilderDelegate(
              //         _buildWikiCategory,
              //         childCount: moduls.length,
              //       )),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}