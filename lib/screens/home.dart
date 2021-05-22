import 'package:flutter/material.dart';
import '../styles/text_theme.dart';
import '../styles/card.dart';
import '../todoapp.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:after_layout/after_layout.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with AfterLayoutMixin<Home> {
  final textController = TextEditingController();
  final List<String> _listOfTodos = [];
  final List<String> _deletedTodos = [];

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  _updateListInSharedPrefs() async {
    final prefsInstance = await SharedPreferences.getInstance();
    prefsInstance.setStringList('storedTodos', _listOfTodos);
  }

  Widget _todoHome() {
    return Stack(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            children: [
              Expanded(
                  child: Container(
                      padding: EdgeInsets.only(top: 80),
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: _listOfTodos.length,
                          padding: EdgeInsets.all(16.0),
                          itemBuilder: (context, index) =>
                              _cardGenerator(index))))
            ],
          ),
          Padding(
              padding: EdgeInsets.all(12.0),
              child: Card(
                elevation: 12,
                shape: todoListCardShape,
                color: Colors.red[50],
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: TextField(
                          cursorColor: Colors.white,
                          controller: textController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(8.0),
                              labelText: 'Create Task',
                              hintText: 'Enter task'),
                        )),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            _updateListInSharedPrefs();
                            setState(() {
                              _listOfTodos.insert(0, textController.text);
                              textController.text = '';
                            });
                          },
                        )
                      ],
                    )),
              )),
        ]);
  }

  Widget _cardGenerator(int index) {
    return Card(
        elevation: 8,
        color: Colors.red[100],
        shape: todoListCardShape,
        child: ListTile(
          title: Text(
            _listOfTodos[index],
            style: bodyTheme,
          ),
          trailing: IconButton(
            icon: Icon(Icons.delete_outline_sharp),
            onPressed: () {
              _updateListInSharedPrefs();
              setState(() {
                _deletedTodos.add(_listOfTodos[index]);
                _listOfTodos.removeAt(index);
              });
            },
          ),
        ));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Todo List',
          style: titleTheme,
        ),
        leading: IconButton(
          icon: Icon(Icons.settings_outlined),
          onPressed: () => _openSettingsPage(context),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete_outlined),
            onPressed: () => _openDeletedPage(context, _deletedTodos),
          ),
        ],
      ),
      body: _todoHome(),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    SharedPreferences.getInstance().then((value) => {
          setState(() {
            final storedTodos = value.getStringList('storedTodos');
            if (storedTodos == null) return;
            _listOfTodos.addAll(storedTodos);
          })
        });
  }

  _openDeletedPage(BuildContext context, List<String> deletedTodos) {
    Navigator.pushNamed(context, DeletedDir,
        arguments: {'deletedList': deletedTodos});
  }

  _openSettingsPage(BuildContext context) {
    Navigator.pushNamed(context, SettingsDir);
  }
}
