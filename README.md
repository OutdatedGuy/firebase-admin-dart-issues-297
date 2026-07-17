https://github.com/firebase/firebase-admin-dart/issues/297

## Steps to Reproduce

1. Clone the repo
2. Insert your firebase project-id in `.firebaserc`
3. Execute `firebase use default`
4. Start emulator with `firebase emulators:start`
5. Run node.js function (via cURL or Postman)
6. Check execution finishes successfully, note the time taken
7. Now run dart function (via cURL or Postman)
8. Check execution finishes successfully, note the time taken

## My run results

| Run | Queries |  Node  |      Dart      |
| :-: | :-----: | :----: | :------------: |
|  1  |  1.5k   | 1511ms |    16457ms     |
|  2  |  1.5k   | 1488ms |    16500ms     |
|  3  |  1.5k   | 1362ms |    16565ms     |
|  4  |   3k    | 1775ms |    32105ms     |
|  5  |   3k    | 2317ms |    31801ms     |
|  6  |   3k    | 1596ms |    34141ms     |
|  7  |   5k    | 2102ms | Quota Exceeded |

## My run logs

```
i  emulators: Starting emulators: functions, extensions
⚠  functions: The following emulators are not running, calls to these services from the Functions emulator will affect production: apphosting, auth, firestore, database, hosting, pubsub, storage, dataconnect
i  functions: Watching "firebase-admin-dart-issues-297/functions" for Cloud Functions...
⚠  functions: package.json indicates an outdated version of firebase-functions. Please upgrade using npm install --save firebase-functions@latest in your functions directory.
✔  functions: Using node@24 from host.
Serving at port 8232

✔  functions: Loaded functions definitions from source: helloWorld.
✔  functions[us-central1-helloWorld]: http function initialized (http://127.0.0.1:5001/<project-id>/us-central1/helloWorld).
i  functions: Watching "firebase-admin-dart-issues-297/dartfunctions" for Cloud Functions...
i  functions: running build_runner...
✔  functions: Loaded functions definitions from source: hello-world.
✔  functions[us-central1-hello-world]: http function initialized (http://127.0.0.1:5001/<project-id>/us-central1/hello-world).
i  functions: Starting build_runner watch for Dart functions...
✔  functions: build_runner initial build completed

┌─────────────────────────────────────────────────────────────┐
│ ✔  All emulators ready! It is now safe to connect your app. │
│ i  View Emulator UI at http://127.0.0.1:4000/               │
└─────────────────────────────────────────────────────────────┘

┌────────────┬────────────────┬──────────────────────────────────┐
│ Emulator   │ Host:Port      │ View in Emulator UI              │
├────────────┼────────────────┼──────────────────────────────────┤
│ Functions  │ 127.0.0.1:5001 │ http://127.0.0.1:4000/functions  │
├────────────┼────────────────┼──────────────────────────────────┤
│ Extensions │ 127.0.0.1:5001 │ http://127.0.0.1:4000/extensions │
└────────────┴────────────────┴──────────────────────────────────┘
  Emulator Hub host: 127.0.0.1 port: 4400
  Other reserved ports: 4500
┌─────────────────────────┬───────────────┬─────────────────────┐
│ Extension Instance Name │ Extension Ref │ View in Emulator UI │
└─────────────────────────┴───────────────┴─────────────────────┘
Issues? Report them at https://github.com/firebase/firebase-tools/issues and attach the *-debug.log files.
 
i  functions: Beginning execution of "us-central1-helloWorld"
⚠  Google API requested!
   - URL: "https://oauth2.googleapis.com/token"
   - Be careful, this may be a production service.
i  functions: Finished "us-central1-helloWorld" in 1511.36575ms
i  functions: Beginning execution of "us-central1-hello-world"
i  functions: Finished "us-central1-hello-world" in 16457.087333ms
i  functions: Beginning execution of "us-central1-helloWorld"
i  functions: Finished "us-central1-helloWorld" in 1488.836458ms
i  functions: Beginning execution of "us-central1-hello-world"
i  functions: Finished "us-central1-hello-world" in 16500.5885ms
i  functions: Beginning execution of "us-central1-helloWorld"
i  functions: Finished "us-central1-helloWorld" in 1362.340459ms
i  functions: Beginning execution of "us-central1-hello-world"
i  functions: Finished "us-central1-hello-world" in 16565.229042ms
✔  functions: Loaded functions definitions from source: hello-world.
⚠  functions: package.json indicates an outdated version of firebase-functions. Please upgrade using npm install --save firebase-functions@latest in your functions directory.
✔  functions: Using node@24 from host.
Serving at port 8220

✔  functions: Loaded functions definitions from source: helloWorld.
i  functions: Beginning execution of "us-central1-helloWorld"
⚠  Google API requested!
   - URL: "https://oauth2.googleapis.com/token"
   - Be careful, this may be a production service.
i  functions: Finished "us-central1-helloWorld" in 1775.3259170000001ms
i  functions: Beginning execution of "us-central1-hello-world"
i  functions: Finished "us-central1-hello-world" in 32105.834291ms
i  functions: Beginning execution of "us-central1-helloWorld"
i  functions: Finished "us-central1-helloWorld" in 2317.81875ms
i  functions: Beginning execution of "us-central1-hello-world"
i  functions: Finished "us-central1-hello-world" in 31801.202958ms
i  functions: Beginning execution of "us-central1-helloWorld"
i  functions: Finished "us-central1-helloWorld" in 1596.891625ms
i  functions: Beginning execution of "us-central1-hello-world"
i  functions: Finished "us-central1-hello-world" in 34141.308875ms
✔  functions: Loaded functions definitions from source: hello-world.
⚠  functions: package.json indicates an outdated version of firebase-functions. Please upgrade using npm install --save firebase-functions@latest in your functions directory.
✔  functions: Using node@24 from host.
Serving at port 8454

✔  functions: Loaded functions definitions from source: helloWorld.
i  functions: Beginning execution of "us-central1-helloWorld"
⚠  Google API requested!
   - URL: "https://oauth2.googleapis.com/token"
   - Be careful, this may be a production service.
i  functions: Finished "us-central1-helloWorld" in 2102.053625ms
i  functions: Beginning execution of "us-central1-hello-world"
>  {"severity":"ERROR","message":"TooManyRequestsException: [{\n  \"error\": {\n    \"code\": 429,\n    \"message\": \"Quota exceeded.\",\n    \"status\": \"RESOURCE_EXHAUSTED\"\n  }\n}\n]\npackage:google_cloud_rpc/service_client.dart 158:7  ServiceClient._makeStreamingRequest\n"}
i  functions: Finished "us-central1-hello-world" in 7953.297333ms

```
