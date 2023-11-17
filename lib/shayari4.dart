import 'package:flutter/material.dart';
import 'package:shayariapp/main.dart';

class shayari4 extends StatefulWidget {
  String shayari;

  shayari4(this.shayari);

  @override
  State<shayari4> createState() => _shayari4State();
}

class _shayari4State extends State<shayari4> {
  List<Color> clrs = [
    Colors.deepOrangeAccent,
    Colors.black,
    Colors.green,
    Colors.blue,
    Colors.white,
    Colors.orangeAccent,
    Colors.red,
    Colors.brown,
    Colors.cyanAccent,
    Colors.pink,
    Colors.purple,
    Colors.yellow,
    Colors.deepPurpleAccent,
    Colors.teal,
    Colors.indigo,
    Colors.lightGreenAccent,
    Colors.tealAccent,
    Colors.lightBlue,
  ];
  List<List<Color>> gcolor = [
    [Colors.lightBlue, Colors.tealAccent],
    [Colors.lightGreenAccent, Colors.indigo],
    [Colors.teal, Colors.yellow],
    [Colors.teal, Colors.deepPurpleAccent]
  ];
  List emojilist = [
    "🥲 🥹 ☺️ 🥰 🤪",
    "🌱 🌿 ☘ 🍀 🎍 🪴 🎋 🍃 🍂 🍁 ",
    "🍄 🐚 🪨 🌾 💐 🌷 🪷 🌹 🥀 🌺 🌸 🌼 🌻",
    "❤️🧡 🤍 🤎 ❤️‍ ❤️🩹 ❣️",
    "🐶 🐱 🐭 🐹 🐰 🦊 🐻 🐼",
    "👋🏻 🤚🏻 🖐🏻 ✋🏻 🖖🏻 👌🏻 🤌🏻 🤏🏻 ✌🏻 🤞🏻 🫰🏻 🤟🏻 🤘🏻 🤙🏻",
    "🥲 🥹 ☺️ 🥰 🤪",
    "🌱 🌿 ☘ 🍀 🎍 🪴 🎋 🍃 🍂 🍁 ",
    "🍄 🐚 🪨 🌾 💐 🌷 🪷 🌹 🥀 🌺 🌸 🌼 🌻",
    "❤️🧡 🤍 🤎 ❤️‍ ❤️🩹 ❣️",
    "🐶 🐱 🐭 🐹 🐰 🦊 🐻 🐼",
    "👋🏻 🤚🏻 🖐🏻 ✋🏻 🖖🏻 👌🏻 🤌🏻 🤏🏻 ✌🏻 🤞🏻 🫰🏻 🤟🏻 🤘🏻 🤙🏻",
  ];

  Color fontcolor = Colors.white;
  Color backcolor = Colors.red;
  double currentfont = 20;
  String font = '';
  int a = 0;
  bool isGrid = false;
  String b = "🥲 🥹 ☺️ 🥰 🤪";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Love Shayari",
        ),
        backgroundColor: Colors.green[500],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Card(
            elevation: 10,
            margin: EdgeInsets.only(top: 60, right: 20, left: 20),
            child: Container(
              height: 400,
              alignment: Alignment.center,
              child: Center(
                child: Text(
                  "${b}\n${widget.shayari}\n${b}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: currentfont,
                      color: fontcolor,
                      fontFamily: font),
                ),
              ),
              decoration: BoxDecoration(
                  gradient: isGrid
                      ? LinearGradient(colors: gcolor[a])
                      : LinearGradient(colors: [backcolor, backcolor])),
            ),
          ),
          Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Row(
                    children: [
                      Expanded(
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  isGrid = true;
                                  if (a <= 2) {
                                    a++;
                                  } else {
                                    a = 0;
                                  }
                                });
                              },
                              icon: Image.asset("myimages/loop.png"))),
                      Expanded(
                          child: IconButton(
                              onPressed: () {},
                              icon: Image.asset("myimages/expand.png"))),
                    ],
                  ),
                  height: 50,
                  width: 100,
                  color: Colors.white,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: List.generate(3, (index) {
                //     return get(index, 0);
                //   }),
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: List.generate(3, (index) {
                //     return get(index, 1);
                //   }),
                // )
                Wrap(
                  children: List.generate(6, (index) => generateList(index)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  //int i = 0;
  // List list1 = ["Background", "Text Color", "Share"];
  // List list2 = ["Font", "Emoji", "Text Size"];

  List myList = [
    "Background",
    "Text Color",
    "Share",
    "Font",
    "Emoji",
    "Text Size"
  ];

  // Widget get(int index, int i) {
  //   return Container(
  //     margin: EdgeInsets.all(10),
  //     height: 45,
  //     width: 110,
  //     child: Center(
  //       child: Text(
  //         i == 0 ? "${list1[index]}" : "${list2[index]}",
  //         style: TextStyle(color: Colors.white, fontSize: 15),
  //       ),
  //     ),
  //     decoration: BoxDecoration(
  //         color: Colors.red, border: Border.all(color: Colors.black)),
  //   );
  // }

  generateList(int index) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            if (index == 1) {
              return Container(
                height: 130,
                child: GridView.builder(
                  itemCount: clrs.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          Navigator.pop(context);
                          fontcolor = clrs[index];
                        });
                      },
                      child: Container(
                        color: clrs[index],
                        margin: EdgeInsets.all(10),
                      ),
                    );
                  },
                ),
              );
            } else if (index == 0) {
              return Container(
                height: 130,
                child: GridView.builder(
                  itemCount: clrs.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          backcolor = clrs[index];
                          isGrid = false;
                        });
                      },
                      child: Container(
                        color: clrs[index],
                        margin: EdgeInsets.all(10),
                      ),
                    );
                  },
                ),
              );
            } else if (index == 3) {
              return Container(
                  height: 130,
                  child: ListView.builder(
                    itemCount: 6,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Center(
                        child: InkWell(
                          onTap: () {
                            return setState(() {
                              font = "f${index + 1}";
                            });
                          },
                          child: Container(
                            width: 100,
                            height: 50,
                            margin: EdgeInsets.all(2),
                            child: Center(
                                child: Text(
                              "font",
                              style: TextStyle(fontFamily: "f${index + 1}"),
                            )),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                border: Border.all(color: Colors.black)),
                          ),
                        ),
                      );
                    },
                  ));
            } else if (index == 4) {
              return Container(
                height: 250,
                child: ListView.builder(
                  itemCount: emojilist.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          b = emojilist[index];
                        });
                      },
                      child: Container(
                        height: 50,
                        child: Text(
                          emojilist[index],
                          style: TextStyle(fontSize: 30),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: Colors.black12),
                      ),
                    );
                  },
                ),
              );
            } else {
              return StatefulBuilder(
                builder: (context, setState1) {
                  return Container(
                    height: 130,
                    child: Slider(
                      value: currentfont,
                      max: 30,
                      min: 10,
                      onChanged: (value) {
                        setState1(() {
                          setState(() {
                            currentfont = value;
                          });
                        });
                      },
                    ),
                  );
                },
              );
            }
          },
        );
      },
      child: Container(
        margin: EdgeInsets.all(10),
        height: 45,
        width: 110,
        child: Center(
          child: Text(
            "${myList[index]}",
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
        decoration: BoxDecoration(
            color: Colors.red, border: Border.all(color: Colors.black)),
      ),
    );
  }
}
