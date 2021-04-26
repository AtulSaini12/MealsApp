import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function _setFilters;
  final Map<String, bool> _filters;
  FiltersScreen(this._filters, this._setFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGluttonFree = false;
  var _isVegaterian = false;
  var _isVegan = false;
  var _isLactoseFree = false;

  @override
  void initState() {
    _isGluttonFree = widget._filters['gluten'];
    _isLactoseFree = widget._filters['lactose'];
    _isVegan = widget._filters['vegan'];
    _isVegaterian = widget._filters['vegeterian'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),
          actions: [
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  final _selectedFilters = {
                    'gluten': _isGluttonFree,
                    'vegan': _isVegan,
                    'vegeterian': _isVegaterian,
                    'lactose': _isLactoseFree,
                  };
                  widget._setFilters(_selectedFilters);
                })
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your Meal selections',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                SwitchListTile(
                  value: _isGluttonFree,
                  onChanged: (newValue) {
                    setState(() {
                      _isGluttonFree = newValue;
                    });
                  },
                  title: Text('Gluten-free'),
                  subtitle: Text('Only include Gluten-free meals'),
                ),
                SwitchListTile(
                  value: _isVegan,
                  onChanged: (newValue) {
                    setState(() {
                      _isVegan = newValue;
                    });
                  },
                  title: Text('Vegan'),
                  subtitle: Text('Only include Vegan meals'),
                ),
                SwitchListTile(
                  value: _isVegaterian,
                  onChanged: (newValue) {
                    setState(() {
                      _isVegaterian = newValue;
                    });
                  },
                  title: Text('Vegetarian'),
                  subtitle: Text('Only include Vegetarian meals'),
                ),
                SwitchListTile(
                  value: _isLactoseFree,
                  onChanged: (newValue) {
                    setState(() {
                      _isLactoseFree = newValue;
                    });
                  },
                  title: Text('Lactose-free'),
                  subtitle: Text('Only include Lactose-free meals'),
                ),
              ],
            ))
          ],
        ));
  }
}
