import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/firebase_auth/auth_util.dart';

String? healthScoreFactor(
  double? score,
  double? whole,
) {
  if (score == null || whole == null) {
    return null;
  }

  double ratio = score / whole;
  if (ratio >= 0.7) {
    return 'High';
  } else if (ratio >= 0.5 && ratio < 0.7) {
    return 'Medium';
  } else {
    return 'Low';
  }
}

String? stringListJoiner(List<String> stringList) {
  return stringList.join(', ');
}

bool? listEmptyChecker(List<String>? requiredList) {
  if (requiredList == null || requiredList.isEmpty) {
    return true;
  } else {
    return false;
  }
}

List<String>? nutrientUnitAdder() {
  List<String> nutrientUnits = [
    'g',
    'g',
    'g',
    'g',
    'kCal',
    'kCal',
    'g',
    'g',
    'mg',
    'mg',
    'mg',
    'mg',
    'g',
    'g',
    'mg',
    'mg',
    'g',
    'g',
    'mg',
    'mg',
    'g',
    'g',
    'mg',
    'mg'
  ];

  return nutrientUnits;
}

dynamic knnAlgorithmIntegrator(
  double carbohydrates,
  double protein,
  double calories,
  double fat,
  double calcium,
  double cholesterol,
  double saturatedFat,
  double potassium,
  double sugar,
  double sodium,
  double fiber,
  double magnesium,
  List<Map<String, dynamic>> recipes,
) {
  Map<String, double> targetNutrition = {
    'Carbohydrates': carbohydrates,
    'Protein': protein,
    'Calories': calories,
    'Fat': fat,
    'Calcium': calcium,
    'Cholesterol': cholesterol,
    'Saturated Fat': saturatedFat,
    'Potassium': potassium,
    'Sugar': sugar,
    'Sodium': sodium,
    'Fiber': fiber,
    'Magnesium': magnesium,
  };

  recipes.sort((a, b) => _compareRecipes(a, b, targetNutrition));
  
  return recipes;
}

int _compareRecipes(Map<String, dynamic> a, Map<String, dynamic> b, Map<String, double> target) {
  double distanceA = _calculateDistance(a, target);
  double distanceB = _calculateDistance(b, target);
  
  return distanceA.compareTo(distanceB);
}

double _calculateDistance(Map<String, dynamic> recipe, Map<String, double> target) {
  double distance = 0.0;
  
  for (String nutrient in target.keys) {
    double recipeValue = recipe[nutrient] ?? 0.0;
    double targetValue = target[nutrient] ?? 0.0;
    
    distance += math.pow(recipeValue - targetValue, 2);
  }
  
  return math.sqrt(distance);
}

String? integerListJoiner(List<int>? integerList) {
  if (integerList == null || integerList.isEmpty) {
    return null;
  }

  return integerList.join(', ');
}
