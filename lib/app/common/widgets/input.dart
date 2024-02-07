// ignore_for_file: inference_failure_on_function_return_type

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jobsense/app/extensions/contextx.dart';

class InputBox extends StatefulWidget {
  const InputBox({
    required this.label,
    required this.hint,
    required this.controller,
    required this.obscureText,
    super.key,
    this.readOnly,
    this.validator,
    this.isActive,
    this.keyboardType,
    this.prefix,
    this.suffix,
    this.errorText,
    this.onTap,
    this.onChanged,
    this.maxLenght,
    this.border,
    this.maxLines,
  });
  final String label;
  final String hint;
  final InputBorder? border;
  final Widget? prefix;
  final Widget? suffix;
  final bool? isActive;
  final String? errorText;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool? readOnly;
  final int? maxLenght;
  final VoidCallback? onTap;
  final int? maxLines;
  final Function(String)? onChanged;

  @override
  State<InputBox> createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        maxLength: widget.maxLenght,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        readOnly: widget.readOnly ?? false,
        onTap: widget.onTap,
        validator: widget.validator,
        maxLines: widget.maxLines ?? 1,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText && obscure,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          errorMaxLines: 2,
          counterText: '',
          filled: true,
          fillColor: context.theme.colorScheme.onPrimary,
          enabled: widget.isActive ?? true,
          prefixIcon: widget.prefix,
          prefix: widget.prefix,
          suffixIcon: widget.obscureText
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      obscure = !obscure;
                    });
                  },
                  child: Icon(
                    obscure ? Icons.visibility_off : Icons.visibility,
                    color: context.colorScheme.onBackground.withOpacity(.75),
                  ),
                )
              : widget.suffix,
          //label: Text(widget.label),
          errorText: widget.errorText,
          //labelStyle: const TextStyle(color: tPrimaryColor),
          // enabledBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(10.0),
          // ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          // border: InputBorder.none,
          border: const OutlineInputBorder(),
          errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: context.colorScheme.error, width: 1.4),
            borderRadius: BorderRadius.circular(8),
          ),
          hintText: widget.hint,

          //hintStyle: TextStyle(color: Color.fromARGB(255, 184, 182, 182))
        ),
      ),
    );
  }
}
