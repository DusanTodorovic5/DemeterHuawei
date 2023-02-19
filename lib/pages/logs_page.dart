import 'package:demeter_huawei/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';

class LogsPage extends StatefulWidget {
  const LogsPage({super.key});

  @override
  State<LogsPage> createState() => _LogsPageState();
}

class _LogsPageState extends State<LogsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: DrawerWidget(),
      ),
      appBar: const CustomAppBar(text: "Logs"),
      body: const Center(),
    );
  }
}
