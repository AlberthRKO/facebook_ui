import 'package:facebook_ui/utils/responsive.dart';
import 'package:flutter/material.dart';

class NotificationCircle extends StatelessWidget {
  const NotificationCircle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Container(
      width: responsive.heightPercent(1.5),
      height: responsive.heightPercent(1.5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xffee305e),
        border: Border.all(
          width: responsive.heightPercent(.15),
          color: Colors.white,
        ),
      ),
    );
  }
}
