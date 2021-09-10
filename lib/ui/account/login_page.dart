import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' show Client;
import 'package:laporhoax/common/theme.dart';
import 'package:laporhoax/data/api/facebook_signin_api.dart';
import 'package:laporhoax/data/api/google_signin_api.dart';
import 'package:laporhoax/data/api/laporhoax_api.dart';
import 'package:laporhoax/ui/account/forgot_password_page.dart';
import 'package:laporhoax/ui/account/register_page.dart';

class LoginPage extends StatefulWidget {
  static String routeName = "/login_page";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;

  var _usernameController = TextEditingController();
  var _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var client = Client();
    var api = LaporhoaxApi(client);

    Future<String> getToken(String username, String password) async {
      return await api.postLogin(username, password);
    }

    Future signIn() async {
      final user = await GoogleSignInApi.login();

      if (user != null) {
        var header = await user.authHeaders;
        var authentication = user.authentication.toString();
        print("HEADERS $header");
        print("Auth $authentication}");
        print("User ID ${user.id}");
      }

      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Sign in failed'),
        ));
      }
    }

    Future facebookSignIn() async {
      final user = await FacebookSignInApi.login();

      if (user!.status == LoginStatus.failed) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Sign in failed'),
        ));
      }
    }

    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 50.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(33),
                        child: Container(
                          color: Color(0xFF999999),
                          height: 80,
                          width: 80,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text("Login", style: TextStyle(fontSize: 30.0)),
                    ],
                  ),
                ),
                Text('Username', style: TextStyle(fontWeight: FontWeight.bold)),
                TextFormField(
                  controller: _usernameController,
                  keyboardType: TextInputType.text,
                  autofillHints: [AutofillHints.username],
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'Username',
                    icon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Mohon isikan username!';
                    }
                  },
                ),
                SizedBox(height: 10),
                Text('Kata Sandi',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextFormField(
                  controller: _passwordController,
                  autofillHints: [AutofillHints.password],
                  keyboardType: TextInputType.text,
                  obscureText: _obscureText,
                  enableSuggestions: false,
                  autocorrect: false,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: 'Kata Sandi',
                    icon: Icon(FontAwesomeIcons.key),
                    suffixIcon: IconButton(
                      icon: Icon(_obscureText
                          ? FontAwesomeIcons.eyeSlash
                          : FontAwesomeIcons.eye),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Mohon isikan password!';
                    }
                  },
                ),
                SizedBox(height: 10),
                SizedBox(
                    width: double.infinity,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, ForgotPassword.routeName);
                      },
                      child: Text('Lupa Password ?',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.end),
                    )),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          var username = _usernameController.text.toString();
                          var password = _passwordController.text.toString();

                          print("Username = $username \nPassword = $password");

                          Future<String> token = getToken(username, password);
                          print("token : ${token.toString()}");
                        }
                      },
                      child: Text('Login'),
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin:
                                  const EdgeInsets.only(left: 10, right: 20),
                              child: Divider(
                                height: 36,
                              ),
                            ),
                          ),
                          Text(
                            'atau',
                            style: TextStyle(color: grey500),
                          ),
                          Expanded(
                            child: Container(
                              margin:
                                  const EdgeInsets.only(left: 20, right: 10),
                              child: Divider(
                                height: 36,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      SignInButton(Buttons.GoogleDark, onPressed: signIn),
                      SignInButton(Buttons.Facebook, onPressed: facebookSignIn),
                      ElevatedButton(
                        onPressed: GoogleSignInApi.logout,
                        child: Text('Logout'),
                      ),
                      SizedBox(height: 20),
                      Wrap(
                        children: [
                          Text('Masih belum mempunyai akun?'),
                          SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RegisterPage.routeName);
                            },
                            child: Text(
                              'Daftar disini',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
