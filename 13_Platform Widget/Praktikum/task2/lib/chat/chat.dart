import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _listChat(
          url: 'images/group.jpeg', 
          name: 'Liverpool',
          desc: 'Hello',
          msg: '20',
          isRead: true,
          time: '12.00 pm'
          ),
          const Divider(
            indent: 73,
            thickness: 0.3,
            color: Color(0xff707070),
          ),
          _listChat(
          url: 'images/kloop.jpg', 
          name: 'Jur.Kloop',
          desc: 'Hello',
          msg: '20',
          isRead: false,
          time: '12.00 pm'
          ),
          const Divider(
            indent: 73,
            thickness: 0.3,
            color: Color(0xff707070),
          ),
          _listChat(
          url: 'images/salah.jpg', 
          name: 'Mo.Salah',
          desc: 'Hello',
          msg: '20',
          isRead: false,
          time: '11.00 am'
          ),
          const Divider(
            indent: 73,
            thickness: 0.3,
            color: Color(0xff707070),
          ),
          _listChat(
          url: 'images/mane.jpg', 
          name: 'Sa.Mane.',
          desc: 'Hello',
          msg: '2',
          isRead: true,
          time: '09.00 pm'
          ),
          const Divider(
            indent: 73,
            thickness: 0.3,
            color: Color(0xff707070),
          ),
          _listChat(
          url: 'images/lfc.png', 
          name: 'LFC',
          desc: 'Hello,LFC.....',
          msg: '120',
          isRead: true,
          time: '12.00 pm'
          ),
          const Divider(
            indent: 73,
            thickness: 0.3,
            color: Color(0xff707070),
          ),
      ],
    );
  }

   Widget _listChat(
      {required String url,
      required String name,
      required String desc,
      required String msg,
      required bool isRead,
      required String time}) {
     return Row(
      children: <Widget> [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 30,
          backgroundImage: AssetImage(url),
        ),
        const SizedBox(
          width: 14,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
            const SizedBox(
              height: 5,
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              desc,
              style: TextStyle(fontSize: 14, color: Colors.blueGrey),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 168),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    time,
                    style: TextStyle(color: CupertinoColors.inactiveGray),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: 40,
                height: 20,
                decoration: isRead? const BoxDecoration(
                  color: CupertinoColors.activeBlue,
                  borderRadius:  BorderRadius.horizontal(
                      left: Radius.circular(16), right : Radius.circular(16)),
                ):null,
                child:  Center(
                  child: Text(
                    msg,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}