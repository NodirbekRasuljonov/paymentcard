import 'package:flutter/material.dart';

class DragScreen extends StatefulWidget {
  const DragScreen({Key? key}) : super(key: key);

  @override
  State<DragScreen> createState() => _DragScreenState();
}

class _DragScreenState extends State<DragScreen> {
  List<String> indexlist = [
    'index0',
    'index1',
    'index2',
    'index3',
    'index4',
    'index5',
    'index6',
    'index7',
    'index8',
    'index9'
  ];

  String datakel='';
  bool insidetarget = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Inside Targer:" + insidetarget.toString(),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            DragTarget<String>(
              builder: (context, candidateData, rejectedData) {
                return 
                    Container(
                        height: 200.0,
                        width: 200.0,
                        color: Colors.blue,
                        child: Text(datakel),
                      );
                  
              },
              onWillAccept: (data) {
                return true;
              },
              
              onAccept: (data) {
                setState(() {
                  datakel=data;
                  debugPrint(data);
                });
              },
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: indexlist.length,
                itemBuilder: (contex, index) {
                  return Draggable<String>(

                    data: indexlist[index],
                    feedback: Container(
                      height: 150.0,
                      width: 150.0,
                      color: Colors.yellow,
                      child: Text(indexlist[index]),
                    ),
                    childWhenDragging: Container(
                      height: 150.0,
                      width: 150.0,
                      color: Colors.grey,
                    ),
                    child: Container(
                      height: 150.0,
                      width: 150.0,
                      margin: EdgeInsets.all(30.0),
                      color: Colors.red,
                      child: Text(indexlist[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
