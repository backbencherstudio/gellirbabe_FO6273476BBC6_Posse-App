import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';

/// The main splash provider to expose SplashNotifier's state
final splashProvider = StateNotifierProvider<SplashNotifier, bool>((ref) {
  return SplashNotifier(ref);
});

/// Notifier that manages splash state
class SplashNotifier extends StateNotifier<bool> {
  final Ref ref;

  SplashNotifier(this.ref) : super(false); // Initial state: splash not complete

  /// Called to start splash process (like from SplashScreen)
  Future<void> initializeSplash() async {
    await Future.delayed(const Duration(seconds: 3));

    state = true;
  }

  void resetSplash() {
    state = false;
  }
}
