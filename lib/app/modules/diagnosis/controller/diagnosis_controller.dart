// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:base/app/modules/diagnosis/model/diagnosis_survey_model.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../model/diagnosis_mental_quiz_model.dart';

class DiagnosisController extends GetxController {
  static DiagnosisController get to => Get.find();

  // Data ▼ ============================================
  Rx<int> questionNumber = 0.obs;
  Rx<int> score = 0.obs;
  RxList<Question> mentalHealth = <Question>[
    Question(questionText: '자신의 삶에 대체로 만족하십니까?', questionAnswer: true),
    Question(questionText: '활동이나 관심거리가 많이 줄었습니까?', questionAnswer: true),
    Question(questionText: '삶이 공허하다고 느끼십니까?', questionAnswer: true),
    Question(questionText: '지루하거나 따분할 때가 많습니까?', questionAnswer: true),
  ].obs;
  //사용자가 선택하는  문제답
  // 0 이면 True , 1이면 False
  Rx<int> pickAnswer = 2.obs;
  RxList<bool> answerSheet = <bool>[].obs;
  // Function ▼ ========================================

  // * 유저가 다음 문제로 이동하는 함수
  void nextQuestion() {
    // 무조건 값을 선택해야 한다.
    if (pickAnswer.value != 2) {
      // todo 1. 현재 문제 개수보다 Number값이 크면 종료 , 아니면 현재 넘버를 증가한다.
      if (questionNumber < mentalHealth.length - 1) {
        questionNumber.value = questionNumber.value + 1;
        // todo 2.현재 입려된 값을 답안지에 넣는다.
        bool value = pickAnswer.value == 0 ? true : false;
        answerSheet.add(value);
        pickAnswer.value = 2;
      } else {
        for (int index = 0; index < mentalHealth.length; index++) {
          score.value +=
              mentalHealth[index].questionAnswer == answerSheet[index] ? 1 : 0;
        }
      }
    } else {
      return;
    }
  }

  // void getQuestionText() {
  //   return mentalHealth
  // }

  // Variable ▼ ========================================

  // 테스트가 진행중일때 True
  RxBool isTesting = true.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    Logger().d(Get.parameters['id']);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  InternalFinalCallback<void> get onStart => super.onStart;

  @override
  InternalFinalCallback<void> get onDelete => super.onDelete;
}

/**
 * 
 */
List<Survey> surveyList = [
  Survey(
      surveyId: 1,
      quizes: [
        SurveyQuiz(
          surveyId: 1,
          surveyQuizId: 1,
          questionText: '1. 자신의 삶에 대체로 만족하십니까?',
          userAnswer: 0,
          answers: [
            Answer(surveyQuizId: 1, answerScore: 1, answerText: '예'),
            Answer(surveyQuizId: 1, answerScore: 1, answerText: '아니요'),
          ],
        ),
        SurveyQuiz(
          surveyId: 1,
          surveyQuizId: 2,
          questionText: '2. 활동이나 관심거리가 많이 줄었습니까?',
          userAnswer: 0,
          answers: [
            Answer(surveyQuizId: 2, answerScore: 1, answerText: '예'),
            Answer(surveyQuizId: 2, answerScore: 1, answerText: '아니요'),
          ],
        ),
        SurveyQuiz(
          surveyId: 1,
          surveyQuizId: 3,
          questionText: '3. 삶이 공허하다고 느끼십니까?',
          userAnswer: 0,
          answers: [
            Answer(surveyQuizId: 3, answerScore: 1, answerText: '예'),
            Answer(surveyQuizId: 3, answerScore: 1, answerText: '아니요'),
          ],
        ),
        SurveyQuiz(
          surveyId: 1,
          surveyQuizId: 4,
          questionText: '4. 지루하거나 따분할 때가 많습니까?',
          userAnswer: 0,
          answers: [
            Answer(surveyQuizId: 4, answerScore: 1, answerText: '예'),
            Answer(surveyQuizId: 4, answerScore: 1, answerText: '아니요'),
          ],
        ),
        SurveyQuiz(
          surveyId: 1,
          surveyQuizId: 5,
          questionText: '5. 앞날이 희망적이라고 생각하십니까?',
          userAnswer: 0,
          answers: [
            Answer(surveyQuizId: 5, answerScore: 1, answerText: '예'),
            Answer(surveyQuizId: 5, answerScore: 1, answerText: '아니요'),
          ],
        ),
        SurveyQuiz(
          surveyId: 1,
          surveyQuizId: 6,
          questionText: '6. 떨쳐버릴 수 없는 생각들 때문에 괴롭습니까?',
          userAnswer: 0,
          answers: [
            Answer(surveyQuizId: 6, answerScore: 1, answerText: '예'),
            Answer(surveyQuizId: 6, answerScore: 1, answerText: '아니요'),
          ],
        ),
        SurveyQuiz(
          surveyId: 1,
          surveyQuizId: 7,
          questionText: '7. 대체로 활기차게 사시는 편입니까?',
          userAnswer: 0,
          answers: [
            Answer(surveyQuizId: 7, answerScore: 1, answerText: '예'),
            Answer(surveyQuizId: 7, answerScore: 1, answerText: '아니요'),
          ],
        ),
        SurveyQuiz(
          surveyId: 1,
          surveyQuizId: 8,
          questionText: '8. 자신에게 좋지 않은 일이 생길 것 같아 걱정스럽습니까?',
          userAnswer: 0,
          answers: [
            Answer(surveyQuizId: 8, answerScore: 1, answerText: '예'),
            Answer(surveyQuizId: 8, answerScore: 1, answerText: '아니요'),
          ],
        ),
        SurveyQuiz(
          surveyId: 1,
          surveyQuizId: 9,
          questionText: '9. 대체로 행복하다고 느끼십니까?',
          userAnswer: 0,
          answers: [
            Answer(surveyQuizId: 9, answerScore: 1, answerText: '예'),
            Answer(surveyQuizId: 9, answerScore: 1, answerText: '아니요'),
          ],
        ),
        SurveyQuiz(
          surveyId: 1,
          surveyQuizId: 10,
          questionText: '10. 아무 것도 할 수 없을 것 같은 무력감이 자주 듭니까?',
          userAnswer: 0,
          answers: [
            Answer(surveyQuizId: 10, answerScore: 1, answerText: '예'),
            Answer(surveyQuizId: 10, answerScore: 1, answerText: '아니요'),
          ],
        ),
      ],
      nameOfSurvey: '파킨슨 자가진단'),
  Survey(surveyId: 2, quizes: [], nameOfSurvey: '파킨슨 심리진단'),
  Survey(
      surveyId: 3,
      quizes: [
        SurveyQuiz(
          surveyId: 3,
          surveyQuizId: 301,
          questionText: '1. 자신의 삶에 대체로 만족하십니까?',
          userAnswer: 0,
          answers: [
            Answer(surveyQuizId: 301, answerScore: 1, answerText: '예'),
            Answer(surveyQuizId: 301, answerScore: 1, answerText: '아니요'),
          ],
        ),
        SurveyQuiz(
          surveyId: 3,
          surveyQuizId: 302,
          questionText: '2. 활동이나 관심거리가 많이 줄었습니까?',
          userAnswer: 0,
          answers: [
            Answer(surveyQuizId: 302, answerScore: 1, answerText: '예'),
            Answer(surveyQuizId: 302, answerScore: 1, answerText: '아니요'),
          ],
        ),
        SurveyQuiz(
          surveyId: 3,
          surveyQuizId: 303,
          questionText: '3. 삶이 공허하다고 느끼십니까?',
          userAnswer: 0,
          answers: [
            Answer(surveyQuizId: 303, answerScore: 1, answerText: '예'),
            Answer(surveyQuizId: 303, answerScore: 1, answerText: '아니요'),
          ],
        ),
        SurveyQuiz(
          surveyId: 3,
          surveyQuizId: 304,
          questionText: '4. 지루하거나 따분할 때가 많습니까?',
          userAnswer: 0,
          answers: [
            Answer(surveyQuizId: 304, answerScore: 1, answerText: '예'),
            Answer(surveyQuizId: 304, answerScore: 1, answerText: '아니요'),
          ],
        ),
        SurveyQuiz(
          surveyId: 3,
          surveyQuizId: 305,
          questionText: '5. 앞날이 희망적이라고 생각하십니까?',
          userAnswer: 0,
          answers: [
            Answer(surveyQuizId: 305, answerScore: 1, answerText: '예'),
            Answer(surveyQuizId: 305, answerScore: 1, answerText: '아니요'),
          ],
        ),
        SurveyQuiz(
          surveyId: 3,
          surveyQuizId: 306,
          questionText: '6. 떨쳐버릴 수 없는 생각들 때문에 괴롭습니까?',
          userAnswer: 0,
          answers: [
            Answer(surveyQuizId: 306, answerScore: 1, answerText: '예'),
            Answer(surveyQuizId: 306, answerScore: 1, answerText: '아니요'),
          ],
        ),
        SurveyQuiz(
          surveyId: 3,
          surveyQuizId: 307,
          questionText: '6.1. 대체로 활기차게 사시는 편입니까?',
          userAnswer: 0,
          answers: [
            Answer(surveyQuizId: 307, answerScore: 1, answerText: '예'),
            Answer(surveyQuizId: 307, answerScore: 1, answerText: '아니요'),
          ],
        ),
        SurveyQuiz(
          surveyId: 3,
          surveyQuizId: 308,
          questionText: '6.2. 자신에게 좋지 않은 일이 생길 것 같아 걱정스럽습니까?',
          userAnswer: 0,
          answers: [
            Answer(surveyQuizId: 308, answerScore: 1, answerText: '예'),
            Answer(surveyQuizId: 308, answerScore: 1, answerText: '아니요'),
          ],
        ),
        SurveyQuiz(
          surveyId: 3,
          surveyQuizId: 309,
          questionText: '6.3. 대체로 행복하다고 느끼십니까?',
          userAnswer: 0,
          answers: [
            Answer(surveyQuizId: 309, answerScore: 1, answerText: '예'),
            Answer(surveyQuizId: 309, answerScore: 1, answerText: '아니요'),
          ],
        ),
        SurveyQuiz(
          surveyId: 3,
          surveyQuizId: 310,
          questionText: '6.4. 아무 것도 할 수 없을 것 같은 무력감이 자주 듭니까?',
          userAnswer: 0,
          answers: [
            Answer(surveyQuizId: 310, answerScore: 1, answerText: '예'),
            Answer(surveyQuizId: 310, answerScore: 1, answerText: '아니요'),
          ],
        ),
      ],
      nameOfSurvey: '수면자가진단'),
];
