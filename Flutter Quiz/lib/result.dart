import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';

class Result extends StatelessWidget {
  const Result(this.selectedAnswers, this.restart, {super.key});

  final List<String> selectedAnswers;

  final void Function() restart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    var numOfCurrectAnswers = 0;

    for (var i = 0; i < questions.length; i++) {
      if (getSummaryData()[i]['user_answer'] ==
          getSummaryData()[i]['correct_answer']) {
        numOfCurrectAnswers++;
      }
    }
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 160, 20, 140),
      width: double.infinity,
      height: double.infinity,
      child: SizedBox(
        height: 100,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'You answered $numOfCurrectAnswers out of ${questions.length} questions correctly!',
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              ...getSummaryData().map((e) => Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                              radius: 15,
                              backgroundColor:
                                  e['user_answer'] == e['correct_answer']
                                      ? Colors.blue
                                      : Colors.red,
                              child: Text(((e['question_index'] as int) + 1)
                                  .toString())),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  e['question'].toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text(e['user_answer'].toString(),
                                    style: const TextStyle(
                                      color: Colors.black,
                                    )),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text(e['correct_answer'].toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              TextButton.icon(
                onPressed: restart,
                icon: const Icon(
                  Icons.restart_alt_outlined,
                  color: Colors.white,
                ),
                label: const Text(
                  'Restart Quiz!',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
