import 'package:flutter/material.dart';
import '../styles/text_theme.dart';
import '../styles/card.dart';

class DeletedListPage extends StatelessWidget {
  final List<String> _listOfDeletedTodos = [];

  DeletedListPage(listOfDeletedTodos) {
    this._listOfDeletedTodos.addAll(listOfDeletedTodos);
  }

  Widget _deletedPage() {
    final _listOfDeletedTodosCards = _listOfDeletedTodos
        .map((deletedText) => defaultCard(deletedText))
        .toList();

    return ListView(
      padding: EdgeInsets.all(16.0),
      children: _listOfDeletedTodosCards,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Deleted Todos', style: titleTheme),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_outlined),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: _deletedPage(),
    );
  }
}
