import 'package:firebase_admin_sdk/firebase_admin_sdk.dart';
import 'package:firebase_functions/firebase_functions.dart';

void main() {
  runFunctions((firebase) {
    firebase.https.onRequest(name: 'helloWorld', (request) async {
      final arr = List.generate(1500, (index) => index);

      final firestore = FirebaseApp.instance.firestore();

      await Future.wait(
        arr.map((index) {
          return firestore
              .collection('non-existent-collection')
              .where('number', .equal, index)
              .limit(1)
              .get();
        }),
        eagerError: true,
      );

      return .ok('Yay! Client Exception did not occur.');
    });
  });
}
