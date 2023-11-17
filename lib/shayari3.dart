import 'dart:io';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shayariapp/shayari4.dart';
import 'package:swipe/swipe.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

class shayari3 extends StatefulWidget {
  List textlist1 = [];
  int index = 0;

  
  shayari3(this.textlist1, this.index);

  @override
  State<shayari3> createState() => _shayari3State();
}

class _shayari3State extends State<shayari3> {
  PageController pg = PageController();
  WidgetsToImageController pq = WidgetsToImageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pg = PageController(initialPage: widget.index);
    _createFolder();
    forpermission();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Love Shayari",
        ),
        backgroundColor: Colors.green[500],
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.share)),
          IconButton(onPressed: () {}, icon: Icon(Icons.menu_open_rounded))
        ],
      ),
      body: Column(
        children: [
          WidgetsToImage(
            controller: pq,
            child: Container(
              height: 50,
              width: 410,
              decoration: BoxDecoration(color: Colors.white),
              child: Center(
                child: Container(
                  height: 100,
                  width: 225,
                  child: Row(
                    children: [
                      Expanded(
                          child: IconButton(
                              onPressed: () {},
                              icon: Image.asset("myimages/expand.png"))),
                      Expanded(
                        child: Text(
                            "${widget.index + 1}/${widget.textlist1.length}",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 25)),
                      ),
                      Expanded(
                          child: IconButton(
                              onPressed: () {},
                              icon: Image.asset("myimages/loop.png"))),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Swipe(
              onSwipeRight: () {
                print("Swipe left");
                pg.previousPage(
                    duration: Duration(milliseconds: 100),
                    curve: Curves.easeInOut);
              },
              onSwipeLeft: () {
                pg.nextPage(
                    duration: Duration(milliseconds: 100),
                    curve: Curves.easeInOut);
              },
              child: Container(
                color: Colors.white,
                alignment: Alignment.topCenter,
                child: Card(
                  elevation: 9,
                  child: Container(
                    margin: EdgeInsets.only(top: 1),
                    height: 350,
                    width: 390,
                    decoration: BoxDecoration(color: Colors.pink[300]),
                    child: PageView.builder(
                      itemCount: widget.textlist1.length,
                      controller: pg,
                      onPageChanged: (value) {
                        setState(() {
                          widget.index = value;
                        });
                      },
                      itemBuilder: (context, index) {
                        return ConstrainedBox(
                          constraints: BoxConstraints(maxHeight: 100),
                          child: Center(
                            child: Text(
                              widget.textlist1[widget.index],
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 23, color: Colors.white),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 50, right: 10, left: 10),
            color: Colors.green,
            child: Row(
              children: [
                Expanded(
                  child: IconButton(
                      onPressed: () {
                        FlutterClipboard.copy(widget.textlist1[widget.index])
                            .then((value) {
                          Fluttertoast.showToast(
                              msg: "Copy",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.black54,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        });
                      },
                      icon: Icon(Icons.copy_sharp)),
                ),
                Expanded(
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          if (widget.index > 0) {
                            widget.index--;
                          }
                        });
                      },
                      icon: Icon(Icons.arrow_back_ios_new)),
                ),
                Expanded(
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return shayari4(widget.textlist1[widget.index]);
                          },
                        ));
                      },
                      icon: Icon(Icons.pan_tool_alt_outlined)),
                ),
                Expanded(
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          if (widget.index < widget.textlist1.length - 1) {
                            widget.index++;
                          }
                        });
                      },
                      icon: Icon(Icons.arrow_forward_ios_rounded)),
                ),
                Expanded(
                  child: IconButton(
                      onPressed: ()  {
                        pq.capture().then((imageBytes) async {
                          DateTime mm = DateTime.now();
                          String imagename =
                              "IMAGE${mm.day}${mm.month}${mm.year}${mm.hour}${mm.minute}.jpg";
                          String imagepth = "$folderpath/$imagename";
                          File file = File(imagepth);
                          List<int> bytes = imageBytes as List<int>;
                          file.writeAsBytes(bytes);
                          await file.create();
                          Share.shareFiles(['${file.path}']);
                        });
                      },
                      icon: Icon(Icons.share)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> forpermission() async {
    PermissionStatus status = await Permission.storage.status;
    if (status.isDenied) {
      await Permission.storage.request();
    }
  }

  String folderpath = "";

  _createFolder() async {
    var folderName = "FlutterFolder";
    var path = Directory("storage/emulated/0/Download/$folderName");
    if (await path.exists()) {
      print("exist");
    } else {
      print("not exist");
      await path.create();
    }

    setState(() {
      folderpath = path.path;
    });
  }
}
