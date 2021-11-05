import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../styles/colors.dart';
import '../../../utils/navigation.dart';
import '../../../utils/state_enum.dart';
import '../../provider/user_notifier.dart';
import 'change_user_question.dart';
import 'password_change_page.dart';

class ProfilePage extends StatefulWidget {
  static const ROUTE_NAME = '/profile_page';

  final String email;

  ProfilePage({required this.email});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  var _usernameController = TextEditingController();
  var _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<UserNotifier>(context, listen: false)
      ..getUserData(widget.email));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text('Profil'),
      ),
      body: Consumer<UserNotifier>(
        builder: (_, data, child) {
          if (data.userState == RequestState.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (data.userState == RequestState.loaded) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.person, size: 100),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Consumer<UserNotifier>(
                      builder: (context, provider, widget) {
                        var userData = provider.user;

                        _usernameController.text = userData!.username;
                        _emailController.text = userData.email;

                        return Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Username',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextFormField(
                                controller: _usernameController,
                                keyboardType: TextInputType.text,
                                enabled: false,
                                decoration: InputDecoration(
                                  hintText: 'Username',
                                  icon: Icon(Icons.person_outline,
                                      color: orangeBlaze),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text('Email',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextFormField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                enabled: false,
                                decoration: InputDecoration(
                                  hintText: 'Email',
                                  icon: Icon(Icons.email_outlined,
                                      color: orangeBlaze),
                                ),
                              ),
                              // TODO UBAH PERTANYAAN KEAMANAN
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () => Navigation.intentWithData(
                                      ChangeUserQuestion.routeName,
                                      userData.id),
                                  child: Text('Ubah Pertanyaan Keamanan'),
                                ),
                              ),
                              SizedBox(height: 10),
                              // TODO FIREBASE MESSAGING
                              /* SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    String? token = await FirebaseMessaging
                                        .instance
                                        .getToken();
                                    print('FIREBASE token: $token');

                                    if (token != null) {
                                      provider.postToken(userData.id, token);
                                    } else {
                                      toast('error in firebase!');
                                    }
                                  },
                                  child:
                                      Text('Kirim Token Ke Server (DEV MODE)'),
                                ),
                              ),*/
                              SizedBox(height: 10),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () => Navigation.intent(
                                      PasswordChangePage.ROUTE_NAME),
                                  child: Text('Ganti Password'),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(child: Icon(Icons.error));
          }
        },
      ),
    );
  }
}