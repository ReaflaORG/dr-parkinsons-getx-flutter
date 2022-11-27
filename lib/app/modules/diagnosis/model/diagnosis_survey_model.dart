class Survey {
  Survey({
    required this.surveyId,
    required this.quizes,
    required this.nameOfSurvey,
    this.totalScore = 0,
  });
  //Survey({require this.})//
  // 인덱스, 문제, 정답, 사용자가 선택한 답안, // 설문시간, 점수
  int surveyId;
  String nameOfSurvey;
  List<SurveyQuiz> quizes; //20문제
  int totalScore;
  DateTime? created_at;
}

class SurveyQuiz {
  SurveyQuiz(
      {required this.questionText,
      required this.userAnswer,
      required this.answers});
  // 문제, 사용자 값 int, 문항
  String questionText; // 질문
  bool userAnswer; // 유저의 답변 인덱스
  List<Answer> answers;
}

class Answer {
  // 질문, int 배점
  Answer({required this.answerScore, required this.answerText});
  String answerText;
  int answerScore;
}
