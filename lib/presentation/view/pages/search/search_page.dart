import 'package:flutter/material.dart';
import 'package:setup_provider/presentation/components/custom_text_form_field.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CustomTextFormField(
          label: "Search",
        ),
      ),
    );
  }
}
