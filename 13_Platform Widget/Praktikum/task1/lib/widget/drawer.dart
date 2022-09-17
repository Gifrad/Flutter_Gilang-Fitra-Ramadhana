import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              'Liverpool FC',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w900
              ),
            ),
            accountEmail: Text(
              'liverpoolFc@Lfc.id',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 14
              ),
            ),
            currentAccountPicture: CircleAvatar(
              child : ClipOval(
                child: Image.asset('assets/Liv.jpg'),
              ),              
            ),
            decoration: const BoxDecoration(
              color: Color(0xff55879f),
              image: DecorationImage(
                image: NetworkImage(
                'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/ea/e3/5e/photo1jpg.jpg?w=500&h=300&s=1'
                  ),
                  fit: BoxFit.cover
                )
            ),
          ),
          ListTile(
              leading: Icon(Icons.group),
              title: Text(
                'New Group',
                style: GoogleFonts.poppins(
                  color: Colors.blueGrey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500
                ),
              ),
          ),
          ListTile(
            leading: Icon(Icons.lock_clock_rounded),
            title: Text(
              'New Secret Group',
              style: GoogleFonts.poppins(
                color: Colors.blueGrey,
                fontSize: 14,
                fontWeight: FontWeight.w500
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.campaign),
            title: Text(
              'New Channel',
              style: GoogleFonts.poppins(
                color: Colors.blueGrey,
                fontSize: 14,
                fontWeight: FontWeight.w500
              ),
            ),
          ),
          const Divider(
            height: 1,
            thickness: 1,
            ),
        ListTile(
          leading: Icon(Icons.contact_page),
          title: Text(
            'Contact',
            style: GoogleFonts.poppins(
              color: Colors.blueGrey,
              fontSize: 14,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.group_add),
          title: Text(
            'Invite Friends',
            style: GoogleFonts.poppins(
              color: Colors.blueGrey,
              fontSize: 14,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text(
            'Setting',
            style: GoogleFonts.poppins(
              color: Colors.blueGrey,
              fontSize: 14,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.question_mark),
          title: Text(
            'Telegram FAQ',
            style: GoogleFonts.poppins(
              color: Colors.blueGrey,
              fontSize: 14,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
        ],
      ),
    );
  }
}