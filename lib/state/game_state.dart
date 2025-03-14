import 'package:flutter/material.dart';
import '../models/card_model.dart';

class GameState with ChangeNotifier {
  List<CardModel> cards;

  GameState() : cards = List.generate(16, (index) {
    return CardModel(frontAsset: 'images/card_front${(index % 8) + 1}.jpg');
  }) {
    initializeGame();
  }

  void initializeGame() {
    cards.shuffle();
    notifyListeners();
  }

  void cardTapped(int index) {
    var card = cards[index];
    if (!card.isFaceUp && !card.isMatched) {
      card.flipCard();
      List<CardModel> flippedCards = cards.where((card) => card.isFaceUp && !card.isMatched).toList();
      if (flippedCards.length == 2) {
        if (flippedCards[0].frontAsset == flippedCards[1].frontAsset) {
          flippedCards[0].isMatched = true;
          flippedCards[1].isMatched = true;
        } else {
          Future.delayed(Duration(milliseconds: 500), () {
            flippedCards[0].flipCard();
            flippedCards[1].flipCard();
            notifyListeners();
          });
        }
        notifyListeners();
      }
    }
  }
}
