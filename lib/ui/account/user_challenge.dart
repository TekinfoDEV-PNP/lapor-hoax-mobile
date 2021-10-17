import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:laporhoax/common/navigation.dart';
import 'package:laporhoax/common/theme.dart';
import 'package:laporhoax/data/api/laporhoax_api.dart';
import 'package:laporhoax/data/model/challenge.dart';
import 'package:laporhoax/data/model/user_question.dart';
import 'package:laporhoax/provider/list_providers.dart';
import 'package:laporhoax/util/widget/toast.dart';
import 'package:provider/provider.dart';

import '../home_page.dart';

class UserChallenge extends StatefulWidget {
  final int id;

  static String routeName = '/challenge';

  UserChallenge({required this.id});

  @override
  _UserChallengeState createState() => _UserChallengeState();
}

class _UserChallengeState extends State<UserChallenge> {
  final _formKey = GlobalKey<FormState>();
  FocusNode _linkFocusNode = new FocusNode();
  var _selectedQ1, _selectedQ2, _selectedQ3;
  var _ans1 = TextEditingController();
  var _ans2 = TextEditingController();
  var _ans3 = TextEditingController();
  List<QuestionResult> questions = [];

  final api = LaporhoaxApi();

  void getQuestions() async {
    final response = await api.getQuestions();
    var listData = response;
    setState(() {
      questions = listData.results;
    });
  }

  @override
  initState() {
    super.initState();
//    getQuestions();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ListProviders>(context, listen: false);
    questions = provider.questionList;

    String loading = "Mengambil data...";

    return ProgressHUD(
      child: Builder(
        builder: (context) => Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            title: Text('Atur Pertanyaan Rahasia'),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                padding:
                    const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Pertanyaan 1',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    DropdownButtonFormField<int>(
                      isExpanded: true,
                      iconSize: 0,
                      decoration: InputDecoration(
                        icon: Image.asset('assets/icons/question.png'),
                        suffixIcon: Icon(Icons.arrow_drop_down),
                      ),
                      hint: Text('Category'),
                      value: _selectedQ1,
                      items: questions
                          .map((value) {
                            return DropdownMenuItem<int>(
                              child: Text(value.question),
                              value: value.id,
                            );
                          })
                          .where((item) =>
                              item.value != _selectedQ2 &&
                              item.value != _selectedQ3)
                          .toList(),
                      onChanged: (v) {
                        setState(() {
                          _selectedQ1 = v!;
                        });
                      },
                      onTap: () {
                        if (questions.isEmpty) {
                          toast(loading);
                        }
                      },
                    ),
                    SizedBox(height: 8),
                    Text('Jawaban',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      controller: _ans1,
                      decoration: InputDecoration(
                        hintText: 'jawaban pertanyaan 1',
                        icon: Image.asset('assets/icons/ans.png'),
                        labelStyle: TextStyle(
                          color: _linkFocusNode.hasFocus
                              ? orangeBlaze
                              : Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text('Pertanyaan 2',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    DropdownButtonFormField<int>(
                      isExpanded: true,
                      iconSize: 0,
                      decoration: InputDecoration(
                        icon: Image.asset('assets/icons/question.png'),
                        suffixIcon: Icon(Icons.arrow_drop_down),
                      ),
                      hint: Text('Category'),
                      value: _selectedQ2,
                      items: questions
                          .map((value) {
                            return DropdownMenuItem<int>(
                              child: Text(value.question),
                              value: value.id,
                            );
                          })
                          .where((item) =>
                              item.value != _selectedQ1 &&
                              item.value != _selectedQ3)
                          .toList(),
                      onChanged: (v) {
                        setState(() {
                          _selectedQ2 = v!;
                        });
                      },
                      onTap: () {
                        if (questions.isEmpty) {
                          toast(loading);
                        }
                      },
                    ),
                    SizedBox(height: 8),
                    Text('Jawaban',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      controller: _ans2,
                      decoration: InputDecoration(
                        hintText: 'jawaban pertanyaan 2',
                        icon: Image.asset('assets/icons/ans.png'),
                        labelStyle: TextStyle(
                          color: _linkFocusNode.hasFocus
                              ? orangeBlaze
                              : Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text('Pertanyaan 3',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    DropdownButtonFormField<int>(
                      isExpanded: true,
                      iconSize: 0,
                      decoration: InputDecoration(
                        icon: Image.asset('assets/icons/question.png'),
                        suffixIcon: Icon(Icons.arrow_drop_down),
                      ),
                      hint: Text('Category'),
                      value: _selectedQ3,
                      items: questions
                          .map((value) {
                            return DropdownMenuItem<int>(
                              child: Text(value.question),
                              value: value.id,
                            );
                          })
                          .where((item) =>
                              item.value != _selectedQ1 &&
                              item.value != _selectedQ2)
                          .toList(),
                      onChanged: (v) {
                        setState(() {
                          _selectedQ3 = v!;
                        });
                      },
                      onTap: () {
                        if (questions.isEmpty) {
                          toast(loading);
                        }
                      },
                    ),
                    SizedBox(height: 8),
                    Text('Jawaban',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      controller: _ans3,
                      decoration: InputDecoration(
                        hintText: 'jawaban pertanyaan 3',
                        icon: Image.asset('assets/icons/ans.png'),
                        labelStyle: TextStyle(
                          color: _linkFocusNode.hasFocus
                              ? orangeBlaze
                              : Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          int question1 = _selectedQ1;
                          int question2 = _selectedQ2;
                          int question3 = _selectedQ3;
                          String ans1 = _ans1.text;
                          String ans2 = _ans2.text;
                          String ans3 = _ans3.text;

                          print('userID ${widget.id}');
                          var challenge = Challenge(
                            user: widget.id.toString(),
                            quest1: question1,
                            quest2: question2,
                            quest3: question3,
                            ans1: ans1,
                            ans2: ans2,
                            ans3: ans3,
                          );

                          var progress = ProgressHUD.of(context);
                          var result = api.postSecurityQNA(challenge);
                          progress!.showWithText('Memeriksa pertanyaan');

                          result.then((value) {
                            print('result status: $value');
                            progress.dismiss();
                            toast('Berhasil diperbarui!');
                            Navigation.intent(HomePage.routeName);
                          }).onError((error, stackTrace) {
                            progress.dismiss();
                            print(error);
                            toast('error $error');
                          });
                        },
                        child: Text('Daftar'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
