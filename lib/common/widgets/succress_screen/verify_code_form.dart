import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerifyCodeForm extends StatelessWidget {
  const VerifyCodeForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(8, (index) {
          return SizedBox(
            height: 48,
            width: 44,
            child: TextFormField(
              onChanged: (value) { 
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              style: Theme.of(context).textTheme.headlineMedium,
              keyboardType: TextInputType.text,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.singleLineFormatter
              ],
            ),
          );
        }),
      ),
      );
  }
}