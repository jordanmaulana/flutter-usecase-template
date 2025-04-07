import 'package:flutter_usecase_template/base/export_view.dart';

class EmailIcon extends StatelessWidget {
  const EmailIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: VColor.tertiary,
      child: HugeIcon(
        icon: HugeIcons.strokeRoundedMail01,
        color: VColor.primary,
        size: 18.0,
      ),
    );
  }
}
