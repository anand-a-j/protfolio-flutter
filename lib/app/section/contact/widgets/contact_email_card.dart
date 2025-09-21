import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';

class ContactEmailCard extends StatelessWidget {
  const ContactEmailCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: primaryContainer,
          border: Border.all(
            width: 0.5,
            color: primaryContainerBorder,
          ),
        ),
        child: Center(
          child: Text(
            "anandjayakumar2001@gmail.com",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
