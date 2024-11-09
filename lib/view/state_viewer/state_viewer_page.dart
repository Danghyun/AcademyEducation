import 'package:flutter/widgets.dart';

class _StatefulPage extends StatefulWidget {
  const _StatefulPage({
    super.key,
  });

  // 상태를 갖기 때문에, 상태 관리에 대한 객체 생성을 강제한다.
  @override
  State<_StatefulPage> createState() => _StatefulPageState();
}
class _StatefulPageState extends State<_StatefulPage> {
  @override
  void setState(VoidCallback fn) {
    // 위젯트리에 붙어있지 않을 경우 중단
    if(!mounted) return;

    // 위젯 트리에, 이 위젯이 붙어있을 경우 화면 갱신
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
      // 화면을 갱신한다.
      // 여기서 값이 바뀌었든
      // (동기 처리에 의해서 멤버변수에 즉각 할당 처리된다.)
      setState(() {
        // 여기서 값이 바뀌었든
        // (비동기 처리에 의해서 다음 스케줄링이 계획될 때 멤버변수에 할당 처리될 것이다.)
      });
    return const Placeholder();
  }

  Widget singleChildWidget() {
    return Container(
      // 관례적으로 child 속성을 주로 가진다.
      // 특성 : 자식 위젯의 크기에 주로 맞춘다.
      child: SizedBox(),
    );
  }

  Widget multiChildWidget() {
    return Column(
      // 관례적으로 children 속성을 주로 가진다.
      // 특징 : 자식 위젯을 특정 크기 (내용물 크기거나 고정 크기로 맞추고,
      // 원하는 형태로 배치한다.
      children: [
        SizedBox(),
        SizedBox(),
        SizedBox(),
      ],
    );
  }

}

class _StatelessPage extends StatelessWidget {
  const _StatelessPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
