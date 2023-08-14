import 'package:flutter/material.dart';

class AddItemWidget extends StatelessWidget {
  const AddItemWidget({
    Key? key,
    required this.itemCount,
    required this.onMinus,
    required this.onPlus,
  }) : super(key: key);

  final int itemCount;
  final void Function()? onMinus;
  final void Function()? onPlus;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 100),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(15),
      ),
      child: itemCount < 1
          ? GestureDetector(
              onTap: onPlus,
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Center(
                  child: Text(
                    "Add",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: onMinus,
                  icon: const Icon(Icons.remove),
                ),
                Text(
                  itemCount.toString(),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                IconButton(
                  onPressed: onPlus,
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
    );
  }
}
