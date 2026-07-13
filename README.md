https://github.com/firebase/firebase-admin-dart/issues/297

## Steps to Reproduce

1. Clone the repo
2. Insert your firebase project-id in `.firebaserc`
3. Execute `firebase use default`
4. Start emulator with `firebase emulators:start`
5. Run node.js function (via cURL or Postman)
6. Check execution finishes successfully, note the time taken
7. Now run dart function (via cURL or Postman)
8. Check if the execution succeeds, note the time taken
9. If execution fails, note that time taken is always around ~10s

## My run results

| Run No. | Node.js | Dart |
|:--------:|:--------:|:--------:|
| 1 | 1803 ms | 11131 ms (Crashed) |
| 2 | 1846 ms | 8701 ms  |
| 3 | 1468 ms | 10753 ms | 

## My run logs

```
i  emulators: Starting emulators: functions, extensions
⚠  functions: The following emulators are not running, calls to these services from the Functions emulator will affect production: apphosting, auth, firestore, database, hosting, pubsub, storage, dataconnect
i  functions: Watching "firebase-admin-dart-issues-297/functions" for Cloud Functions...
✔  functions: Using node@24 from host.
Serving at port 8853

✔  functions: Loaded functions definitions from source: helloWorld.
✔  functions[us-central1-helloWorld]: http function initialized (http://127.0.0.1:5001/{project-id}/us-central1/helloWorld).
i  functions: Watching "firebase-admin-dart-issues-297/dartfunctions" for Cloud Functions...
i  functions: running build_runner...
✔  functions: Loaded functions definitions from source: hello-world.
✔  functions[us-central1-hello-world]: http function initialized (http://127.0.0.1:5001/{project-id}/us-central1/hello-world).
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
i  functions: Finished "us-central1-helloWorld" in 1803.697041ms
i  functions: Beginning execution of "us-central1-helloWorld"
i  functions: Finished "us-central1-helloWorld" in 1846.767625ms
i  functions: Beginning execution of "us-central1-helloWorld"
i  functions: Finished "us-central1-helloWorld" in 1468.8377500000001ms
i  functions: Beginning execution of "us-central1-hello-world"
>  {"severity":"ERROR","message":"ClientException: Connection closed before full header was received, uri=https://firestore.googleapis.com/v1/projects/{project-id}/databases/(default)/documents:runQuery\npackage:http/src/io_client.dart 229:7                   IOClient.send\npackage:googleapis_auth/src/auth_http_utils.dart 43:22  AuthenticatedClient.send\npackage:google_cloud_rpc/service_client.dart 149:22     ServiceClient._makeStreamingRequest\n"}
i  functions: Finished "us-central1-hello-world" in 11131.794459ms
i  functions: Beginning execution of "us-central1-hello-world"
i  functions: Finished "us-central1-hello-world" in 8701.1795ms
i  functions: Beginning execution of "us-central1-hello-world"
i  functions: Finished "us-central1-hello-world" in 10753.458709ms
```
