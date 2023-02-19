import 'package:demeter_huawei/classes/farm.dart';
import 'package:demeter_huawei/widgets/app_bar.dart';
import 'package:demeter_huawei/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

class FarmsListPage extends StatefulWidget {
  FarmsListPage({super.key});

  @override
  State<FarmsListPage> createState() => _FarmsListPageState();
  List<Farm> farms = [];

  Future<List<Farm>> loadFarms() async {
    return [];
  }
}

class _FarmsListPageState extends State<FarmsListPage> {
  late Future<List<Farm>> farms_future = widget.loadFarms();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: DrawerWidget(),
      ),
      appBar: const CustomAppBar(text: "Farms"),
      body: FutureBuilder<List<Farm>>(
        future: farms_future,
        builder: ((context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "No Farms Avaliable",
                  ),
                ),
              );
            }
            return ListView(
              children: snapshot.data!
                  .map(
                    (e) => renderFarm(e),
                  )
                  .toList(),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
  }

  Widget renderFarm(Farm farm) {
    return Text(farm.name);
  }
}
