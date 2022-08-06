import 'package:flutter/material.dart';

import 'model.dart';

class EditPage extends StatefulWidget {
  final int index;
  final Function update;
  const EditPage({Key? key, required this.index, required this.update})
      : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController _controllerTitle = TextEditingController();
  TextEditingController _controllerDescription = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Edit Todo",
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
              controller: _controllerTitle..text = dataTitle[widget.index],
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
                controller: _controllerDescription
                  ..text = dataDescription[widget.index],
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
                  dataTitle[widget.index] = _controllerTitle.text;
                  dataDescription[widget.index] = _controllerDescription.text;
                  widget.update();

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
