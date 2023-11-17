import 'package:flutter/material.dart';
import 'package:shayariapp/shayari3.dart';

import 'Modelclass.dart';

class shayari2 extends StatefulWidget {
List textlist = [];
int index = 0;
List cat = [
  "myimages/1image.jpg"
  "myimages/2image.webp",
  "myimages/3image.jpg",
  "myimages/4image.jpg",
  "myimages/5image.jpeg",
  "myimages/6image.jpeg",
  "myimages/7image.jpeg",
  "myimages/8image.jpeg",
  "myimages/9image.jpeg",
  "myimages/10image.jpeg",
  "myimages/11image.jpeg",
  "myimages/12image.jpeg",
  "myimages/13image.jpeg"
];
String img;

shayari2(this.cat,this.index, this.img);

  @override
  State<shayari2> createState() => _shayari2State();


}

class _shayari2State extends State<shayari2> {
  List emojilist = [
    "🥲🥰",
    "😊 😇",
    "😉 😌",
    "😍 🥰",
    "😘 😗" ,
    "😙 😚",
    "😛 😝",
    "🤪 🤨",
    "🥸🧐",
    "🤓 😎 ",
    "🤩 🥳",
    "😏 😔",
    "😒 😞",
    "😟 😕"
    "😙 😚",
    "🤪 🤨",
    "🥸🧐",
    "🤓 😎 ",
    "🤩 🥳",
    "😏 😔",
    "😊 😇",
    "😉 😌",
    "😍 🥰",
    "😘 😗" ,
    "😙 😚",
  ];
  List blankList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.index==0) {
      blankList=Modelclass().textlist1;
    } else if(widget.index==1) {
      blankList = Modelclass().textlist2;
    } else if(widget.index==2) {
      blankList = Modelclass().textlist3;
    } else if(widget.index==3) {
      blankList = Modelclass().textlist4;
    } else if(widget.index==4) {
      blankList = Modelclass().textlist5;
    } else if(widget.index==5) {
      blankList = Modelclass().textlist6;
    } else if(widget.index==6) {
      blankList = Modelclass().textlist7;
    } else if(widget.index==7) {
      blankList = Modelclass().textlist8;
    } else if(widget.index==8) {
      blankList = Modelclass().textlist9;
    } else if(widget.index==9) {
      blankList = Modelclass().textlist10;
    } else if(widget.index==10) {
      blankList = Modelclass().textlist11;
    } else if(widget.index==11) {
      blankList = Modelclass().textlist12;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
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
      body: ListView.builder(
        itemCount: blankList.length,
        itemBuilder: (context, index) {
          return Container(decoration: BoxDecoration(),
            //width: 200,
            child: Padding(
              padding: EdgeInsets.all(4),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),

                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return shayari3(blankList,index);
                  },));
                },
                  tileColor: Colors.pink[300],
                  leading: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(color: Colors.blue),
                    child: Image.asset(widget.img, fit: BoxFit.cover),
                  ),
                  title: Container(
                    height: 60,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${emojilist[index]}\n${blankList[index]}",maxLines: 2,
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  )),
            ),
          );
        },
      ),
    );
  }
}
