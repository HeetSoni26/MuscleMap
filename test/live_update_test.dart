import 'package:flutter_test/flutter_test.dart';
import 'package:musclemap/app/musclemap_app.dart';
import 'package:musclemap/state/fit_state.dart';

void main() {
  testWidgets('selecting a muscle updates the Train screen immediately', (tester) async {

    fit.onboarded = true;
    fit.route = 'train';
    fit.trainStep = 'select';
    fit.selectedMuscles.clear();

    await tester.pumpWidget(const MuscleMapApp());
    await tester.pumpAndSettle();

    expect(find.textContaining('No muscles selected'), findsOneWidget);
    expect(find.text('Chest'), findsNothing);

    fit.toggleMuscle('chest');
    await tester.pump();

    expect(find.text('Chest'), findsOneWidget);
    expect(find.textContaining('No muscles selected'), findsNothing);

    fit.toggleMuscle('chest');
    await tester.pump();
    expect(find.text('Chest'), findsNothing);

    fit.route = 'home';
  });
}
