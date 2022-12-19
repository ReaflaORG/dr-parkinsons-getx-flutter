class FaqModel {
  FaqModel({
    required this.frequentlyAskedQuestionId,
    required this.question,
    required this.answer,
    required this.createdAt,
  });

  int frequentlyAskedQuestionId;
  String question;
  String answer;
  DateTime createdAt;

  factory FaqModel.fromJson(Map<String, dynamic> json) => FaqModel(
        frequentlyAskedQuestionId: json['frequently_asked_question_id'],
        question: json['question'],
        answer: json['answer'],
        createdAt: DateTime.parse(json['created_at']),
      );

  Map<String, dynamic> toJson() => {
        'frequently_asked_question_id': frequentlyAskedQuestionId,
        'question': question,
        'answer': answer,
        'created_at': createdAt.toIso8601String(),
      };
}
