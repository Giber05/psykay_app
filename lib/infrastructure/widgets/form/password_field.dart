import 'package:flutter/material.dart';
import 'package:psykay_app/infrastructure/utils/value_validator/form_validator.dart';
import 'package:psykay_app/infrastructure/widgets/form/text_field.dart';

class PsykayPasswordField extends StatefulWidget {
  final ValueValidator<String?> validator;
  final String label;
  final TextEditingController controller;
  const PsykayPasswordField(
      {super.key,
      required this.validator,
      required this.label,
      required this.controller});

  @override
  State<PsykayPasswordField> createState() => _PsykayPasswordFieldState();
}

class _PsykayPasswordFieldState extends State<PsykayPasswordField> {
  bool _isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return PsykayTextField(
      obscureText: _isPasswordHidden,
      suffixIcon: InkWell(
        onTap: () => setState(() {
          _isPasswordHidden = !_isPasswordHidden;
        }),
        child: Icon(
          _isPasswordHidden ? Icons.visibility_off : Icons.visibility,
        ),
      ),
      validator: widget.validator,
      controller: widget.controller,
      label: widget.label,
    );
  }
}
