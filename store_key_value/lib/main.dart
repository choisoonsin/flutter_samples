import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

import 'package:http/http.dart' as http;

part 'main.g.dart';

const myWordsBoxName = "my_words";

void main() async {
  await Hive.initFlutter();
  await Hive.openBox<Word>(myWordsBoxName);

  Hive.registerAdapter(WordAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'How to use HIVE',
      home: MyCustomForm(),
    );
  }
}

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  late Box<Word> _myWordsBox;

  final _myController = TextEditingController();
  final uuid = Uuid();
  final _base_url = 'https://dic.daum.net';

  @override
  void initState() {
    _myWordsBox = Hive.box(myWordsBoxName);
    // TODO: Delete all words before start app for testing
    _myWordsBox.deleteAll(_myWordsBox.keys);
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _myController.dispose();
    super.dispose();
  }

  void _saveWord(String value) async {
    var saveWord = Word(word: value, createdAt: DateTime.now());
    if (!_myWordsBox.containsKey(value) && value.isNotEmpty) {
      var url = Uri.https(_base_url, '/search.do?q=' + value);
      var res = await http.get(url);

      print(res.statusCode);

      await _myWordsBox.put(value, saveWord);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('How to use HIVE'),
        ),
        body: ValueListenableBuilder(
            valueListenable: _myWordsBox.listenable(),
            builder: (context, Box<Word> word, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextFormField(
                      decoration:
                          InputDecoration(prefixIcon: Icon(Icons.search)),
                      controller: _myController,
                      onFieldSubmitted: (value) {
                        _saveWord(value);
                        _myController.clear();
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: _myWordsBox.length,
                        itemBuilder: (context, listIndex) {
                          final _word = word.getAt(listIndex);
                          return ListTile(
                            title: Text(_word!.word),
                            subtitle: Text(listIndex.toString()),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.add),
                                SizedBox(width: 4.0),
                                InkWell(
                                  child: Icon(Icons.delete),
                                  onTap: () {
                                    _word.delete();
                                  },
                                ),
                              ],
                            ),
                            // trailing: Icon(Icons.delete),
                          );
                        }),
                  ),
                ],
              );
            }));
  }
}

@HiveType(typeId: 0)
class Word extends HiveObject {
  Word({required this.word, required this.createdAt});

  @HiveField(0)
  String word;

  @HiveField(1)
  DateTime createdAt;
}
