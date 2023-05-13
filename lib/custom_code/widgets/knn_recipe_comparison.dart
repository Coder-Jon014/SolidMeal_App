// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math' as Math;

double euclideanDistance(List<double> pointA, List<double> pointB) {
  return Math.sqrt(Math.pow(pointA[0] - pointB[0], 2) +
      Math.pow(pointA[1] - pointB[1], 2) +
      Math.pow(pointA[2] - pointB[2], 2));
}

List<Map<String, dynamic>> kNearestNeighbors(
    List<List<double>> data, List<double> target, int knn) {
  List<Map<String, dynamic>> distances = data
      .asMap()
      .entries
      .map((entry) => {
            'index': entry.key,
            'distance': euclideanDistance(entry.value, target),
          })
      .toList();

  distances.sort((a, b) => a['distance'].compareTo(b['distance']));

  return distances.sublist(0, knn);
}

class KnnRecipeComparison extends StatefulWidget {
  const KnnRecipeComparison({
    Key? key,
    this.width,
    this.height,
    this.targetSodium = 6.0,
    this.targetSugar = 9.0,
    this.targetSaturatedFat = 13.0,
  }) : super(key: key);

  final double? width;
  final double? height;
  final double targetSodium;
  final double targetSugar;
  final double targetSaturatedFat;

  @override
  _KnnRecipeComparisonState createState() => _KnnRecipeComparisonState();
}

class _KnnRecipeComparisonState extends State<KnnRecipeComparison> {
  @override
  Widget build(BuildContext context) {
    // Add the list of recipe objects here
    final List<Map<String, dynamic>> recipes = [
      {
        "name": "Fried Cabbage with Bacon, Onion, and Garlic",
        "sodium": 1435,
        "sugar": 8,
        "saturatedFat": 4
      },
      {
        "name": "Chicken Parmesan",
        "sodium": 1290,
        "sugar": 10,
        "saturatedFat": 11
      },
      {"name": "Caesar Salad", "sodium": 1140, "sugar": 3, "saturatedFat": 6},
      {"name": "Baked Salmon", "sodium": 190, "sugar": 0, "saturatedFat": 2},
      {"name": "Cheeseburger", "sodium": 1040, "sugar": 9, "saturatedFat": 12},
      {"name": "Pad Thai", "sodium": 1560, "sugar": 10, "saturatedFat": 5},
      {
        "name": "Grilled Chicken Sandwich",
        "sodium": 880,
        "sugar": 6,
        "saturatedFat": 3
      },
      {
        "name": "Fettuccine Alfredo",
        "sodium": 1550,
        "sugar": 5,
        "saturatedFat": 21
      },
      {
        "name": "Teriyaki Chicken Bowl",
        "sodium": 1560,
        "sugar": 26,
        "saturatedFat": 3
      },
      {"name": "Clam Chowder", "sodium": 840, "sugar": 3, "saturatedFat": 4},
      {
        "name": "Spinach and Feta Stuffed Chicken Breast",
        "sodium": 810,
        "sugar": 1,
        "saturatedFat": 5
      },
      {"name": "Greek Salad", "sodium": 1030, "sugar": 6, "saturatedFat": 7},
      {
        "name": "BBQ Pulled Pork Sandwich",
        "sodium": 980,
        "sugar": 12,
        "saturatedFat": 8
      },
      {"name": "Shrimp Scampi", "sodium": 1320, "sugar": 2, "saturatedFat": 10},
      {"name": "Fried Chicken", "sodium": 1360, "sugar": 0, "saturatedFat": 5},
      {
        "name": "Margherita Pizza",
        "sodium": 1290,
        "sugar": 5,
        "saturatedFat": 10
      },
      {"name": "Fish Tacos", "sodium": 860, "sugar": 4, "saturatedFat": 4},
      {"name": "Lobster Bisque", "sodium": 870, "sugar": 4, "saturatedFat": 11},
      {
        "name": "Kale Caesar Salad",
        "sodium": 530,
        "sugar": 2,
        "saturatedFat": 2
      },
      {
        "name": "Grilled Tuna Steak",
        "sodium": 250,
        "sugar": 0,
        "saturatedFat": 1
      },
      {
        "name": "Vegetable Lasagna",
        "sodium": 680,
        "sugar": 7,
        "saturatedFat": 7
      },
      {
        "name": "Chicken Fajita Bowl",
        "sodium": 1210,
        "sugar": 4,
        "saturatedFat": 4
      },
      {
        "name": "Quinoa Salad with Roasted Vegetables",
        "sodium": 310,
        "sugar": 3,
        "saturatedFat": 1
      },
      {
        "name": "Beef and Mushroom Stroganoff",
        "sodium": 770,
        "sugar": 5,
        "saturatedFat": 7
      },
      {
        "name": "Tomato and Basil Bruschetta",
        "sodium": 220,
        "sugar": 3,
        "saturatedFat": 1
      },
      {
        "name": "Grilled Shrimp Caesar Salad",
        "sodium": 870,
        "sugar": 5,
        "saturatedFat": 5
      },
      {
        "name": "Roasted Beet and Goat Cheese Salad",
        "sodium": 280,
        "sugar": 9,
        "saturatedFat": 4
      },
      {"name": "Vegetable Curry", "sodium": 620, "sugar": 7, "saturatedFat": 4}
    ];

    final neighbors = kNearestNeighbors(
      recipes
          .map((recipe) => List.castFrom<dynamic, double>([
                recipe['sodium'],
                recipe['sugar'],
                recipe['saturatedFat'],
              ]))
          .toList(),
      [
        widget.targetSodium,
        widget.targetSugar,
        widget.targetSaturatedFat,
      ],
      recipes.length,
    );

    final maxDistance = neighbors[neighbors.length - 1]['distance'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Comparison'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recipe ranking for someone with hypertension, diabetes, and cardiovascular disease:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: neighbors.length,
                itemBuilder: (BuildContext context, int index) {
                  final neighbor = neighbors[index];
                  final recipe = recipes[neighbor['index']];
                  final double percentage =
                      (1 - neighbor['distance'] / maxDistance) * 100;

                  if (percentage != 0) {
                    return ListTile(
                      title: Text(
                          '${recipe['name']}: ${percentage.toStringAsFixed(2)}%'),
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
