import 'package:flutter/material.dart';
import 'package:penmyplan/add_item_widget.dart';
import 'package:penmyplan/item_model.dart';

class SaladWidget extends StatelessWidget {
  const SaladWidget({
    Key? key,
    required this.salad,
    required this.itemCount,
    required this.onMinus,
    required this.onPlus,
  }) : super(key: key);

  final ItemModel salad;
  final int itemCount;
  final void Function()? onMinus;
  final void Function()? onPlus;

  @override
  Widget build(BuildContext context) {
    var sWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: sWidth,
              maxHeight: sWidth * 0.35,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: sWidth * 0.2,
                  height: sWidth * 0.3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      salad.imageUrl!,
                      width: sWidth * 0.2,
                      height: sWidth * 0.3,
                      fit: BoxFit.cover, // Maintain aspect ratio
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return const Icon(Icons
                            .error); // Display an error icon if image fails to load
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        salad.name!,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        salad.description!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(2),
                                decoration: const BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.eco,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                '\$${salad.price!}',
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          AddItemWidget(
                            itemCount: itemCount,
                            onMinus: onMinus,
                            onPlus: onPlus,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider()
        ],
      ),
    );
  }
}
