import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const LaunchDemoApp());
}

class LaunchDemoApp extends StatelessWidget {
  const LaunchDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Patrick's Launch Demo",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          bodyLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.white70,
          ),
        ),
      ),
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  final String deployedUrl =
      "https://flutter-web-demo.expo.app"; // <--- PUT YOUR EXPO URL HERE AFTER DEPLOY

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF111827), Color(0xFF1F2937), Color(0xFF111827)],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Launched with Expo 🚀",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 18),
                  Text(
                    "This Flutter app was built & deployed using Expo Launch.\n"
                    "No Mac, no Xcode, no Android Studio — just push and ship.",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 26,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: deployedUrl.isEmpty
                        ? null
                        : () async {
                            await Clipboard.setData(
                              ClipboardData(text: deployedUrl),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("URL copied to clipboard ✅"),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          },
                    child: Text(
                      deployedUrl.isEmpty ? "Deploy First" : "Copy App URL",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
