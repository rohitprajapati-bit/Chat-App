import 'package:chat_app/auth/auth_service.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController conformPsController = TextEditingController();
  final void Function()? onTab;

  RegisterPage({super.key, this.onTab});

  void register(BuildContext context) async {
    final _auth = AuthService();
    if (passwordController.text == conformPsController.text) {
      try {
        await _auth.signUpWithEmailAndPassword(
            emailController.text, passwordController.text);
        // await _auth.signInWithEmailAndPassword(
        //     emailController.text, passwordController.text);
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(e.toString()),
                ));
      }
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('Password dont match!'),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message,
              size: 60,
              color: Colors.grey,
            ),
            Text(
              "Let's create an  account for you",
              style: TextStyle(color: Colors.grey, fontSize: 17),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: TextField(
                controller: passwordController,
                // obscureText: true,
                decoration: InputDecoration(
                    labelText: 'password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: TextField(
                controller: conformPsController,
                decoration: InputDecoration(
                    labelText: 'Confirm password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
            GestureDetector(
              onTap: () => register(context),
              child: Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blue.shade400,
                ),
                child: Center(
                    child: Text(
                  "Register",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account?  '),
                GestureDetector(
                  onTap: onTab,
                  child: Text(
                    'Login now',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
