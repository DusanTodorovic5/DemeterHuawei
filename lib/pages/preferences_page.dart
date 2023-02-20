import 'package:demeter_huawei/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';

class PreferencesPage extends StatefulWidget {
  const PreferencesPage({super.key});

  @override
  State<PreferencesPage> createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: DrawerWidget(),
      ),
      appBar: const CustomAppBar(text: "Preferences"),
      body: Center(),
    );
  }
}