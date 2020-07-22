import 'package:flutter/material.dart';

main() => runApp(MaterialApp(
      home: Temel(),
      theme: ThemeData(primarySwatch: Colors.red),
    ));

class Temel extends StatefulWidget {
  @override
  _TemelState createState() => _TemelState();
}

class _TemelState extends State<Temel> {
  final veriler = List<String>.generate(20, (i) => "liste elemanı: ${i + 1}");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("dismissable"),
      ),
      body: ListView.builder(
          itemCount: veriler.length,
          itemBuilder: (context, index) {
            final veri = veriler[index];
            return Dismissible(
              key: Key(veri),
              onDismissed: (direction) {
                setState(() {
                  veriler.removeAt(index);
                });
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text("$veri silindi...")));
              },
              child: ListTile(
                title: Text("$veri"),
              ),
              background: Container(
                color: Colors.red,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.delete, color: Colors.white),
                      Text(
                        "sil",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
