import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_and_apicalling/screens/home_screen.dart';

void main() => runApp(
      ProviderScope(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'riverpod and api calling',
          theme: ThemeData(
            useMaterial3: true,
            colorSchemeSeed: Colors.red,
          ),
          home: const HomeScreen(),
        ),
      ),
    );
