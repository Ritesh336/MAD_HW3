import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:card_matching_game/main.dart'; // Ensure this import points to your main app file
import 'package:card_matching_game/widgets/card_widget.dart';

void main() {
  testWidgets('Game initializes with a grid of cards', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the game grid is displayed
    expect(find.byType(GridView), findsOneWidget);

    // Verify that 16 cards are displayed for a 4x4 grid
    expect(find.byType(CardWidget), findsNWidgets(16));
  });

  testWidgets('Tapping a card flips it', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Tap the first card
    await tester.tap(find.byType(CardWidget).first);
    await tester.pump(); // This might need to be pumpAndSettle() if animations need to complete

    // Check if the card is flipped (by checking if the image source changes or checking visibility)
    // Assuming you have some way to identify the front of the card, such as a Key or by checking the card's state
    // This example checks if the model's isFaceUp has changed which requires you to adjust the CardWidget to allow checking
  });

  testWidgets('Matching two cards leaves them face up', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Assume that the first two cards are a match for testing (you may need to set this up explicitly in your test or mock it)
    await tester.tap(find.byType(CardWidget).at(0));
    await tester.pumpAndSettle();
    await tester.tap(find.byType(CardWidget).at(1));
    await tester.pumpAndSettle();

    // Verify both cards stay face up or are removed from the grid
    // This will depend on how your game logic is implemented and may require you to check internal state
  });

  testWidgets('Completing the game shows a win dialog', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Simulate tapping all matching pairs; this might be lengthy and require a loop or specific taps based on your card setup
    // Here's a simplified version where you'd tap each pair in sequence; adjust based on your actual logic
    for (int i = 0; i < 16; i += 2) {
      await tester.tap(find.byType(CardWidget).at(i));
      await tester.pump();
      await tester.tap(find.byType(CardWidget).at(i + 1));
      await tester.pumpAndSettle(); // Wait for any animations or logic to complete
    }

    // Check for a victory dialog
    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text('Congratulations!'), findsOneWidget);
    expect(find.text('You have matched all pairs.'), findsOneWidget);
  });
}
