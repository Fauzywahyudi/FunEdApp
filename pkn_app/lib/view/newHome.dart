import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'category.dart';
import 'demo_values.dart';
// import 'quiz_options.dart';

class QuizHomePage extends StatefulWidget {
  @override
  _QuizHomePageState createState() => _QuizHomePageState();
}

class _QuizHomePageState extends State<QuizHomePage> {
  // static final String path = "lib/src/pages/quiz_app/home.dart";
  final List<Color> tileColors = [
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.pink,
    Colors.indigo,
    Colors.lightBlue,
    Colors.amber,
    Colors.deepOrange,
    Colors.red,
    Colors.brown
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              SliverAppBar(
                elevation: 0,
                floating: true,
                pinned: true,
                snap: false,
                // centerTitle: true,
                expandedHeight: 100,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                  "FunEd App",
                ),
                centerTitle: true,
                collapseMode: CollapseMode.parallax,
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(16.0),
                sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0),
                    delegate: SliverChildBuilderDelegate(
                      _buildCategoryItem,
                      childCount: categories.length,
                    )),
              ),
              SliverFillRemaining(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(BuildContext context, int index) {
    Category category = categories[index];
    return MaterialButton(
      elevation: 1.0,
      highlightElevation: 1.0,
      onPressed: () {
        Navigator.pushNamed(context, "/${category.name}");
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.deepOrange,
      textColor: Colors.white70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (category.icon != null) Icon(category.icon),
          if (category.icon != null) SizedBox(height: 5.0),
          Text(
            category.name,
            textAlign: TextAlign.center,
            maxLines: 3,
          ),
        ],
      ),
    );
  }

  // _categoryPressed(BuildContext context, Category category) {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (sheetContext) => BottomSheet(
  //       builder: (_) => QuizOptionsDialog(
  //         category: category,
  //       ),
  //       onClosing: () {},
  //     ),
  //   );
  // }

  
}
