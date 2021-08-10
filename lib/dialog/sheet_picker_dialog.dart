import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../ext/extension.dart';

class BottomSheetPickerDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();

  final List<Widget> children;
  final ValueChanged<int> itemSelected;
  final int initSelect;

  BottomSheetPickerDialog(this.children, this.itemSelected, {this.initSelect = 0});
}

class _State<T> extends State<BottomSheetPickerDialog> {
  late FixedExtentScrollController pickCl;

  int _select = 0;

  @override
  void initState() {
    super.initState();
    _select = widget.initSelect;
    pickCl = FixedExtentScrollController(initialItem: widget.initSelect);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: () => Get.dismissDialog(), child: Text("取消".tr)),
                TextButton(
                    onPressed: () {
                      Get.dismissDialog();
                      widget.itemSelected.call(_select);
                    },
                    child: Text("确定".tr))
              ],
            ),
            Divider(),
            Expanded(
                child: Visibility(
                    visible: widget.children.isNotEmpty,
                    child: CupertinoPicker(
                        scrollController: pickCl,
                        magnification: 1.1,
                        useMagnifier: true,
                        itemExtent: 40,
                        onSelectedItemChanged: (index) => _select = index,
                        children: widget.children)))
          ],
        ),
      ),
    );
  }
}