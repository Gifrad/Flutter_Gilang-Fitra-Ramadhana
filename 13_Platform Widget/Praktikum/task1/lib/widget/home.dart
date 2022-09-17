import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:task1/widget/drawer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: const Color(0xff55879f),
          title: const Text(
            'Telegram',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          actions: const [
            Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.search,
                  size: 30,
                ))
          ],
        ),
          drawer : const MyDrawer(),
        body: Column(
          children: [
            list(
                url: 'assets/Liv.jpg',
                name: 'Liverpool Match',
                desc: 'How Are You?',
                msg: '2',
                from: 'Thiago: ',
                isRead: true,
                time: '12.30 pm'),
            const Divider(
              height: 0.2,
            ),
            list(
                url: 'assets/kloop.jpg',
                name: 'Jurgen Kloop',
                desc: 'How about the condition Naby Keita?',
                msg: '1',
                isRead: true,
                time: '10.30 pm'),
            const Divider(
              height: 0.2,
            ),
            list(
                url: 'assets/salah.jpg',
                name: 'Moh.Salah',
                desc: 'Heloo...',
                msg: '',
                isRead: false,
                time: '09.00 am'),
            const Divider(
              height: 0.2,
            ),
            list(
                url: 'assets/mane.jpg',
                name: 'Sadio Mane',
                desc: 'I love Liverpool Fans',
                msg: '',
                isRead: false,
                time: '07.00 pm'),
            const Divider(
              height: 0.2,
            ),
            list(
                url: 'assets/group.jpeg',
                name: 'EX Liverpool FC',
                desc: 'I miss Liverpool FC',
                msg: '4',
                from: 'Luiz Suarez: ',
                isRead: true,
                time: '02.00 am'),
            const Divider(
              height: 0.2,
            ),
          ],
        ));
  }

  ListTile list(
      {required String url,
      required String name,
      required String desc,
      required String msg,
      String from = '',
      required bool isRead,
      required String time}) {
    return ListTile(
      contentPadding: EdgeInsets.only(top: 5, left: 10),
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: ExactAssetImage(url),
      ),
      title: Padding(
        padding: EdgeInsets.only(right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
            ),
            Text(
              time,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
          ],
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('$from$desc',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                )),
            Container(
              decoration: BoxDecoration(
                border: isRead ? Border.all(width: 1) : Border.all(width: 0),
                borderRadius: BorderRadius.circular(50),
                color: isRead ? Colors.green : Colors.white,
              ),
              child: Text(
                msg,
                style:   const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
