import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(Animatedlist());
}

class Animatedlist extends StatefulWidget {
  const Animatedlist({Key? key}) : super(key: key);

  @override
  _AnimatedlistState createState() => _AnimatedlistState();
}

class _AnimatedlistState extends State<Animatedlist> {
  //animated list data types
  final item = [];
  final GlobalKey<AnimatedListState> key = GlobalKey();
  //add method
  void additems() {
    item.insert(0, 'Item ${item.length + 1}');
    key.currentState!.insertItem(0, duration: Duration(seconds: 1));
  }

//delet method
  void removeitem(int index) {
    key.currentState!.removeItem(
      index,
      (_, animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: Card(
            margin: EdgeInsets.all(10),
            color: Colors.red,
            child: ListTile(
              title: Text(
                'Deleted',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        );
      },
      duration: Duration(milliseconds: 300),
    );
    item.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              IconButton(onPressed: additems, icon: Icon(Icons.add)),
              Expanded(
                child: AnimatedList(
                    key: key,
                    initialItemCount: 0,
                    padding: EdgeInsets.all(10),
                    itemBuilder: (context, index, animation) {
                      return SizeTransition(
                        key: UniqueKey(),
                        sizeFactor: animation,
                        child: Card(
                          margin: EdgeInsets.all(10),
                          color: Colors.orangeAccent,
                          child: ListTile(
                            title: Text(
                              item[index],
                              style: TextStyle(fontSize: 20),
                            ),
                            trailing: IconButton(
                                onPressed: () {
                                  removeitem(index);
                                },
                                icon: Icon(Icons.delete)),
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
