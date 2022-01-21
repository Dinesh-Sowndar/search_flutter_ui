import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_templete/services/fire_api.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _typeAheadController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TypeAheadFormField(
              textFieldConfiguration: TextFieldConfiguration(
                decoration: InputDecoration(labelText: 'Search'),
                controller: _typeAheadController,
              ),
              suggestionsCallback: (pattern) async {
                await Future<void>.delayed(Duration(seconds: 1));

                return List.generate(3, (index) {
                  return pattern + index.toString();
                });
              },
              itemBuilder: (context, suggestion) {
                return ListTile(
                  onTap: () {
                    print(suggestion.toString());
                  },
                  title: Text(suggestion.toString()),
                );
              },
              transitionBuilder: (context, suggestionsBox, controller) {
                return suggestionsBox;
              },
              onSuggestionSelected: (String suggestion) {
                _typeAheadController.text = suggestion;
              },
            ),

             const SizedBox(
                        height: 5,
                      ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    onPrimary: Colors.red,
                                    primary: Colors.yellow[300],
                                    minimumSize: Size(100, 36),
                                    padding: EdgeInsets.symmetric(horizontal: 22),
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(5)),
                                    ),
                                    // elevation: 4
                                  ),
                                  onPressed: () {
                                    // FireDB.addFood({"dfsd":"sdfsdf"});
                                  },
                                  child: Text('Submit'),
                                )
          ],
        ),
      ),
    );
  }
}
