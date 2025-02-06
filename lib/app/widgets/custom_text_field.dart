import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/theme/colors_manager.dart';
import '../../core/theme/styles_manager.dart';

class CustomTextField extends StatefulWidget {
  final Color? iconColor;
  final Color? labelColor;
  final Color? hintColor;
  final TextInputType? type;
  final String? hint;
  final Iterable<String>? autoFillHints;
  final String? anotherHint;
  final ValueChanged<String>? onChange;
  final ValueChanged<String>? onSubmit;
  final String? Function(String?)? validate;
  final int? maxLines;
  final TextEditingController? controller;
  final void Function()? onTap;
  final bool keyboardPadding;
  final bool contentPadding;
  final int? maxLength;
  final bool? autoFocus;
  final String? errorText;
  final Color? fillColor;
  final Color? textColor;
  final Widget? suffixIcon;
  final String? initialValue;
  final Widget? prefixIcon;
  final bool isEnabled;
  final bool needMargin;
  final bool readOnly;
  final double? textSize;
  final TextDirection? textDirection;
  final List<TextInputFormatter>? formattedType;
  final double height;
  final double borderRadius;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final bool isNeedToElevation;
  final TextAlign? textAlign;
  final bool needToSuffixConstraints;
  final bool isResendSuffixIcon;
  final bool isBold;
  final TextInputAction inputAction;
  final FocusNode? focusNode;
  final String? name;
  final bool isRequired;
  final void Function(bool)? onFocusChange;
  final void Function()? onEditingComplete;
  const CustomTextField({
    super.key,
    this.focusNode,
    this.type,
    this.hint,
    this.isRequired = false,
    this.autoFillHints,
    this.onChange,
    this.validate,
    this.onFocusChange,
    this.focusedBorderColor = ColorsManager.primary,
    this.inputAction = TextInputAction.next,
    this.onTap,
    this.maxLines,
    this.isEnabled = true,
    this.onEditingComplete,
    this.controller,
    this.errorText,
    this.fillColor,
    this.textColor,
    this.maxLength,
    this.formattedType,
    this.iconColor,
    this.labelColor,
    this.keyboardPadding = true,
    this.contentPadding = false,
    this.autoFocus,
    this.initialValue,
    this.onSubmit,
    this.prefixIcon,
    this.readOnly = false,
    this.needMargin = true,
    this.textDirection,
    this.anotherHint,
    this.suffixIcon,
    this.textSize,
    this.height = 50,
    this.borderRadius = 14,
    this.isNeedToElevation = false,
    this.hintColor,
    this.textAlign,
    this.borderColor = Colors.grey,
    this.needToSuffixConstraints = false,
    this.isResendSuffixIcon = false,
    this.isBold = true,
    this.name,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  Timer? _debounce;

  void _onChangeWithDebounce(String value) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 600), () {
      if (widget.onChange != null) {
        widget.onChange!(value);
      }
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enableSuggestions: true,
      focusNode: widget.focusNode,
      autofillHints: widget.autoFillHints,
      onTap: widget.onTap,
      textInputAction: widget.inputAction,
      readOnly: widget.readOnly,
      onEditingComplete: widget.onEditingComplete,
      initialValue: widget.initialValue,
      autofocus: widget.autoFocus ?? false,
      maxLength: widget.maxLength,
      textDirection: widget.textDirection,
      textAlign: widget.textAlign ?? TextAlign.start,
      controller: widget.controller,
      maxLines: widget.maxLines ?? 1,
      validator: widget.validate,
      keyboardType: widget.type,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: _onChangeWithDebounce,
      inputFormatters: widget.formattedType ?? [],
      style: StylesManager.regular(
        fontSize: widget.textSize ?? 14,
        color: widget.textColor ?? const Color(0xFF39434F),
      ),
      scrollPadding: EdgeInsets.only(
        bottom: widget.keyboardPadding
            ? MediaQuery.of(context).size.height * .2
            : 0.0,
      ),
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        hintStyle: StylesManager.regular(
          fontSize: 14,
          color: widget.hintColor ?? Colors.grey[600],
        ),
        isDense: true,
        enabled: widget.isEnabled,
        hintText: widget.anotherHint ?? widget.hint ?? "",
        labelStyle: TextStyle(
          fontSize: 16,
          color: widget.labelColor ?? ColorsManager.white,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        alignLabelWithHint: true,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(widget.borderRadius),
          ),
          borderSide: BorderSide(color: widget.borderColor!, width: 0.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(widget.borderRadius),
          ),
          borderSide: BorderSide(color: widget.borderColor!, width: 0.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(widget.borderRadius),
          ),
          borderSide: const BorderSide(color: ColorsManager.error, width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(widget.borderRadius),
          ),
          borderSide:
              const BorderSide(color: ColorsManager.primary, width: 0.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(widget.borderRadius),
          ),
          borderSide: BorderSide(color: widget.borderColor!, width: 0.5),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(widget.borderRadius),
          ),
          borderSide: BorderSide(color: widget.borderColor!, width: 0.5),
        ),
        fillColor: widget.fillColor ?? Colors.transparent,
        filled: true,
        errorText: widget.errorText,
        errorMaxLines: 1,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        suffixIconConstraints: widget.needToSuffixConstraints
            ? BoxConstraints(
                minHeight: 47,
                minWidth: widget.isResendSuffixIcon ? 30 : 1,
                maxHeight: 48,
                maxWidth: widget.isResendSuffixIcon ? 30 : 1,
              )
            : null,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: widget.height < 49
              ? widget.suffixIcon != null || widget.prefixIcon != null
                  ? 0
                  : widget.height - 30
              : (24.h + widget.height - 50.h),
        ),
      ),
    );
  }
}
