import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/question.dart';
import '../../../domain/entities/user_question.dart';
import '../../../styles/colors.dart';
import '../../../utils/state_enum.dart';
import '../../provider/question_notifier.dart';
import '../../provider/user_notifier.dart';
import '../../widget/toast.dart';

class ChangeUserQuestion extends StatefulWidget {
  final int id;

  static const String routeName = '/change_challenge';

  const ChangeUserQuestion({Key? key, required this.id}) : super(key: key);

  @override
  _ChangeUserQuestionState createState() => _ChangeUserQuestionState();
}

class _ChangeUserQuestionState extends State<ChangeUserQuestion> {
  final _formKey = GlobalKey<FormState>();
  final FocusNode _linkFocusNode = FocusNode();
  var _selectedQ1, _selectedQ2, _selectedQ3;
  final _ans1 = TextEditingController();
  final _ans2 = TextEditingController();
  final _ans3 = TextEditingController();
  List<Question> questions = [];

  @override
  initState() {
    super.initState();
    Future.microtask(() => Provider.of<QuestionNotifier>(context, listen: false)
      ..fetchQuestions());
  }

  @override
  Widget build(BuildContext context) {
    String loading = "Mengambil data...";

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('Atur Pertanyaan Rahasia'),
      ),
      body: Consumer<QuestionNotifier>(
        builder: (_, data, child) {
          if (data.questionState == RequestState.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (data.questionState == RequestState.loaded) {
            questions =
                Provider.of<QuestionNotifier>(context, listen: false).question;

            return ProgressHUD(
              child: Builder(
                builder: (BuildContext context) {
                  return SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 10),
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
                              hint: Text('Question 1'),
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
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Data tidak boleh kosong!';
                                }
                              },
                            ),
                            SizedBox(height: 30),
                            Text('Pertanyaan 2',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            DropdownButtonFormField<int>(
                              isExpanded: true,
                              iconSize: 0,
                              decoration: InputDecoration(
                                icon: Image.asset('assets/icons/question.png'),
                                suffixIcon: const Icon(Icons.arrow_drop_down),
                              ),
                              hint: const Text('Question 2'),
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
                            const SizedBox(height: 8),
                            const Text('Jawaban',
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
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Data tidak boleh kosong!';
                                }
                              },
                            ),
                            const SizedBox(height: 30),
                            const Text('Pertanyaan 3',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            DropdownButtonFormField<int>(
                              isExpanded: true,
                              iconSize: 0,
                              decoration: InputDecoration(
                                icon: Image.asset('assets/icons/question.png'),
                                suffixIcon: Icon(Icons.arrow_drop_down),
                              ),
                              hint: Text('Question 3'),
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
                            const SizedBox(height: 8),
                            const Text('Jawaban',
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
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Data tidak boleh kosong!';
                                }
                              },
                            ),
                            SizedBox(height: 10),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    int question1 = _selectedQ1;
                                    int question2 = _selectedQ2;
                                    int question3 = _selectedQ3;
                                    String ans1 = _ans1.text.toLowerCase();
                                    String ans2 = _ans2.text.toLowerCase();
                                    String ans3 = _ans3.text.toLowerCase();
                                    var challenge = UserQuestion(
                                      user: widget.id.toString(),
                                      quest1: question1,
                                      quest2: question2,
                                      quest3: question3,
                                      ans1: ans1,
                                      ans2: ans2,
                                      ans3: ans3,
                                    );

                                    var progress = ProgressHUD.of(context);
                                    progress!
                                        .showWithText('Memeriksa pertanyaan');

                                    await Provider.of<UserNotifier>(
                                      context,
                                      listen: false,
                                    ).postChallenge(challenge).whenComplete(() {
                                      progress.dismiss();
                                      _ans1.clear();
                                      _ans2.clear();
                                      _ans3.clear();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content:
                                                  Text('Data Diperbarui!')));
                                    }).onError((error, stackTrace) {
                                      progress.dismiss();
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              content: Text('Error $error'),
                                            );
                                          });
                                    });
                                  }
                                },
                                child: const Text('Perbarui Pertanyaan Keamanan'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return const Center(child: Icon(Icons.error));
          }
        },
      ),
    );
  }
}