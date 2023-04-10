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

  List<SurveyQuizModel> quizes; //20문제

  Map<String, dynamic> toJson() {
    return {
      'surveyId': surveyId,
      'nameOfSurvey': nameOfSurvey,
      'quizes': quizes.map((e) => e.toJson()),
    };
  }
}

/// 설문 모델
///
/// [surveyId] int : 설문의 인덱스
///
/// [surveyQuizId] int : 문제의 인덱스
///
/// [questionText] String : 문제의 내용
///
/// [userAnswer] int : 유저가 선택한 답안의 인덱스
///
/// [isPass] bool : 문제의 통과 여부
///
/// [answers] List<AnswerModel> : 문제의 선택지
class SurveyQuizModel {
  SurveyQuizModel({
    required this.surveyId,
    required this.surveyQuizId,
    this.isPass = false,
    required this.questionText,
    this.questionSubText,
    this.userAnswer = 999,
    required this.answers,
  });

  int surveyId;
  int surveyQuizId;
  String questionText;
  String? questionSubText;
  bool isPass;
  int userAnswer;
  List<AnswerModel> answers;

  Map<String, dynamic> toJson() {
    return {
      'surveyId': surveyId,
      'surveyQuizId': surveyQuizId,
      'questionText': questionText,
      'questionSubText': questionSubText,
      'userAnswer': userAnswer,
      'answers': answers.map(
        (e) => e.toJson(),
      ),
    };
  }
}

/// 선택지 모델
///
/// [surveyQuizId] int : 문제의 인덱스
///
/// [answerText] String : 선택지의 내용
///
/// [answerScore] int : 선택지의 점수
class AnswerModel {
  AnswerModel({
    required this.surveyQuizId,
    required this.answerScore,
    required this.answerText,
  });

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
