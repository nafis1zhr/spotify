import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider untuk menyimpan status halaman aktif (index)
final navigationIndexProvider = StateProvider<int>((ref) => 0);
