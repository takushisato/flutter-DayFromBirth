
import 'package:dayfrombirth/result.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      home: Scaffold(
        appBar: AppBar(
          title: const Text('my birthday'),
        ),
        body: home(),
        ),
      );
  }
}

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? name;
    DateTime? birthday;

    return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  onChanged: (newText){
                    name = newText;
                  },
                  decoration: const InputDecoration(
                    labelText: '名前',
                    hintText: '名前',
                    icon: Icon(Icons.account_circle),
                  ),
                ),
              ),
              ElevatedButton(onPressed: (
                  ) async {
                birthday = await showDatePicker(
                    context: context,
                    initialDate: DateTime(DateTime.now().year-10),
                    firstDate: DateTime(DateTime.now().year-100),
                    lastDate: DateTime(DateTime.now().year),);
              }, child: new Text('誕生日選択'),),

              ElevatedButton(onPressed: () {
                if (name != null && birthday != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        Result(name: name!, dayFromBirthday:DateTime.now().difference(birthday!).inDays)),
                    );
                  print(name);
                  print(birthday);
                }
              }, child: const Text('生まれてから何日目？'))
            ],
          ),
    );
  }
}
