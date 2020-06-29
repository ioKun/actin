import 'package:actin/injection.dart';
import 'package:actin/presentation/bloc/search_city/search_city_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CitySelector extends StatelessWidget {
  const CitySelector({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _bloc = g<SearchCityBloc>();
    return Container(
      child: Column(
        children: [
          TextField(
            onChanged: (value) {
              _bloc.add(SearchCities(query: value));
            },
          ),
          SingleChildScrollView(
            child: BlocBuilder<SearchCityBloc, SearchCityState>(
                bloc: _bloc,
                builder: (c, s) {
                  if (s is SearchLoaded) {
                    return Column(
                      children: s.locations.map((e) => _elem(e.city)).toList(),
                    );
                  } else if (s is SearchLoading) {
                    return CircularProgressIndicator();
                  }
                  return Text('INVALID');
                }),
          )
        ],
      ),
    );
  }

  Widget _elem(String text) => Container(
        width: double.infinity,
        color: Colors.black26,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(text),
        ),
      );
}
