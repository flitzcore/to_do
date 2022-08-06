import 'package:flutter/material.dart';
import 'package:to_do/home_page.dart';
import 'package:to_do/model.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController _controllerTitle = TextEditingController();
  TextEditingController _controllerDescription = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Add Todo",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios))),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 8),
            child: TextField(
              controller: _controllerTitle,
              decoration: InputDecoration(
                hintText: 'Todo title...',
                labelText: 'title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 8),
            child: SizedBox(
              child: TextFormField(
                controller: _controllerDescription,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Todo detail...',
                  labelText: 'detail',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    'Submit',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                onPressed: () {
                  dataTitle.insert(0, _controllerTitle.text);
                  dataDescription.insert(0, _controllerDescription.text);
                  dataDone.insert(0, false);

                  Navigator.pop(context);
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controllerTitle.dispose();
    _controllerDescription.dispose();
    super.dispose();
  }
}
