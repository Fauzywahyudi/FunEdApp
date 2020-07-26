import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pkn_app/assets/assets.dart';
import 'package:http/http.dart' as http;
import 'package:pkn_app/server/url.dart' as url;
import 'package:pkn_app/view/user/subbab.dart';
import 'package:pkn_app/view/user/video.dart';

class BabDescribUser extends StatefulWidget {
  final data;

  const BabDescribUser({Key key, this.data}) : super(key: key);
  @override
  _BabDescribUserState createState() => _BabDescribUserState();
}

class _BabDescribUserState extends State<BabDescribUser> {
  TextEditingController tecNamaSubBab = TextEditingController();
  TextEditingController tecIsiSubBab = TextEditingController();
  TextStyle titleStyle = TextStyle(
      fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      // floatingActionButton: _buildFAB(),
      body: _buildBody(),
    );
  }

  // Widget _buildFAB(){
  //   return FloatingActionButton(
  //     child: Icon(Icons.edit),
  //     onPressed: ()=>Navigator.push(context, MaterialPageRoute(fullscreenDialog: true, builder: (context) => AddSubBab(data: widget.data,),))
  //     // _customAlertDialog(context),
  //   );
  // }

  Widget _buildAppBar() {
    return AppBar(
      leading: backIos(Colors.white, context),
      title: Text("Bab " + widget.data['bab']),
      actions: [
        IconButton(
          icon: Icon(Icons.play_arrow),
          onPressed: () {
            if (widget.data['link_video'] == "" || widget.data['bab'] == null) {
              Fluttertoast.showToast(msg: "Tidak ada Video");
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Video(
                      bab: widget.data['bab'],
                      linkVideo: widget.data['link_video'],
                    ),
                  ));
            }
          },
          color: Colors.white,
          tooltip: "Video",
        )
      ],
    );
  }

  Widget _buildBody() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Stack(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              // padding: EdgeInsets.all(10),
              child: Image.asset(
                url.Url.assetImage + "pancasilaOpacity.jpeg",
                fit: BoxFit.fill,
              )),
          FutureBuilder<List>(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            _buildBab(snapshot.data[index]),
                            SizedBox(
                              height: 5,
                            )
                          ],
                        );
                      },
                    )
                  : Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBab(var data) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SubBabDescrUser(
              data: data,
            ),
          )),
      onLongPress: () {},
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.deepOrange,
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                blurRadius: 1,
                spreadRadius: 1,
                offset: Offset(1, 1))
          ],
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          children: <Widget>[
            Container(
              // color: Colors.pink,
              width: 75,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.bookOpen,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    "Sub Bab ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(26.0),
                      alignment: Alignment.centerRight,
                      child: Opacity(
                        opacity: 0.3,
                        child: Icon(
                          FontAwesomeIcons.bookOpen,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 26, horizontal: 15),
                      child: Text(
                        data['nama_sub_bab'],
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _customAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return _buildDialog();
      },
    );
  }

  Future<List> getData() async {
    final result = await http.post(url.Url.home + "getSubBab.php", body: {
      "id_bab": widget.data['id_bab'],
    });
    if (mounted) {
      setState(() {});
    }
    return json.decode(result.body);
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
                      FontAwesomeIcons.bookOpen,
                      color: Colors.deepPurple,
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: Text(
                        "Tambah Sub-Bab",
                        style: titleStyle,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
                Divider(),
                SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Material(
                    color: Colors.deepPurple.withOpacity(0.5),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: TextField(
                      controller: tecNamaSubBab,
                      onChanged: (String value) {},
                      cursorColor: Colors.deepPurple,
                      keyboardType: TextInputType.number,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                          hintText: "Nama Sub-Bab",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 13)),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Material(
                    color: Colors.deepPurple.withOpacity(0.5),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: TextField(
                      controller: tecIsiSubBab,
                      maxLines: 3,
                      minLines: 1,
                      onChanged: (String value) {},
                      cursorColor: Colors.deepPurple,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                          hintText: "Isi Sub-Bab",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 13)),
                    ),
                  ),
                ),
                SizedBox(height: 40.0),
                Row(
                  children: [
                    Expanded(
                      child: FlatButton(
                        padding: const EdgeInsets.all(5.0),
                        child: Text("Cancel"),
                        onPressed: () => Navigator.pop(context, true),
                      ),
                    ),
                    Expanded(
                      child: FlatButton(
                        padding: const EdgeInsets.all(5.0),
                        child: Text("Oke"),
                        onPressed: () async {
                          await save(tecNamaSubBab.text, tecIsiSubBab.text,
                              widget.data['id_bab']);
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

  Future save(String bab, String nama, String idbab) async {
    await http.post(url.Url.home + "addSubBab.php",
        body: {"nama_subbab": bab, "isi_subbab": nama, "id_bab": idbab});
    Navigator.pop(context);
    tecNamaSubBab.text = "";
    tecIsiSubBab.text = "";
    setState(() {});
  }
}

// class Video extends StatelessWidget {
//   final String urlVideo;

//   const Video({Key key, this.urlVideo}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: ChewieListItem(
//           // url video 2
//           videoPlayerController: VideoPlayerController.network(
//             'https://youtu.be/ltnwLJF4f1k',
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ChewieListItem extends StatefulWidget {
//   final VideoPlayerController videoPlayerController;
//   final bool looping;

//   ChewieListItem({
//     @required this.videoPlayerController,
//     this.looping,
//     Key key,
//   }) : super(key: key);

//   @override
//   _ChewieListItemState createState() => _ChewieListItemState();
// }

// class _ChewieListItemState extends State<ChewieListItem> {
//   ChewieController _chewieController;

//   @override
//   void initState() {
//     super.initState();
//     _chewieController = ChewieController(
//       videoPlayerController: widget.videoPlayerController,
//       aspectRatio: 16 / 9,
//       autoInitialize: true,
//       errorBuilder: (context, errorMessage) {
//         return Center(
//           child: Text(
//             errorMessage,
//             style: TextStyle(color: Colors.white),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Chewie(
//         controller: _chewieController,
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     widget.videoPlayerController.dispose();
//     _chewieController.dispose();
//   }
// }
