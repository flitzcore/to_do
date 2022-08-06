import 'package:flutter/material.dart';
import 'package:to_do/edit_page.dart';
import 'package:to_do/model.dart';

class DetailScreen extends StatefulWidget {
  final int index;
  final Function update;
  const DetailScreen({Key? key, required this.index, required this.update})
      : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Todo Details",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.create_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return EditPage(index: widget.index, update: widget.update);
                })).then((value) => setState(() {}));
              },
            ),
            SizedBox(
              width: 10,
            ),
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.white,
              ),
              onPressed: () {
                dataTitle.removeAt(widget.index);
                dataDescription.removeAt(widget.index);
                dataDone.removeAt(widget.index);
                widget.update();
                Navigator.pop(context);
              },
            ),
            SizedBox(
              width: 10,
            )
          ],
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios))),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              dataTitle[widget.index],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(dataDescription[widget.index]),
          ),
          Expanded(
            child: Center(
              child: ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    'Mark As Done',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                onPressed: () {
                  dataDone[widget.index] = true;
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
}
