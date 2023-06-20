import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:login_test/features/login/controller/login_notifier_pod.dart';
import 'package:login_test/features/login/presentation/widgets/login_button.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final formkey = GlobalKey<FormBuilderState>();

  void login() {
    if (formkey.currentState!.validate()) {
      final username = formkey.currentState!.fields['username']!.value;
      final password = formkey.currentState!.fields['password']!.value;

      ref.read(loginStatePod.notifier).login(
            username: username,
            pasword: password,
            onError: () {
              const snackBar = SnackBar(
                content: Text('Login Error'),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            onSuccess: () {
              const snackBar2 = SnackBar(
                content: Text('Login Success'),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar2);
            },
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: "login".text.color(Colors.white).make(),
      ),
      body: FormBuilder(
        key: formkey,
        child: [
          "Login".text.bold.size(30).make().centered().p(10),
          FormBuilderTextField(
            name: 'username',
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              label: "Useranme".text.make(),
            ),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: "Enter the username")
            ]),
          ).p(10),
          FormBuilderTextField(
            name: 'password',
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(label: "Password".text.make()),
            validator: FormBuilderValidators.compose(
              [FormBuilderValidators.required(errorText: "Enter the Password")],
            ),
          ).p(10),
          LoginButton(login: login)
        ]
            .vStack(
              crossAlignment: CrossAxisAlignment.center,
              alignment: MainAxisAlignment.center,
            )
            .p(20),
      ),
    );
  }
}
