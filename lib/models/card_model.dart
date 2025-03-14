import 'package:flutter/foundation.dart';

class CardModel with ChangeNotifier {
  bool isFaceUp = false;
  bool isMatched = false;
  final String frontAsset;
  final String backAsset = 'images/card_background.png';

  CardModel({required this.frontAsset});

  void flipCard() {
    isFaceUp = !isFaceUp;
    notifyListeners();
  }
}
