import 'package:flutter/cupertino.dart';

import '../chat/chat.dart';
import '../search/search.dart';
import '../tab/tab_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_alt_circle), label: 'Contact'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.phone), label: 'Call'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble_2_fill), label: 'Chat'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings_solid), label: 'Setting'),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoPageScaffold(
          navigationBar: const CupertinoNavigationBar(
            leading: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: null,
                child: Text(
                  'Edit',
                  style: TextStyle(
                    color: CupertinoColors.activeBlue,
                  ),
                )),
            middle: Text('Chat'),
            trailing: Icon(CupertinoIcons.arrow_down_right_square),
          ),
          child: ListView(
            children: [
              const Search(),
              const TabBar(),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Chat(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
