import 'package:bmi/services/bmi_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bmiProvider = ChangeNotifierProvider<Bmi>((ref) {
  return Bmi();
});
