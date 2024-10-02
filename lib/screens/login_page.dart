import 'package:chat_app/auth/auth_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController =
      TextEditingController(text: 'rohit9900');
  final void Function()? onTab;

  LoginPage({super.key, required this.onTab});

  //login method
  void login(BuildContext context) async {
    final authService = AuthService();

    try {
      await authService.signInWithEmailAndPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
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
              "Welcome Back,you've been missed!",
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
            // const SizedBox(
            //   height: 0,
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
            // SizedBox(
            //   height: 10,
            // ),

            // ElevatedButton(onPressed: () {}, child: Text("Login"))
            GestureDetector(
              onTap: () => login(context),
              child: Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blue.shade400,
                ),
                child: Center(
                    child: Text(
                  "Login",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Not a member? '),
                GestureDetector(
                  onTap: onTab,
                  child: Text(
                    'Register now',
                    style: TextStyle(fontWeight: FontWeight.bold),
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
