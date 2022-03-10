import 'package:flutter/material.dart';
import 'presentation/screens/screens.dart';
import 'core/injection/injection_container.dart' as injection_dependency;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injection_dependency.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}
