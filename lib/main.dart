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
                  '대치2동',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                ),
                Icon(Icons.keyboard_arrow_down),
              ]),
              actions: [
                SizedBox(
                    width: 130,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.search_outlined, color: Colors.black,),
                        Icon(Icons.menu_outlined, color: Colors.black,),
                        Icon(Icons.notifications_outlined, color: Colors.black,),
                      ],
                    ))
              ]),
          body: ShopItemList(),
          bottomNavigationBar: BottomAppBar(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BottomAppBarItem(
                  param: {'icon_url': Icons.home_filled, 'menu_text': "홈"}),
              BottomAppBarItem(param: {
                'icon_url': Icons.assignment_outlined,
                'menu_text': "동네생활"
              }),
              BottomAppBarItem(param: {
                'icon_url': Icons.place_outlined,
                'menu_text': "내 근처"
              }),
              BottomAppBarItem(param: {
                'icon_url': Icons.question_answer_outlined,
                'menu_text': "채팅"
              }),
              BottomAppBarItem(param: {
                'icon_url': Icons.person_outlined,
                'menu_text': "나의 당근"
              }),
            ],
          ))),

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
          height: 50,
          child: Column(
            children: [
              Icon(param['icon_url']),
              Text(
                param['menu_text'],
                textScaleFactor: 0.6,
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
                                  " " +
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
                              param["price_text"] + "원",
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
                "title_text": "이 강아지는",
                "area_name": "분당동",
                "is_reupdated": "끌올",
                "last_time": "1분 전",
                "price_text": "(대충 너무 비싼 가격)",
                "comment_count": "0",
                "favorite_count": "6",
              }),
              ShopItem(param: {
                "img_url": "assets/dog(1).png",
                "title_text": "너무 귀엽습니다.",
                "area_name": "강남구 논현동",
                "is_reupdated": "",
                "last_time": "57초 전",
                "price_text": "(대충 너무 너무 비싼 가격)",
              "comment_count": "0",
              "favorite_count": "0",
              }),
              ShopItem(param: {
                "img_url": "assets/dog(2).png",
                "title_text": "주인이 잘 키웠나봐요.",
                "area_name": "역삼2동",
                "is_reupdated": "끌올",
                "last_time": "50초 전",
                "price_text": "(비싸다니까요)",
                "comment_count": "1",
                "favorite_count": "5",
              }),
              ShopItem(param: {
                "img_url": "assets/dog(3).png",
                "title_text": "사랑스러운 저희 막내입니다.",
                "area_name": "삼성동",
                "is_reupdated": "",
                "last_time": "58초 전",
                "price_text": "(사실 돈으로 사는)",
              "comment_count": "0",
              "favorite_count": "0",

              }),
              ShopItem(param: {
                "img_url": "assets/dog(4).png",
                "title_text": "많은 사랑 부탁드려요.",
                "area_name": "역삼동",
                "is_reupdated": "",
                "last_time": "2분 전",
                "price_text": "(그런 아이 아닙니다)",
              "comment_count": "1",
              "favorite_count": "2",
              }),
              ShopItem(param: {
                "img_url": "assets/dog(5).png",
                "title_text": "♥",
                "area_name": "분당동",
                "is_reupdated": "",
                "last_time": "4분 전",
                "price_text": "(안돼요)",
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

// 까먹을 것 같은 내용들
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

// container default 크기 단위 : LP
// icon은 size까지가 끝
// image 추가하고 싶으면 pubspec.yaml 등록 (패키지, 이미지 등 등록)