class UserSurvey {
  // 어떤 유저가, 어떤 서베이를, 언제, 몇점을 받았는지
  UserSurvey(
      {required this.userId,
      required this.surveyId,
      this.totalScore = 0,
      required this.createdAt});
  int userId;
  int surveyId;
  int totalScore;
  DateTime? createdAt;
}

class Survey {
  Survey({
    required this.surveyId,
    required this.quizes,
    required this.nameOfSurvey,
  });
  //Survey({require this.})//
  // 인덱스, 문제, 정답, 사용자가 선택한 답안, // 설문시간, 점수
  int surveyId;
  String nameOfSurvey;

  List<SurveyQuiz> quizes; //20문제

  Map<String, dynamic> toJson() {
    return {
      'surveyId': surveyId,
      'nameOfSurvey': nameOfSurvey,
      'quizes': quizes.map((e) => e.toJson()),
    };
  }
}

class SurveyQuiz {
  SurveyQuiz(
      {required this.surveyId,
      required this.surveyQuizId,
      required this.questionText,
      this.userAnswer = 999,
      required this.answers});
  // 문제, 사용자 값 int, 문항
  int surveyId;
  int surveyQuizId;
  String questionText; // 질문
  int userAnswer; // 유저의 답변 인덱스
  List<Answer> answers;

  Map<String, dynamic> toJson() {
    return {
      'surveyId': surveyId,
      'surveyQuizId': surveyQuizId,
      'questionText': questionText,
      'userAnswer': userAnswer,
      'answers': answers.map((e) => e.toJson()),
    };
  }
}

class Answer {
  // 질문, int 배점
  Answer(
      {required this.surveyQuizId,
      required this.answerScore,
      required this.answerText});
  int surveyQuizId;
  String answerText;
  int answerScore;

  Map<String, dynamic> toJson() {
    return {
      'surveyQuizId': surveyQuizId,
      'answerText': answerText,
      'answerScore': answerScore,
    };
  }
}
