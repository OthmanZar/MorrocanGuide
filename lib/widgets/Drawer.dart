import 'package:flutter/material.dart';

class DrawerC extends StatelessWidget {
  const DrawerC({Key? key}) : super(key: key);

  ListTile BuildList(
      BuildContext context, IconData ic, String title, Function() onTapeLink) {
    return ListTile(
      leading: Icon(ic),
      title: Text(
        title,
        // style: Theme.of(context).textTheme.headline5,
      ),
      onTap: onTapeLink,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            color: Colors.deepOrange,
            child: Text(
              'Moroccan Guide',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          BuildList(context, Icons.abc_outlined, 'Main Page', () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          SizedBox(
            height: 20,
          ),
          BuildList(context, Icons.account_balance_wallet, 'Filtre Page', () {
            Navigator.of(context).pushReplacementNamed('/FiltrePage');
          }),
        ],
      ),
    );
  }
}
