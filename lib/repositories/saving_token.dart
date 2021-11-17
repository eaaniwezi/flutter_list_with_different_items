import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final storage = new FlutterSecureStorage();

class SavingToken {
  Future<void> storingToken() async {
    await storage.write(
        key: "token",
        value:
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYwZTBhNzU2NTBlZmYwM2M4NGU3ZTA1YiIsInJvbGUiOiJzdXBlcmFkbWluIiwib3duZXIiOiJzdXBlcmFkbWluIiwiaWF0IjoxNjI1NDA1NDA1LCJleHAiOjE2MjYwMTAyMDV9.B6Y2JXfF28g62QdQCf577L3sLMcAOY95RSKhcCGWrXU");
  }
}
