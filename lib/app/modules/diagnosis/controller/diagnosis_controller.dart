import 'dart:async';

import 'package:base/app/modules/diagnosis/model/diagnosis_survey_model.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class DiagnosisController extends GetxController {
  static DiagnosisController get to => Get.find();

  // Data ▼ ============================================
  Rx<int> questionNumber = 0.obs;
  Rx<int> score = 0.obs;
  Rx<bool> isFinish = true.obs;
  //백엔드가 올때까지 값을 모르므로 late
  late Rx<Survey> survey;
  //사용자가 선택하는  문제답
  // 0 이면 True , 1이면 False

  // Function ▼ ========================================

  // * 유저가 다음 문제로 이동하는 함수
  void nextQuestion() {
    //! questionNumber.value => 현재 문제 번호
    //! survey.value.quizes[questionNumber.value].userAnswer => 현재 문제에 유저가 답을 작성했는지 : 안했으면 999 , 했으면 0,1
    // 유저가 문제에 대한 답을 선택하지 않았을 경우 디폴트값이 0 이므로 아무 액션 안함
    if (survey.value.quizes[questionNumber.value].userAnswer == 999) return;
    // 현재 문제 번호가 문제 전체 개수보다 크거나 같으면 종료 [ 스코어 점수 계산 ]
    if (questionNumber.value >= survey.value.quizes.length) {
      // 반목문으로 quzie에 저장된 유저 답을 기반으로 계산
      for (int i = 0; i < survey.value.quizes.length; i++) {
        score.value += survey
            .value
            .quizes[i]
            .answers[survey.value.quizes[questionNumber.value].userAnswer]
            .answerScore;
      }
      isFinish.value = true;
    } else {
      // 다음 문제로 이동
      questionNumber.value += 1;
    }
  }

  // * 유저가 이전 버튼을 클릭햇을 경우
  void prevQuestion() {
    // 첫문제때는 아무것도 안함.
    if (questionNumber.value == 0) return;
    // 이전 문제로 이동
    questionNumber.value -= 1;
  }

  // * 유저가 문제의 질문을 선택했을 경우
  void handlePickUserAnswer(int value) {
    survey.value.quizes[questionNumber.value].userAnswer = value;
    survey.refresh();
  }

  // void getQuestionText() {
  //   return mentalHealth
  // }

  // Variable ▼ ========================================

  // 테스트가 진행중일때 True
  // RxBool isTesting = true.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    Logger().d(Get.parameters['id']);
    // get parameter로 들어오는 서베이 아이디 값을 기준으로 서베이를 초기화
    int findIndex = surveyList.indexWhere((element) =>
        element.surveyId ==
        int.parse(Get.parameters['id']!)); // 있으면 index, 없으면 -1
    if (findIndex == -1) Get.back();
    survey = surveyList[findIndex].obs;
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
          answers: [
            Answer(surveyQuizId: 1, answerScore: 1, answerText: '예'),
            Answer(surveyQuizId: 1, answerScore: 1, answerText: '아니요'),
          ],
        ),
        SurveyQuiz(
          surveyId: 1,
          surveyQuizId: 2,
          questionText: '2. 활동이나 관심거리가 많이 줄었습니까?',
          answers: [
            Answer(surveyQuizId: 2, answerScore: 1, answerText: '예'),
            Answer(surveyQuizId: 2, answerScore: 1, answerText: '아니요'),
          ],
        ),
        SurveyQuiz(
          surveyId: 1,
          surveyQuizId: 3,
          questionText: '3. 삶이 공허하다고 느끼십니까?',
          answers: [
            Answer(surveyQuizId: 3, answerScore: 1, answerText: '예'),
            Answer(surveyQuizId: 3, answerScore: 1, answerText: '아니요'),
          ],
        ),
        SurveyQuiz(
          surveyId: 1,
          surveyQuizId: 4,
          questionText: '4. 지루하거나 따분할 때가 많습니까?',
          answers: [
            Answer(surveyQuizId: 4, answerScore: 1, answerText: '예'),
            Answer(surveyQuizId: 4, answerScore: 1, answerText: '아니요'),
          ],
        ),
        SurveyQuiz(
          surveyId: 1,
          surveyQuizId: 5,
          questionText: '5. 앞날이 희망적이라고 생각하십니까?',
          answers: [
            Answer(surveyQuizId: 5, answerScore: 1, answerText: '예'),
            Answer(surveyQuizId: 5, answerScore: 1, answerText: '아니요'),
          ],
        ),
        SurveyQuiz(
          surveyId: 1,
          surveyQuizId: 6,
          questionText: '6. 떨쳐버릴 수 없는 생각들 때문에 괴롭습니까?',
          answers: [
            Answer(surveyQuizId: 6, answerScore: 1, answerText: '예'),
            Answer(surveyQuizId: 6, answerScore: 1, answerText: '아니요'),
          ],
        ),
        SurveyQuiz(
          surveyId: 1,
          surveyQuizId: 7,
          questionText: '7. 대체로 활기차게 사시는 편입니까?',
          answers: [
            Answer(surveyQuizId: 7, answerScore: 1, answerText: '예'),
            Answer(surveyQuizId: 7, answerScore: 1, answerText: '아니요'),
          ],
        ),
        SurveyQuiz(
          surveyId: 1,
          surveyQuizId: 8,
          questionText: '8. 자신에게 좋지 않은 일이 생길 것 같아 걱정스럽습니까?',
          answers: [
            Answer(surveyQuizId: 8, answerScore: 1, answerText: '예'),
            Answer(surveyQuizId: 8, answerScore: 1, answerText: '아니요'),
          ],
        ),
        SurveyQuiz(
          surveyId: 1,
          surveyQuizId: 9,
          questionText: '9. 대체로 행복하다고 느끼십니까?',
          answers: [
            Answer(surveyQuizId: 9, answerScore: 1, answerText: '예'),
            Answer(surveyQuizId: 9, answerScore: 1, answerText: '아니요'),
          ],
        ),
        SurveyQuiz(
          surveyId: 1,
          surveyQuizId: 10,
          questionText: '10. 아무 것도 할 수 없을 것 같은 무력감이 자주 듭니까?',
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
          answers: [
            Answer(surveyQuizId: 301, answerScore: 1, answerText: '예'),
            Answer(surveyQuizId: 301, answerScore: 1, answerText: '아니요'),
          ],
        ),
        SurveyQuiz(
          surveyId: 3,
          surveyQuizId: 302,
          questionText: '2. 활동이나 관심거리가 많이 줄었습니까?',
          answers: [
            Answer(surveyQuizId: 302, answerScore: 1, answerText: '예'),
            Answer(surveyQuizId: 302, answerScore: 1, answerText: '아니요'),
          ],
        ),
        SurveyQuiz(
          surveyId: 3,
          surveyQuizId: 303,
          questionText: '3. 삶이 공허하다고 느끼십니까?',
          answers: [
            Answer(surveyQuizId: 303, answerScore: 1, answerText: '예'),
            Answer(surveyQuizId: 303, answerScore: 1, answerText: '아니요'),
          ],
        ),
        SurveyQuiz(
          surveyId: 3,
          surveyQuizId: 304,
          questionText: '4. 지루하거나 따분할 때가 많습니까?',
          answers: [
            Answer(surveyQuizId: 304, answerScore: 1, answerText: '예'),
            Answer(surveyQuizId: 304, answerScore: 1, answerText: '아니요'),
          ],
        ),
        SurveyQuiz(
          surveyId: 3,
          surveyQuizId: 305,
          questionText: '5. 앞날이 희망적이라고 생각하십니까?',
          answers: [
            Answer(surveyQuizId: 305, answerScore: 1, answerText: '예'),
            Answer(surveyQuizId: 305, answerScore: 1, answerText: '아니요'),
          ],
        ),
        SurveyQuiz(
          surveyId: 3,
          surveyQuizId: 306,
          questionText: '6. 떨쳐버릴 수 없는 생각들 때문에 괴롭습니까?',
          answers: [
            Answer(surveyQuizId: 306, answerScore: 1, answerText: '예'),
            Answer(surveyQuizId: 306, answerScore: 1, answerText: '아니요'),
          ],
        ),
        SurveyQuiz(
          surveyId: 3,
          surveyQuizId: 307,
          questionText: '6.1. 대체로 활기차게 사시는 편입니까?',
          answers: [
            Answer(surveyQuizId: 307, answerScore: 1, answerText: '예'),
            Answer(surveyQuizId: 307, answerScore: 1, answerText: '아니요'),
          ],
        ),
        SurveyQuiz(
          surveyId: 3,
          surveyQuizId: 308,
          questionText: '6.2. 자신에게 좋지 않은 일이 생길 것 같아 걱정스럽습니까?',
          answers: [
            Answer(surveyQuizId: 308, answerScore: 1, answerText: '예'),
            Answer(surveyQuizId: 308, answerScore: 1, answerText: '아니요'),
          ],
        ),
        SurveyQuiz(
          surveyId: 3,
          surveyQuizId: 309,
          questionText: '6.3. 대체로 행복하다고 느끼십니까?',
          answers: [
            Answer(surveyQuizId: 309, answerScore: 1, answerText: '예'),
            Answer(surveyQuizId: 309, answerScore: 1, answerText: '아니요'),
          ],
        ),
        SurveyQuiz(
          surveyId: 3,
          surveyQuizId: 310,
          questionText: '6.4. 아무 것도 할 수 없을 것 같은 무력감이 자주 듭니까?',
          answers: [
            Answer(surveyQuizId: 310, answerScore: 1, answerText: '예'),
            Answer(surveyQuizId: 310, answerScore: 1, answerText: '아니요'),
          ],
        ),
      ],
      nameOfSurvey: '수면자가진단'),
];
