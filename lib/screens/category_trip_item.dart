import 'package:flutter/material.dart';
import 'package:moroccan_guide/models/category.dart';
import 'package:moroccan_guide/models/trips.dart';
import '../widgets/Category_item.dart';
import '../app_data.dart';
import '../widgets/Trip_item.dart';

class CategoryTrip extends StatefulWidget {
  final List<Trip> availableTrips;
  CategoryTrip(this.availableTrips);

  @override
  State<CategoryTrip> createState() => _CategoryTripState();
}

class _CategoryTripState extends State<CategoryTrip> {
  String CategoryTitle = '';
  List<Trip> display = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routeArgument =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final Categoryid = routeArgument['id'];
    CategoryTitle = routeArgument['title'].toString();
    display = widget.availableTrips.where((trip) {
      return trip.categories.contains(Categoryid);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeTrip(String tripid) {
    setState(() {
      display.removeWhere((tripe) => tripe.id == tripid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(CategoryTitle)),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return TripItem(
            id: display[index].id,
            title: display[index].title,
            imageUrl: display[index].imageUrl,
            duration: display[index].duration,
            season: display[index].season,
            tripType: display[index].tripType,
            removeItem: _removeTrip,
          );
        },
        itemCount: display.length,
      ),
    );
  }
}
