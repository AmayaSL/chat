import 'package:chat/provider/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:chat/config/theme/app_theme.dart';
import 'package:chat/presentation/screens/chat_screen.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ChatProvider())],
      child: MaterialApp(
        theme: AppTheme(selectedColor: 5).theme(),
        debugShowCheckedModeBanner: false,
        home: ChatScreen(),
      ),
    );
  }
}
