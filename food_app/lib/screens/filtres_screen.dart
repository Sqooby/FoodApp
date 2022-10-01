import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const RouteName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FilterScreen(this.currentFilters, this.saveFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegeterian = false;
  bool _vegen = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    _vegen = widget.currentFilters['vegan']!;
    _vegeterian = widget.currentFilters['vegeterian']!;
    super.initState();
  }

  Function? backToCategory() {
    Navigator.of(context).pushNamed('/');
  }

  Widget _buildSwitchListTile(
      bool currentValue, String title, String subTitle, Function UpdateValue) {
    return SwitchListTile(
      value: currentValue,
      onChanged: (value) {
        UpdateValue(value);
      },
      title: Text(title),
      subtitle: Text(
        subTitle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Your Filters"),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegen,
                  'vegeterian': _vegeterian,
                };
                widget.saveFilters(selectedFilters);
                backToCategory();
              },
            ),
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "MealSelescion",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchListTile(_glutenFree, 'Gluten-Free',
                      'Include only gluten-free meals', (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  }),
                  _buildSwitchListTile(_lactoseFree, 'Lactose-Free',
                      'Include only lactose-free meals', (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  }),
                  _buildSwitchListTile(
                      _vegen, 'Vegen', 'Include only vegen meals', (newValue) {
                    setState(() {
                      _vegen = newValue;
                    });
                  }),
                  _buildSwitchListTile(_vegeterian, 'Vegeterian',
                      'Include only vegeterian meals', (newValue) {
                    setState(() {
                      _vegeterian = newValue;
                    });
                  }),
                ],
              ),
            )
          ],
        ));
  }
}
