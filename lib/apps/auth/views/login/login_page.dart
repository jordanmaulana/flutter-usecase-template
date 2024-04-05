import 'package:flutter/foundation.dart';

import '../../../../base/export_view.dart';
import '../../../../components/buttons.dart';
import '../../../../components/inputs.dart';
import '../../../../configs/route_name.dart';
import '../../controllers/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  late String _email;
  late String _password;

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(context.mdPadding),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: context.xlPadding),
                VFormInput(
                  keyboardType: TextInputType.emailAddress,
                  label: 'Email',
                  hint: 'email@yourdomain.com',
                  initialValue:
                      kDebugMode ? 'jordanmaulana25+3@gmail.com' : null,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email harus diisi';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _email = value!;
                  },
                ),
                SizedBox(height: context.mdPadding),
                Obx(() => VFormInput(
                      obscure: controller.obscureText.value,
                      keyboardType: TextInputType.emailAddress,
                      label: 'Password',
                      hint: '***',
                      initialValue: kDebugMode ? 'admin123' : null,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password harus diisi';
                        }
                        return null;
                      },
                      onSaved: (String? value) {
                        _password = value!;
                      },
                      suffixIcon: IconButton(
                        onPressed: controller.toggleObscure,
                        icon: Icon(
                          controller.obscureText.isTrue
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                      ),
                    )),
                SizedBox(height: context.lgPadding),
                PrimaryButton(
                  'Masuk',
                  onTap: () async {
                    final FormState form = _formKey.currentState!;
                    if (!form.validate()) return;
                    form.save();
                    controller.submitLogin(_email, _password);
                  },
                ),
                SizedBox(height: context.lgPadding),
                const VText('Tidak memiliki akun? '),
                SizedBox(height: context.smPadding),
                SecondaryButton(
                  'Buat Akun',
                  onTap: () => Get.toNamed(RouteName.register),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
