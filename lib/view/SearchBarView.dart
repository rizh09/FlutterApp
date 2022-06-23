import 'package:bloc_provider/bloc_provider.dart';
import 'package:convid19/blocs/GiphyBloc.dart';
import 'package:convid19/view/GiphyScreen.dart';
import 'package:flutter/material.dart';


class SearchBarView extends StatelessWidget {
  final TextEditingController editingController;
  final Function updateQuery;
  final int limit;
  final String placeHolder;
  const SearchBarView(
      {Key key,
      this.limit,
      this.placeHolder,
      this.editingController,
      this.updateQuery})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _bloc = BlocProvider.of<GiphyBloc>(context);
    return Container(
      // decoration: BoxDecoration(color: Colors.blue),
      // margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(8.0),
      child: TextField(
        onSubmitted: (value) {
          updateQuery();
          _bloc.fetchGifs(API_ACTION.PULL, value, 0, limit);
        },
        controller: editingController,
        decoration: InputDecoration(
            labelText: "Search",
            hintText: placeHolder,
            hintMaxLines: 1,
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)))),
      ),
    );
  }
}
