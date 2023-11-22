import 'package:cleanarchitecture/features/presentation/page/homepage/home_page.dart';
import 'package:cleanarchitecture/features/presentation/page/homepage/homepagebloc/home_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => HomePageBloc(),
        child: const HomePage(),
      ),
    );
  }
}
