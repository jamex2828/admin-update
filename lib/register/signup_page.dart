import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:main_menu_page/data_class.dart';
import '../http_helper.dart';
import 'login_screen.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

TextEditingController adminUserController =
    TextEditingController(text: admin.adminUsername);
TextEditingController adminPassController =
    TextEditingController(text: admin.adminPassword);

  Admin admin = Admin(id: 0, adminUsername: '', adminPassword: '');

  class _SignupPageState extends State<SignupPage> {
    final stateManager = HomePageManager();
  //username function
    Widget buildUsername() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'enter username',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 60,
            child: TextField(
              controller: adminUserController,
              onChanged: (val) {
                admin.adminUsername = val;
              },
              keyboardType: TextInputType.name,
              style: const TextStyle(color: Colors.black87),
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.person,
                  color: Color(0xfffd5800),
                ),
              ),
            ),
          ),
        ],
      );
    }

//password function
  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'enter password',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 60,
          child: TextField(
            controller: adminPassController,
            onChanged: (val) {
              admin.adminPassword = val;
            },
            obscureText: true,
            style: const TextStyle(color: Colors.black87),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.lock,
                color: Color(0xfffd5800),
              ),
            ),
          ),
        ),
      ],
    );
  }

//Sign up button function
  Widget buildLoginBtn() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          stateManager.addAdmin(
              adminUserController.text, adminPassController.text);
        },
        child: const Text(
          'REGISTER',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

//Login button for existing account
  Widget buildSignUpBtn(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      },
      child: RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: 'Already have an account?  ',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            TextSpan(
              text: 'Log in',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title at the top bar
        title: const Text('CCIS CL1M INVENTORY'),
        backgroundColor: const Color(0xfffd5800),
      ),
      //body
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      //gradient colors of orange
                      Color(0xfffd5800),
                      Color(0xccfd5800),
                      Color(0x99fd5800),
                      Color(0xB3fd5800),
                    ],
                  ),
                ),
                child: SingleChildScrollView(
                  //for the page to be scrolled
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //signin button attributes
                      const Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                      //function call
                      const SizedBox(height: 50),
                      buildUsername(),
                      const SizedBox(height: 20),
                      buildPassword(),
                      buildLoginBtn(),
                      buildSignUpBtn(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
