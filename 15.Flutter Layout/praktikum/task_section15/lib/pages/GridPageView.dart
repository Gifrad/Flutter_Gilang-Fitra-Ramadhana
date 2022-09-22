import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:task_section15/pages/listView_page.dart';
import 'package:task_section15/widget/grid_view.dart';

class GridPageView extends StatelessWidget {
  const GridPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GridView',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisSpacing: 50,
        mainAxisSpacing: 50,
        crossAxisCount: 4,
        children: const [
          GridViewContent(icon: Icons.pets),
          GridViewContent(icon: Icons.wc),
          GridViewContent(icon: Icons.translate),
          GridViewContent(icon: Icons.volume_down),
          GridViewContent(icon: Icons.handshake),
          GridViewContent(icon: Icons.pets),
          GridViewContent(icon: Icons.wc),
          GridViewContent(icon: Icons.translate),
          GridViewContent(icon: Icons.volume_down),
          GridViewContent(icon: Icons.handshake),
          GridViewContent(icon: Icons.pets),
          GridViewContent(icon: Icons.wc),
          GridViewContent(icon: Icons.translate),
          GridViewContent(icon: Icons.volume_down),
          GridViewContent(icon: Icons.handshake),
          GridViewContent(icon: Icons.pets),
          GridViewContent(icon: Icons.wc),
          GridViewContent(icon: Icons.translate),
          GridViewContent(icon: Icons.volume_down),
          GridViewContent(icon: Icons.handshake),
          GridViewContent(icon: Icons.pets),
          GridViewContent(icon: Icons.wc),
          GridViewContent(icon: Icons.translate),
          GridViewContent(icon: Icons.volume_down),
          GridViewContent(icon: Icons.handshake),
          GridViewContent(icon: Icons.pets),
          GridViewContent(icon: Icons.wc),
          GridViewContent(icon: Icons.translate),
          GridViewContent(icon: Icons.volume_down),
          GridViewContent(icon: Icons.handshake),
          GridViewContent(icon: Icons.pets),
          GridViewContent(icon: Icons.wc),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black45,
        currentIndex: 1,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: InkWell(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const ListViewPage()),
                      (Route<dynamic> route) => false);
                },
                child: const Icon(Icons.contact_page),
              ),
              label: 'Contact'),
          const BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: 'Icons',
          ),
        ],
      ),
    );
  }
}
