import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qlinic/core/utils/size_config.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? labelText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.labelText,
    this.obscureText = false,
    this.validator,
    this.prefixIcon,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _obscure;

  @override
  void initState() {
    super.initState();
    _obscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: _obscure,
      cursorColor: Colors.black,
      cursorHeight: 20.h,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 15.h,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.sp),
          borderSide: BorderSide(color: Colors.red.withOpacity(.16)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.sp),
          borderSide: BorderSide(
            color: const Color(0xff677294).withOpacity(.16),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.sp),
          borderSide: BorderSide(
            color: const Color(0xff677294).withOpacity(.16),
          ),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.sp)),
        labelText: widget.labelText,
        labelStyle: GoogleFonts.rubik(
          color: const Color(0xff677294),
          fontSize: 16.sp,
          fontWeight: FontWeight.w300,
        ),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  _obscure ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _obscure = !_obscure;
                  });
                },
              )
            : null,
      ),
    );
  }
}
