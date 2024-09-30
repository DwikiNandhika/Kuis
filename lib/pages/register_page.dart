import 'package:flutter/material.dart';
import 'package:kuis/datastore/user_data.dart';
import 'package:kuis/pages/login_page.dart';

class PageRegister extends StatefulWidget {
  const PageRegister({super.key});

  @override
  State<PageRegister> createState() => _PageRegisterState();
}

class _PageRegisterState extends State<PageRegister> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _authenticationIcon(icon: Icons.message),
              _registerText(
                text: "REGISTER\nRegister agar bisa menjelajahi fitur aplikasi.",
              ),
              _registerForm(
                controller: _usernameController,
                label: "username",
                obscureText: false,
                icon: Icons.person,
              ),
              _registerForm(
                controller: _passwordController,
                label: "password",
                obscureText: true,
                icon: Icons.key,
              ),
              _registerForm(
                controller: _passwordConfirmationController,
                label: "konfirmasi password",
                obscureText: true,
                icon: Icons.key,
              ),
              _registerButton(
                text: "Register",
                onPressed: () {
                  var usernameInput = _usernameController.text;
                  var passwordInput = _passwordController.text;
                  var passwordConfirmationInput =
                      _passwordConfirmationController.text;

                  if (passwordInput != passwordConfirmationInput) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Password tidak sama!"),
                    ));
                    return;
                  }

                  if (usernameInput.isEmpty ||
                      passwordInput.isEmpty ||
                      passwordConfirmationInput.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Data tidak boleh kosong!"),
                    ));
                    return;
                  }

                  users.add(User(
                    username: usernameInput,
                    password: passwordInput,
                  ).toJson());

                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return const PageLogin();
                  }));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _authenticationIcon({required IconData icon}) {
    return Image.network(
      "https://raw.githubusercontent.com/YudaSaputraa/FoodApp-assets/refs/heads/main/img_authentication.webp",
      width: 250,
    );
  }

  Widget _registerButton({
    required String text,
    required VoidCallback onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: FilledButton(onPressed: onPressed, child: Text(text)),
    );
  }

  Widget _registerText({required String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Text(text, style: Theme.of(context).textTheme.bodySmall),
    );
  }

  Widget _registerForm({
    required TextEditingController controller,
    required String label,
    required bool obscureText,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          label: Row(
            children: [
              Icon(
                icon,
                size: 16,
              ),
              const SizedBox(width: 12),
              Text(label),
            ],
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
        ),
        style: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }
}
