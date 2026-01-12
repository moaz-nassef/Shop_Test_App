import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hintText, this.onChanged, this.keyboardType = TextInputType.number});
  final String hintText;
  final ValueChanged<String>? onChanged;
  final TextInputType keyboardType;
  

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      onChanged: onChanged,
      decoration: InputDecoration(hintStyle: TextStyle(color: const Color.fromARGB(255, 255, 3, 3)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(width: 2.0, color: const Color.fromARGB(255, 71, 169, 182)),
        ),
        labelText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(width: 2.0, color: const Color.fromARGB(255, 71, 169, 182)),
        
        ),
        focusedBorder: OutlineInputBorder(
          
          gapPadding: 4.0,
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(width: 2.0, color: Colors.blue),
          
        ),
      ),
    );
  }
}
   