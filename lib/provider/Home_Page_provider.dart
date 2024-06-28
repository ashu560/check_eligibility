import 'package:flutter/foundation.dart';

class ageEligibilityProvider with ChangeNotifier {
  bool? isEligible;
  String eligibilityMessage = "";

  // String get eligibilityMessage => _eligibilityMessage;

  void checkEeligibility(int age) {
    if (age >= 18) {
      isEligible = true;
      eligibilityMessage = 'You are eligibler to login...';
      notifyListeners();
    } else {
      isEligible = false;
      eligibilityMessage = 'You are not eligibler to login, better luck.';
      notifyListeners();
    }
  }
}
