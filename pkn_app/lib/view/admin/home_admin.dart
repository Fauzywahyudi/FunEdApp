import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pkn_app/view/category.dart';
import 'package:pkn_app/view/demo_values.dart';
// import 'quiz_options.dart';

class HomeAdmin extends StatefulWidget {
  static const routeName = '/HomeAdmin';
  @override
  _HomeAdminState createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
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


  TextStyle titleStyle = TextStyle(
      fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  

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
                actions: [
                  IconButton(icon: Icon(FontAwesomeIcons.powerOff,color: Colors.white,), onPressed: (){
                    _customAlertDialog(context);
                  },
                  tooltip: "Logout",                  
                  ),
                ],
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

  _customAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return _buildDialog();
      },
    );
  }

  Widget _buildDialog() {
    return Material(
        type: MaterialType.transparency,
        child: Container(
          alignment: Alignment.center,
          child: Container(
            margin: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      FontAwesomeIcons.powerOff,
                      color: Colors.deepPurple,
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: Text(
                        "Log out",
                        style: titleStyle,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
                Divider(),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Apakah anda yakin untuk logout?"),
                ),
                
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Expanded(
                      child: FlatButton(
                        padding: const EdgeInsets.all(5.0),
                        child: Text("Tidak"),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    Expanded(
                      child: FlatButton(
                        padding: const EdgeInsets.all(5.0),
                        child: Text("Iya"),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pushReplacementNamed(context, '/LoginUser');
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  
}
