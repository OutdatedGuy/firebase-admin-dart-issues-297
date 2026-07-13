import {initializeApp} from "firebase-admin/app";
import {getFirestore} from "firebase-admin/firestore";
import {onRequest} from "firebase-functions/https";
initializeApp();

export const helloWorld = onRequest(async (_request, response) => {
  const arr = Array.from({length: 1500}, (_, index) => index);

  const firestore = getFirestore();

  await Promise.all(
    arr.map((index) => {
      return firestore
        .collection("non-existent-collection")
        .where("number", "==", index)
        .limit(1)
        .get();
    }),
  );

  response.status(200).send("Yay! Client Exception did not occur.");
});
