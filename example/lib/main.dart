import 'package:external_link_account_modal/external_link_account_modal.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'External Link Account Modal Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ExternalLinkAccountText(
              url: 'https://example.com',
              developerName: 'Example Developer',
              locale: 'en',
              onCanMakePaymentsFailed: () {
                debugPrint('onCanMakePaymentsFailed');
              },
            ),
            InkWell(
              child: const Text(
                'Custom Link',
                style: TextStyle(
                  color: Colors.blueAccent,
                  decorationColor: Colors.blueAccent,
                  decoration: TextDecoration.underline,
                ),
              ),
              onTap: () {
                showExternalLinkModal(
                  context,
                  'Example Developer',
                  'https://example.com',
                  onCanMakePaymentsFailed: () {
                    debugPrint('onCanMakePaymentsFailed');
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
