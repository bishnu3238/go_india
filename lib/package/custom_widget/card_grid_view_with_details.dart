import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

 import '../package/package.dart';

class CardGridViewWithDetails extends StatelessWidget {
  const CardGridViewWithDetails({super.key, required this.items});

  final GridViewModel items;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.grey[400]!)),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Stack(
            children: [
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ImageShower(
                        imageUrl: items.image,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 0),
                      AutoSizeText(
                        items.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        softWrap: true,
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
                        decoration: BoxDecoration(
                            color: Colors.purple[50],
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.brandsFontAwesome,
                              color: Colors.purple,
                              size: 15,
                            ),
                            Flexible(
                              child: AutoSizeText(
                                '',
                                style: TextStyle(color: Colors.purple[800]),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Shipping Charge applied",
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
