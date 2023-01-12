import 'package:business_layer/business_layer.dart';
import 'package:flutter/material.dart';

import 'package:clean_architecture/presentation/home_page.dart';

void main() {
  ServiceLocatorBlocs.instance.initializeBlocs();
  runApp(const MyApp());
}
