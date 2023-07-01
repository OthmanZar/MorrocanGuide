import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../app_data.dart';

class TripInfos extends StatelessWidget {
  const TripInfos({Key? key}) : super(key: key);
  Widget text(BuildContext context, String a) {
    return Container(
      child: Text(
        a,
        style: Theme.of(context).textTheme.headline5,
      ),
      alignment: Alignment.topLeft,
      margin: EdgeInsets.all(13),
    );
  }

  Widget contain(Widget child) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.amber)),
      height: 200,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedTrip = Trips_data.firstWhere((trip) => trip.id == tripId);
    return Scaffold(
        appBar: AppBar(
          title: Text('nice'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  height: 300,
                  width: double.infinity,
                  child: Image.network(
                    selectedTrip.imageUrl,
                    fit: BoxFit.cover,
                  )),
              text(context, 'Activities'),
              contain(
                ListView.builder(
                  itemCount: selectedTrip.activities.length,
                  itemBuilder: (ctx, index) => Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    child: Card(
                      child: Text(selectedTrip.activities[index]),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              text(context, 'Program'),
              contain(
                ListView.builder(
                  itemCount: selectedTrip.program.length,
                  itemBuilder: (ctx, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('Day${index + 1}'),
                        ),
                        title: Text(selectedTrip.program[index]),
                      ),
                      Divider(),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.delete),
          onPressed: () {
            Navigator.of(context).pop(tripId);
          },
        ));
  }
}
