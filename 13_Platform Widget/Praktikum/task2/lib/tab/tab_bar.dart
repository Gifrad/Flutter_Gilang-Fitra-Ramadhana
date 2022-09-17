import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TabBar extends StatelessWidget {
  const TabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoSlidingSegmentedControl(
      children: const {
          0 : Text('All Chat'),
          1 : Text('Work'),
          2 : Text('Unread'),
          3 : Text('Personal'),
      } ,
      onValueChanged: (value) {},
      backgroundColor: CupertinoColors.white,
    );
  }
}