import 'package:flutter/material.dart';
import 'package:to_do/edit_page.dart';

List<String> dataTitle = [];
List<String> dataDescription = [];
List<bool> dataDone = [];

class Model extends StatefulWidget {
  final int index;
  final Function update;
  const Model({Key? key, required this.index, required this.update})
      : super(key: key);

  @override
  _ModelState createState() => _ModelState();
}

class _ModelState extends State<Model> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Container(
        child: Card(
          shadowColor: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(children: [
              Icon(dataDone[widget.index]
                  ? Icons.check_box
                  : Icons.check_box_outline_blank),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dataTitle[widget.index],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    width: size.width * 0.7,
                    child: Text(
                      dataDescription[widget.index],
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return EditPage(
                                  index: widget.index, update: widget.update);
                            }));
                          },
                          icon: Icon(Icons.create_rounded))),
                  SizedBox(
                      child: IconButton(
                          onPressed: () {
                            dataTitle.removeAt(widget.index);
                            dataDescription.removeAt(widget.index);
                            dataDone.removeAt(widget.index);
                            widget.update();
                          },
                          icon: Icon(Icons.delete))),
                ],
              ))
            ]),
          ),
        ),
      ),
    );
  }
}
