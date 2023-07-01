import 'package:flutter/material.dart';
import 'package:moroccan_guide/widgets/Drawer.dart';

class FiltrePage extends StatefulWidget {
  final Function saveFilters;

  final Map<String, bool> Current;
  FiltrePage(this.Current, this.saveFilters);
  //const FiltrePage({super.key, required this.saveFilters});

  @override
  State<FiltrePage> createState() => _FiltrePageState();
}

class _FiltrePageState extends State<FiltrePage> {
  //const FiltrePage({Key key}) : super(key: key);
  var _Summer = false;
  var _Winter = false;
  var _Familly = false;

  /* @override
  void initState() {
    bool? s = widget.Current['summer'];
    bool w = widget.Current['winter'];
    bool? f = widget.Current['family'];
    _Summer = s!;

    _Winter = w!;

    _Familly = f!;

    super.initState();
  }
*/
  Widget BuildSwitch(String title, String sub, var f, Function ontape) {
    return SwitchListTile(
      value: f,
      onChanged: ontape(),
      title: Text(title),
      subtitle: Text(sub),
      activeColor: Colors.green,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerC(),
      appBar: AppBar(
        title: Text('Filter Page'),
        actions: [
          IconButton(
              onPressed: () {
                final SelecFilters = {
                  'summer': _Summer,
                  'winter': _Winter,
                  'family': _Familly,
                };
                widget.saveFilters();
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                BuildSwitch(
                  'For Summer',
                  'To choose the places For summer',
                  _Summer,
                  () => (newvalue) {
                    setState(() {
                      _Summer = newvalue;
                    });
                  },
                ),
                BuildSwitch(
                  'For Winter',
                  'To choose the places For Winter',
                  _Winter,
                  () => (newvalue) {
                    setState(() {
                      _Winter = newvalue;
                    });
                  },
                ),
                BuildSwitch(
                  'For Familly',
                  'To choose the places For Familly',
                  _Familly,
                  () => (newvalue) {
                    setState(() {
                      _Familly = newvalue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
