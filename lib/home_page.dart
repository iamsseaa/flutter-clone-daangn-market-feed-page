import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'feed.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key}); // 생성자 : 클래스로 객체를 만들 때 호출되는 함수

  @override // 보여지는 화면
  Widget build(BuildContext context) {
    final List<String> images = [
      "https://cdn2.thecatapi.com/images/6bt.jpg",
      "https://cdn2.thecatapi.com/images/ahr.jpg",
      "https://cdn2.thecatapi.com/images/arj.jpg",
      "https://cdn2.thecatapi.com/images/brt.jpg",
      "https://cdn2.thecatapi.com/images/cml.jpg",
      "https://cdn2.thecatapi.com/images/e35.jpg",
      "https://cdn2.thecatapi.com/images/MTk4MTAxOQ.jpg",
      "https://cdn2.thecatapi.com/images/MjA0ODM5MQ.jpg",
      "https://cdn2.thecatapi.com/images/AuY1uMdmi.jpg",
      "https://cdn2.thecatapi.com/images/AKUofzZW_.png",
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5, // 시각적으로 올라가있는 정도
        leading: Row(
          children: [
            SizedBox(width: 16),
            Text(
              '중앙동',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.black,
            ),
          ],
        ),
        leadingWidth: 100,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.search, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu_rounded, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.bell, color: Colors.black),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal:
                16), // symmetric : 대칭형으로 / horizontal : 가로 방향으로만 padding 을 줌
        child: ListView.separated(
          itemCount: images.length,
          itemBuilder: (context, index) {
            final image = images[index];

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Feed(
                imageUrl: image,
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(); // separated에는 가로 구분 선을 보여주겠다
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xFFFF7E36),
        elevation: 1,
        child: Icon(
          Icons.add_rounded,
          size: 36,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        iconSize: 28,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: '홈',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.my_library_books_outlined),
            label: '동네생활',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fmd_good_outlined),
            label: '내 근처',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble_2),
            label: '채팅',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
            ),
            label: '나의 당근',
          ),
        ],
        currentIndex: 0, // 인덱스로 몇번째 화면(인덱스)이 활성화 됨 (지금은 아이콘을 그냥 지정해둔거라 차이는 없음)
      ),
    );
  }
}
