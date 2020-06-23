import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pkn_app/models/siswa.dart';
import 'package:pkn_app/view/category.dart';
import 'package:pkn_app/view/demo_values.dart';
import 'package:pkn_app/assets/assets.dart';

class HomeUser extends StatefulWidget {
  static const routeName = '/HomeUser';

  const HomeUser({Key key}) : super(key: key);
  @override
  _HomeUserState createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser> {
  Siswa _siswa;

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
    final Siswa args = ModalRoute.of(context).settings.arguments;
    setState(() {
      this._siswa = args;
    });

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
                leading: IconButton(icon: Icon(
                  Icons.person,size: 30,), 
                  tooltip: "Profil",
                onPressed: () {},
                ),
                actions: [
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.powerOff,
                      color: Colors.white,
                    ),
                    onPressed: () {
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
                      childCount: categoriesUser.length,
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
    Category category = categoriesUser[index];
    String route = category.name.toString().replaceAll(" ", "");
    print(route);

    return MaterialButton(
      elevation: 1.0,
      highlightElevation: 1.0,
      onPressed: () {
        Navigator.pushNamed(context, "/$route", arguments: category);
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

  _customAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return buildDialog(context, _siswa.getNama());
      },
    );
  }
}
