import 'package:flutter_riverpod/flutter_riverpod.dart';

final dateProvider = StateNotifierProvider<DatePickerAll, String>((ref) {
  return DatePickerAll();
});

class DatePickerAll extends StateNotifier<String> {
  DatePickerAll() : super('End Date');

  void dateUpdate(String? a) {
    state = a!;
  }
}
