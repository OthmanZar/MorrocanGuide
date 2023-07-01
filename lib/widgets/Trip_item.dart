import 'package:flutter/material.dart';
import 'package:moroccan_guide/models/trips.dart';
import 'package:moroccan_guide/screens/category_trip_item.dart';
import 'package:moroccan_guide/widgets/Category_item.dart';
import '../screens/trip_infos_screen.dart';

class TripItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Seasons season;
  final TripType tripType;
  final Function removeItem;
  const TripItem(
      {super.key,
      required this.id,
      required this.title,
      required this.imageUrl,
      required this.duration,
      required this.season,
      required this.tripType,
      required this.removeItem});

  String get seasonText {
    String seas = '';
    switch (season) {
      case Seasons.winter:
        seas = 'Winter';
        break;
      case Seasons.Summer:
        seas = 'Summer';
        break;
      case Seasons.Spring:
        seas = 'Spring';
        break;
      case Seasons.Autumn:
        seas = 'Autumn';
        break;
      default:
        seas = 'not know';
    }

    return seas;
  }

  String get typeText {
    String type = '';
    switch (tripType) {
      case TripType.Activities:
        type = 'Activities';
        break;
      case TripType.Exploration:
        type = 'Exploration';
        break;
      case TripType.Recovery:
        type = 'Recovery';
        break;
      case TripType.Therapy:
        type = 'Therapy';
        break;
      default:
        type = 'not know';
    }

    return type;
  }

  void Selectrip(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(
      '/Trip-Infos',
      arguments: id,
    )
        .then((tripe) {
      if (tripe != null) {
        removeItem(tripe);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Selectrip(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 7,
        margin: EdgeInsets.all(11),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 250,
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0),
                      Colors.black.withOpacity(0.8),
                    ],
                    stops: [
                      0.6,
                      1,
                    ],
                  )),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headline6,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.today,
                        color: Theme.of(context).accentColor,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('$duration')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.sunny,
                        color: Theme.of(context).accentColor,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(seasonText)
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.family_restroom,
                        color: Theme.of(context).accentColor,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(typeText)
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
