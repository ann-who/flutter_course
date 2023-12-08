import 'package:flutter/material.dart';
import 'package:task_3/ui_layer/widgets/app_avatar.dart';
import 'package:task_3/ui_layer/widgets/contact_actions.dart';

class ContactCard extends StatelessWidget {
  final String avatar;
  final String name;
  final String email;
  final bool isWide;

  const ContactCard({
    super.key,
    required this.avatar,
    required this.name,
    required this.email,
    required this.isWide,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30.0),
      onTapUp: (details) => isWide
          ? ContactPopOver.popover(context)
          : ContactBottomSheet.modalBottomSheet(context),
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: AppAvatar(
                path: avatar,
                height: isWide ? double.maxFinite : null,
              ),
            ),
            const SizedBox(width: 20.0),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 16.0,
                  bottom: 4.0,
                  right: 4.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      email,
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w300,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
