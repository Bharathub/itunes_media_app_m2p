import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m2p_assignment/model/data_model/root_detection_state.dart';
import 'package:m2p_assignment/model/service/root_detection_service.dart';

class RootDetectionStateNotifier extends StateNotifier<RootDetectionState> {
  final RootDetectionService _service;

  RootDetectionStateNotifier(this._service)
      : super(RootDetectionState(
          rootedCheck: false,
          devMode: false,
          jailbreak: false,
        )) {
      checkRootStatus();
  }

  Future<void> checkRootStatus() async {
    final status = await _service.checkRootStatus();
    state = RootDetectionState(
      rootedCheck: status['rootedCheck']!,
      devMode: status['devMode']!,
      jailbreak: status['jailbreak']!,
    );
  }
}

final rootDetectionProvider =
    StateNotifierProvider<RootDetectionStateNotifier, RootDetectionState>((ref) {
  final service = ref.watch(rootDetectionServiceProvider);
  return RootDetectionStateNotifier(service);
});

final rootDetectionServiceProvider = Provider<RootDetectionService>((ref) {
  return RootDetectionService();
});
