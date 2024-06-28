import 'package:check_eligibility/provider/Home_Page_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Age Eligibility...'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: ChangeNotifierProvider<ageEligibilityProvider>(
            create: (context) => ageEligibilityProvider(),
            child: Consumer<ageEligibilityProvider>(
                builder: (context, ashu, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text('value.eli'),
                  Text(
                    ashu.eligibilityMessage,
                    style: TextStyle(
                        color: (ashu.isEligible == true
                            ? Colors.green
                            : Colors.red)),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter your age here.',
                    ),
                    onChanged: (value) {
                      try {
                        int age = int.parse(value);
                        ashu.checkEeligibility(age);
                      } catch (e) {
                        print('Error $e');
                      }
                    },
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
