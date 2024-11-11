import 'package:flutter/material.dart';

void main() {
  runApp(MyApp10());
}

class MyApp10 extends StatelessWidget {
  const MyApp10({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.amber,
                child: Text('1'),
              ),
              title: Text('item 1'),
              subtitle: Text('item description'),
              trailing: IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {
                  print('click');
                },
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.amber,
                child: Text('1'),
              ),
              title: Text('item 1'),
              subtitle: Text('item description'),
              trailing: IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {
                  print('click');
                },
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.amber,
                child: Text('1'),
              ),
              title: Text('item 1'),
              subtitle: Text('item description'),
              trailing: IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {
                  print('click');
                },
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.amber,
                child: Text('1'),
              ),
              title: Text('item 1'),
              subtitle: Text('item description'),
              trailing: IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {
                  print('click');
                },
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.amber,
                child: Text('1'),
              ),
              title: Text('item 1'),
              subtitle: Text('item description'),
              trailing: IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {
                  print('click');
                },
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.amber,
                child: Text('1'),
              ),
              title: Text('item 1'),
              subtitle: Text('item description'),
              trailing: IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {
                  print('click');
                },
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.amber,
                child: Text('1'),
              ),
              title: Text('item 1'),
              subtitle: Text('item description'),
              trailing: IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {
                  print('click');
                },
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.amber,
                child: Text('1'),
              ),
              title: Text('item 1'),
              subtitle: Text('item description'),
              trailing: IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {
                  print('click');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
