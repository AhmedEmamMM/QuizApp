import 'package:flutter/material.dart';

class QuestionCardInfo extends StatelessWidget {
  final int questionNO;
  final int noOfQuestions;
  final bool isEmpty;
  final String question;
  const QuestionCardInfo({
    super.key,
    required this.questionNO,
    required this.noOfQuestions,
    required this.isEmpty,
    required this.question,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 60,
      left: 22,
      right: 22,
      child: Container(
        height: 200,
        width: 350,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 1),
                blurRadius: 5,
                spreadRadius: 3,
                color: Colors.deepPurple.withOpacity(.4)),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text((questionNO + 1).toString(),
                      style: const TextStyle(
                          color: Colors.orange,
                          fontSize: 24,
                          fontWeight: FontWeight.bold)),
                  Text(noOfQuestions.toString(),
                      style: const TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Text("Question ${questionNO + 1}/$noOfQuestions",
                style: const TextStyle(color: Colors.deepPurple, fontSize: 16)),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: isEmpty
                  ? const Text('No Questions')
                  : Text(question,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
