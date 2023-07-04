import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  const Feed({
    super.key,
    required this.imageUrl,
  });

  final String
      imageUrl; // 각 피드마다 다른 이미지를 담을 변수 / Feed class가 초기화 될 때 위의 required this.imageUrl에서 값이 전달됨

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  // 좋아요 여부
  bool isFavorite = false; // 처음엔 안 눌려있을테니까 false

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start, // 이미지와 텍스트들의 column을 나란히 둠
      children: [
        // CilpRRect 를 통해 이미지에 곡선 border 생성
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            widget
                .imageUrl, // 10번째 줄의 imageUrl 가져오기 => why? 해당 _FeedState class에는 imageUrl이 없기 때문에 위의 Feed class에서 가져오는 것임 => 그게 widget.변수명 으로 접근하는 것 /  근데 여기서 에러(required named parameter 'imageUrl' must be provided)가 나는 이유는? 위의 HomePage에서 안 넘겨 줬기 때문
            width: 100,
            height: 100,
            fit: BoxFit
                .cover, // 이미지 비율 => 정사각형 위젯에 이미지를 채워서 보여주려 할 때, BoxFit.cover : 이미지의 비율을 유지하면서 고정된 폭과 높이에 맞추어 이미지를 적절히 잘라서 보여줌
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'M1 아이패드 프로 11형(3세대) 와이파이 128G 팝니다.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                softWrap: false,
                maxLines: 2,
                overflow: TextOverflow
                    .ellipsis, // 텍스트가 화면에서 넘어가면 잘라내겠다. 하지만, 그래도 넘어감. 왜? 이 텍스트가 얼마만큼의 공간을 차지해야하는지를 지정하지 않아서 나타나는 문제 (폭이 지정되지 않아서 생긴 문제) => 화면의 남은 공간만 차지한다고 지정하면 됨 : Expanded 위젯 (Column을 Expanded 위젯으로 묶어줌)
              ),
              SizedBox(height: 2),
              Text(
                '봉천동 · 6분 전',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black45,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '100만원',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Spacer(), // 자기가 차지할 수 있는 공간에서 나머지 것들을 최대한으로 밀어냄
                  GestureDetector(
                    // 해당 요소를 버튼처럼 만들어서, 눌렀을 때 작동할 수 있게 만듦
                    onTap: () {
                      // 화면 갱신
                      setState(() {
                        // 안쪽 코드 실행 후 화면 갱신
                        isFavorite = !isFavorite;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          isFavorite
                              ? CupertinoIcons
                                  .heart_fill // 위 조건(isFavorite)이 true이면
                              : CupertinoIcons
                                  .heart, // 위 조건(isFavortie)이 false이면
                          color: Colors.black54,
                          size: 16,
                        ),
                        Text(
                          '1',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
