import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/card_model.dart';
import '../state/game_state.dart';

class CardWidget extends StatelessWidget {
  final CardModel card;
  final int index;

  CardWidget({required this.card, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!card.isFaceUp && !card.isMatched) {
          Provider.of<GameState>(context, listen: false).cardTapped(index);
        }
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 0.5),
          borderRadius: BorderRadius.circular(5),
        ),
        child: card.isFaceUp
            ? Image.asset(card.frontAsset, fit: BoxFit.cover)
            : Image.asset(card.backAsset, fit: BoxFit.cover),
      ),
    );
  }
}
