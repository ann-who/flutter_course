import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

class ContactBottomSheet {
  ContactBottomSheet._();

  static Future modalBottomSheet(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      useSafeArea: true,
      useRootNavigator: true,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return const ContactActionsBody();
      },
    );
  }
}

class ContactPopOver {
  ContactPopOver._();

  static Future popover(BuildContext context) async {
    await showPopover(
      context: context,
      width: MediaQuery.of(context).size.width * 0.3,
      bodyBuilder: (context) => const ContactActionsBody(),
    );
  }
}

class ContactActionsBody extends StatelessWidget {
  const ContactActionsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 16.0),
        BottomSheetOption(
          icon: Icon(Icons.person),
          title: 'View profile',
        ),
        Divider(),
        BottomSheetOption(
          icon: Icon(Icons.people),
          title: 'Friends',
        ),
        Divider(),
        BottomSheetOption(
          icon: Icon(Icons.report_gmailerrorred_rounded),
          title: 'Report',
        ),
      ],
    );
  }
}

class BottomSheetOption extends StatelessWidget {
  final Icon icon;
  final String title;

  const BottomSheetOption({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pop(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            icon,
            const SizedBox(width: 16.0),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
