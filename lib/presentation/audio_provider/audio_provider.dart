import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider untuk status pemutaran audio
final audioPlayerProvider = StateProvider<bool>((ref) => false); // false = musik berhenti, true = musik diputar
