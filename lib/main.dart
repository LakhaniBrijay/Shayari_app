import 'package:flutter/material.dart';
import 'package:shayariapp/shayari2.dart';
import 'package:shayariapp/shayari3.dart';

void main() {
  runApp(MaterialApp(
    home:shayari(),
    debugShowCheckedModeBanner: false,
  ));
}

class shayari extends StatefulWidget {
  const shayari({Key? key}) : super(key: key);

  @override
  State<shayari> createState() => _shayariState();
}

class _shayariState extends State<shayari> {
  List photolist = [
        "myimages/1image.jpg",
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
  List textlist = [
    "शुभकामनाएँ शायरी",
    "दोस्ती शायरी",
    "मजेदार शायरी",
    "भगवन शायरी",
    "प्रेरणा स्त्रोत शायरी",
    "जीवन शायरी",
    "मोहब्बत शायरी",
    "यादें शायरी",
    "अन्य शायरी",
    "राजनीति शायरी",
    "प्रेम शायरी",
    "दर्द शायरी"
  ];

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
          itemCount: textlist.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(4),
              child: ListTile(onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return shayari2(textlist,index,"${photolist[index]}");
                },));
              },
                  tileColor: Colors.white,
                  leading: Container(
                    height: 45,
                    width: 45,
                    child: Image.asset("${photolist[index]}", fit: BoxFit.cover),
                    decoration: BoxDecoration(color: Colors.blue),
                  ),
                  title: Text(
                    "${textlist[index]}",
                    style: TextStyle(color: Colors.green),
                  )),
            );
          }),
    );
  }
}
