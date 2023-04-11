import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:setup_provider/application/auth_controller.dart';
import 'package:setup_provider/domain/di/di.dart';
import 'package:setup_provider/infastructura/servises/app_validators.dart';
import 'package:setup_provider/presentation/components/custom_button.dart';
import 'package:setup_provider/presentation/components/custom_text_form_field.dart';
import 'package:setup_provider/presentation/view/pages/main/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final authController = Get.put(AuthController(authRepo));
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Login Page",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Form(
              key: formKey,
              child: CustomTextFormField(
                validator: (s) {

                  if (AppValidators.isValidEmail(s ?? "")) {
                    return null;
                  } else {
                    return "Email Xatto";
                  }
                },
                label: "Login",
              ),
            ),
            GetBuilder<AuthController>(
              builder: (controller) {
                return CustomButton(
                  onTap: () {
                    if (formKey.currentState?.validate() ?? false) {
                      authController.login("D","d",
                        onSuccess: (){
                          Get.to(()=>const MainPage());
                        }
                      );
                    }
                  },
                  title: "Login",
                  isLoading: controller.isLoading,
                );
              },

            )
          ],
        ),
      ),
    );
  }
}
