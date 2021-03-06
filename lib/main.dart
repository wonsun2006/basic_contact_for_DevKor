import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add_outlined),
            onPressed: () {
              // function when FloatingActionButton is clicked
            },
          ),
          appBar: AppBar(
              backgroundColor: Colors.white,
              title: Row(children: [
                Text(
                  'λμΉ2λ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.black,
                ),
              ]),
              actions: [
                SizedBox(
                    width: 130,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.search_outlined,
                          color: Colors.black,
                        ),
                        Icon(
                          Icons.menu_outlined,
                          color: Colors.black,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.notifications_outlined,
                              color: Colors.black,
                            ),
                            Column(
//                              mainAxisAlignment:,
                              children: [
                                Container(
                                  width: 7,
                                  height: 7,
                                  margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                                  decoration: BoxDecoration(
                                      color: Colors.orange,
                                      shape: BoxShape.circle),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ))
              ]),
          body: ShopItemList(),
          bottomNavigationBar: BottomAppBar(
              child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BottomAppBarItem(param: {
                        'icon_url': Icons.home_filled,
                        'menu_text': "ν"
                      }),
                      BottomAppBarItem(param: {
                        'icon_url': Icons.assignment_outlined,
                        'menu_text': "λλ€μν"
                      }),
                      BottomAppBarItem(param: {
                        'icon_url': Icons.place_outlined,
                        'menu_text': "λ΄ κ·Όμ²"
                      }),
                      BottomAppBarItem(param: {
                        'icon_url': Icons.question_answer_outlined,
                        'menu_text': "μ±ν"
                      }),
                      BottomAppBarItem(param: {
                        'icon_url': Icons.person_outlined,
                        'menu_text': "λμ λΉκ·Ό"
                      }),
                    ],
                  )))),
    );
  }
}

class BottomAppBarItem extends StatelessWidget {
  BottomAppBarItem({Key? key, required this.param}) : super(key: key);

  final Map param;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: SizedBox(
          width: 60,
          height: 70,
          child: Column(
            children: [
              Icon(param['icon_url'],
              size: 35,),
              Text(
                param['menu_text'],
                textScaleFactor: 1.0,
              ),
            ],
          ),
        ));
  }
}

class ShopItem extends StatelessWidget {
  ShopItem({Key? key, required this.param}) : super(key: key);

  final Map param;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Column(children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(param["img_url"],
                  width: 120, height: 120, fit: BoxFit.cover),
            ),
            Expanded(
                child: SizedBox(
                    height: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                            child: Text(param["title_text"]),
                          ),
                          flex: 1,
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(15, 3, 0, 0),
                            child: Text(
                              param["area_name"] +
                                  " Β· " +
                                  param["is_reupdated"] +
                                  " " +
                                  param["last_time"],
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                              ),
                            ),
                          ),
                          flex: 1,
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(15, 3, 0, 0),
                            child: Text(
                              param["price_text"] + "μ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          flex: 1,
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(Icons.question_answer_outlined),
                                Text(param['comment_count']),
                                Icon(Icons.favorite_border_outlined),
                                Text(param['favorite_count'])
                              ],
                            ),
                          ),
                          flex: 1,
                        ),
                      ],
                    )))
          ],
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Container(
              child: Divider(
            thickness: 2.0,
          )),
        )
      ]),
    );
  }
}

class ShopItemList extends StatelessWidget {
  ShopItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Column(
            children: [
              ShopItem(param: {
                "img_url": "assets/dog.png",
                "title_text": "μ΄ κ°μμ§λ",
                "area_name": "λΆλΉλ",
                "is_reupdated": "λμ¬",
                "last_time": "1λΆ μ ",
                "price_text": "(λμΆ© λλ¬΄ λΉμΌ κ°κ²©)",
                "comment_count": "0",
                "favorite_count": "6",
              }),
              ShopItem(param: {
                "img_url": "assets/dog(1).png",
                "title_text": "λλ¬΄ κ·μ½μ΅λλ€.",
                "area_name": "κ°λ¨κ΅¬ λΌνλ",
                "is_reupdated": "",
                "last_time": "57μ΄ μ ",
                "price_text": "(λμΆ© λλ¬΄ λλ¬΄ λΉμΌ κ°κ²©)",
                "comment_count": "0",
                "favorite_count": "0",
              }),
              ShopItem(param: {
                "img_url": "assets/dog(2).png",
                "title_text": "μ£ΌμΈμ΄ μ ν€μ λλ΄μ.",
                "area_name": "μ­μΌ2λ",
                "is_reupdated": "λμ¬",
                "last_time": "50μ΄ μ ",
                "price_text": "(λΉμΈλ€λκΉμ)",
                "comment_count": "1",
                "favorite_count": "5",
              }),
              ShopItem(param: {
                "img_url": "assets/dog(3).png",
                "title_text": "μ¬λμ€λ¬μ΄ μ ν¬ λ§λ΄μλλ€.",
                "area_name": "μΌμ±λ",
                "is_reupdated": "",
                "last_time": "58μ΄ μ ",
                "price_text": "(μ¬μ€ λμΌλ‘ μ¬λ)",
                "comment_count": "0",
                "favorite_count": "0",
              }),
              ShopItem(param: {
                "img_url": "assets/dog(4).png",
                "title_text": "λ§μ μ¬λ λΆνλλ €μ.",
                "area_name": "μ­μΌλ",
                "is_reupdated": "",
                "last_time": "2λΆ μ ",
                "price_text": "(κ·Έλ° μμ΄ μλλλ€)",
                "comment_count": "1",
                "favorite_count": "2",
              }),
              ShopItem(param: {
                "img_url": "assets/dog(5).png",
                "title_text": "β₯",
                "area_name": "λΆλΉλ",
                "is_reupdated": "",
                "last_time": "4λΆ μ ",
                "price_text": "(μλΌμ)",
                "comment_count": "3",
                "favorite_count": "2",
              }),
            ],
          ),
        )
      ],
    );
  }
}

// κΉλ¨Ήμ κ² κ°μ λ΄μ©λ€
//      Container(
//        width: double.infinity, height: 50,
//        decoration: BoxDecoration(
//            color: Colors.blue,
//            border: Border.all(
//                color: Colors.black
//            )
//        ),
//      ),

//      Scaffold(
//        appBar: AppBar(),

//        body: Row(
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            crossAxisAlignment: CrossAxisAlignment.center,
//            children: [
//              Icon(Icons.star),
//              Icon(Icons.star),
//            ]
//        ),
//        bottomNavigationBar: BottomAppBar(),
//      )

// container default ν¬κΈ° λ¨μ : LP
// iconμ sizeκΉμ§κ° λ
// image μΆκ°νκ³  μΆμΌλ©΄ pubspec.yaml λ±λ‘ (ν¨ν€μ§, μ΄λ―Έμ§ λ± λ±λ‘)
