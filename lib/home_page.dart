import 'package:flutter/material.dart';
import 'package:to_do/add.dart';
import 'package:to_do/detail.dart';
import 'package:to_do/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _update() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: dataTitle.isEmpty
          ? Center(child: Text("Day off, yayyy"))
          : ListView.builder(
              itemCount: dataTitle.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailScreen(
                        index: index,
                        update: _update,
                      );
                    }));
                  },
                  child: Model(
                    index: index,
                    update: _update,
                  ),
                );
              }),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            // setState(() {
            //  data.insert(0, "s");
            // });
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const AddPage();
            })).then((value) => setState(() {}));
          },
          child: const Icon(Icons.add)),
    );
  }
}
