import 'package:bido/apps/sell/providers/date_provider.dart';
import 'package:bido/general/utils/colors.dart';
import 'package:bido/general/utils/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ProductEndDate extends ConsumerStatefulWidget {
  const ProductEndDate({Key? key}) : super(key: key);

  @override
  ConsumerState<ProductEndDate> createState() => _ProductEndDateState();
}

class _ProductEndDateState extends ConsumerState<ProductEndDate> {
  @override
  Widget build(BuildContext context) {
    final date = ref.watch(dateProvider);

    return InkWell(
      onTap: () async {
        String a = await _pickDate(context);
        ref.read(dateProvider.notifier).dateUpdate(a);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: date.isEmpty
                ? Text("End Date", style: KTextStyle.title4)
                : Text(date, style: KTextStyle.title4),
          ),
          Icon(CupertinoIcons.calendar, color: KColor.primary),
        ],
      ),
    );
  }

  Future<String> _pickDate(BuildContext context) async {
    final f = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime(DateTime.now().year + 2),
    );
    return DateFormat(
      'yyyy-MM-dd',
    ).format(f!).toString();
  }
}
