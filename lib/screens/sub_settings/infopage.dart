import 'package:flutter/material.dart';
import '../../styles/text_theme.dart';
import '../../styles/card.dart';

class SettingsInfoPage extends StatelessWidget {
  _infoItems() {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: ListView(
        children: [
          defaultCardWithSubtitle('Theme', 'Material Theme'),
          defaultCardWithSubtitle('Developer', 'Shamil Niyas'),
          defaultCardWithSubtitle('Version', 'v1.0.0'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Info',
          style: titleTheme,
        ),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_outlined),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: _infoItems(),
    );
  }
}
