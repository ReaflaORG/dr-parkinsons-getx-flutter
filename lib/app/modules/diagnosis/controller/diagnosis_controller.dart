import 'dart:async';

import 'package:base/app/modules/diagnosis/model/diagnosis_survey_model.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class DiagnosisController extends GetxController {
  static DiagnosisController get to => Get.find();
  List<Survey> surveyList = [
    Survey(surveyId: 1, quizes: [], nameOfSurvey: '파킨슨 자가진단'),
    Survey(
        surveyId: 2,
        quizes: [
          SurveyQuiz(
            surveyId: 2,
            surveyQuizId: 1,
            questionText: '1. 자신의 삶에 대체로 만족하십니까?',
            answers: [
              Answer(surveyQuizId: 1, answerScore: 0, answerText: '예'),
              Answer(surveyQuizId: 1, answerScore: 1, answerText: '아니요'),
            ],
          ),
          SurveyQuiz(
            surveyId: 2,
            surveyQuizId: 2,
            questionText: '2. 활동이나 관심거리가 많이 줄었습니까?',
            answers: [
              Answer(surveyQuizId: 2, answerScore: 1, answerText: '예'),
              Answer(surveyQuizId: 2, answerScore: 0, answerText: '아니요'),
            ],
          ),
          SurveyQuiz(
            surveyId: 2,
            surveyQuizId: 3,
            questionText: '3. 삶이 공허하다고 느끼십니까?',
            answers: [
              Answer(surveyQuizId: 3, answerScore: 1, answerText: '예'),
              Answer(surveyQuizId: 3, answerScore: 0, answerText: '아니요'),
            ],
          ),
          SurveyQuiz(
            surveyId: 2,
            surveyQuizId: 4,
            questionText: '4. 지루하거나 따분할 때가 많습니까?',
            answers: [
              Answer(surveyQuizId: 4, answerScore: 1, answerText: '예'),
              Answer(surveyQuizId: 4, answerScore: 0, answerText: '아니요'),
            ],
          ),
          SurveyQuiz(
            surveyId: 2,
            surveyQuizId: 5,
            questionText: '5. 앞날이 희망적이라고 생각하십니까?',
            answers: [
              Answer(surveyQuizId: 5, answerScore: 0, answerText: '예'),
              Answer(surveyQuizId: 5, answerScore: 1, answerText: '아니요'),
            ],
          ),
          SurveyQuiz(
            surveyId: 2,
            surveyQuizId: 6,
            questionText: '6. 떨쳐버릴 수 없는 생각들 때문에 괴롭습니까?',
            answers: [
              Answer(surveyQuizId: 6, answerScore: 1, answerText: '예'),
              Answer(surveyQuizId: 6, answerScore: 0, answerText: '아니요'),
            ],
          ),
          SurveyQuiz(
            surveyId: 2,
            surveyQuizId: 7,
            questionText: '7. 대체로 활기차게 사시는 편입니까?',
            answers: [
              Answer(surveyQuizId: 7, answerScore: 0, answerText: '예'),
              Answer(surveyQuizId: 7, answerScore: 1, answerText: '아니요'),
            ],
          ),
          SurveyQuiz(
            surveyId: 2,
            surveyQuizId: 8,
            questionText: '8. 자신에게 좋지 않은 일이 생길 것 같아 걱정스럽습니까?',
            answers: [
              Answer(surveyQuizId: 8, answerScore: 1, answerText: '예'),
              Answer(surveyQuizId: 8, answerScore: 0, answerText: '아니요'),
            ],
          ),
          SurveyQuiz(
            surveyId: 2,
            surveyQuizId: 9,
            questionText: '9. 대체로 행복하다고 느끼십니까?',
            answers: [
              Answer(surveyQuizId: 9, answerScore: 0, answerText: '예'),
              Answer(surveyQuizId: 9, answerScore: 1, answerText: '아니요'),
            ],
          ),
          SurveyQuiz(
            surveyId: 2,
            surveyQuizId: 10,
            questionText: '10. 아무 것도 할 수 없을 것 같은 무력감이 자주 듭니까?',
            answers: [
              Answer(surveyQuizId: 10, answerScore: 1, answerText: '예'),
              Answer(surveyQuizId: 10, answerScore: 0, answerText: '아니요'),
            ],
          ),
          SurveyQuiz(
            surveyId: 2,
            surveyQuizId: 11,
            questionText: '11. 불안해지거나 안절부절 못 할 때가 자주 있습니까?',
            answers: [
              Answer(surveyQuizId: 11, answerScore: 1, answerText: '예'),
              Answer(surveyQuizId: 11, answerScore: 0, answerText: '아니요'),
            ],
          ),
          SurveyQuiz(
            surveyId: 2,
            surveyQuizId: 12,
            questionText: '12. 외출하는 것 보다 그냥 집안에 있는 것이 더 좋습니까?',
            answers: [
              Answer(surveyQuizId: 12, answerScore: 1, answerText: '예'),
              Answer(surveyQuizId: 12, answerScore: 0, answerText: '아니요'),
            ],
          ),
          SurveyQuiz(
            surveyId: 2,
            surveyQuizId: 13,
            questionText: '13. 앞날에 대한 걱정을 자주 하십니까?',
            answers: [
              Answer(surveyQuizId: 13, answerScore: 1, answerText: '예'),
              Answer(surveyQuizId: 13, answerScore: 0, answerText: '아니요'),
            ],
          ),
          SurveyQuiz(
            surveyId: 2,
            surveyQuizId: 14,
            questionText: '14. 다른 사람들 보다 기억력에 문제가 더 많다고 느끼십니까?',
            answers: [
              Answer(surveyQuizId: 14, answerScore: 1, answerText: '예'),
              Answer(surveyQuizId: 14, answerScore: 0, answerText: '아니요'),
            ],
          ),
          SurveyQuiz(
            surveyId: 2,
            surveyQuizId: 15,
            questionText: '15. 지금 살아있다는 사실이 정말 좋다고 느껴지십니까?',
            answers: [
              Answer(surveyQuizId: 15, answerScore: 0, answerText: '예'),
              Answer(surveyQuizId: 15, answerScore: 1, answerText: '아니요'),
            ],
          ),
          SurveyQuiz(
            surveyId: 2,
            surveyQuizId: 16,
            questionText: '16. 기분이 가라앉거나 울적할 때가 자주 있습니까?',
            answers: [
              Answer(surveyQuizId: 16, answerScore: 1, answerText: '예'),
              Answer(surveyQuizId: 16, answerScore: 0, answerText: '아니요'),
            ],
          ),
          SurveyQuiz(
            surveyId: 2,
            surveyQuizId: 17,
            questionText: '17. 요즘 자신이 아무 쓸모없는 사람처럼 느껴지십니까?',
            answers: [
              Answer(surveyQuizId: 17, answerScore: 1, answerText: '예'),
              Answer(surveyQuizId: 17, answerScore: 0, answerText: '아니요'),
            ],
          ),
          SurveyQuiz(
            surveyId: 2,
            surveyQuizId: 18,
            questionText: '18. 지난 일에 대해 걱정을 많이 하십니까?',
            answers: [
              Answer(surveyQuizId: 18, answerScore: 1, answerText: '예'),
              Answer(surveyQuizId: 18, answerScore: 0, answerText: '아니요'),
            ],
          ),
          SurveyQuiz(
            surveyId: 2,
            surveyQuizId: 19,
            questionText: '19. 산다는 것이 매우 신나고 즐겁습니까?',
            answers: [
              Answer(surveyQuizId: 19, answerScore: 0, answerText: '예'),
              Answer(surveyQuizId: 19, answerScore: 1, answerText: '아니요'),
            ],
          ),
          SurveyQuiz(
            surveyId: 2,
            surveyQuizId: 20,
            questionText: '20. 새로운 일을 시작하는 것이 어렵습니까?',
            answers: [
              Answer(surveyQuizId: 20, answerScore: 1, answerText: '예'),
              Answer(surveyQuizId: 20, answerScore: 0, answerText: '아니요'),
            ],
          ),
          SurveyQuiz(
            surveyId: 2,
            surveyQuizId: 21,
            questionText: '21. 생활의 활력이 넘치십니까?',
            answers: [
              Answer(surveyQuizId: 21, answerScore: 1, answerText: '예'),
              Answer(surveyQuizId: 21, answerScore: 0, answerText: '아니요'),
            ],
          ),
          SurveyQuiz(
            surveyId: 2,
            surveyQuizId: 22,
            questionText: '22. 자신의 처지가 절망적이라고 느끼십니까?',
            answers: [
              Answer(surveyQuizId: 22, answerScore: 1, answerText: '예'),
              Answer(surveyQuizId: 22, answerScore: 0, answerText: '아니요'),
            ],
          ),
          SurveyQuiz(
            surveyId: 2,
            surveyQuizId: 23,
            questionText: '23. 다른 사람들이 대체로 자신보다 낫다고 느끼십니까?',
            answers: [
              Answer(surveyQuizId: 23, answerScore: 1, answerText: '예'),
              Answer(surveyQuizId: 23, answerScore: 0, answerText: '아니요'),
            ],
          ),
          SurveyQuiz(
            surveyId: 2,
            surveyQuizId: 24,
            questionText: '24. 사소한 일에도 속상할 때가 많습니까?',
            answers: [
              Answer(surveyQuizId: 24, answerScore: 1, answerText: '예'),
              Answer(surveyQuizId: 24, answerScore: 0, answerText: '아니요'),
            ],
          ),
          SurveyQuiz(
            surveyId: 2,
            surveyQuizId: 25,
            questionText: '25. 울고 싶을 때가 자주 있습니까?',
            answers: [
              Answer(surveyQuizId: 25, answerScore: 1, answerText: '예'),
              Answer(surveyQuizId: 25, answerScore: 0, answerText: '아니요'),
            ],
          ),
          SurveyQuiz(
            surveyId: 2,
            surveyQuizId: 26,
            questionText: '26. 집중하기가 어렵습니까?',
            answers: [
              Answer(surveyQuizId: 26, answerScore: 1, answerText: '예'),
              Answer(surveyQuizId: 26, answerScore: 0, answerText: '아니요'),
            ],
          ),
          SurveyQuiz(
            surveyId: 2,
            surveyQuizId: 27,
            questionText: '27. 아침에 기분 좋게 일어나십니까?',
            answers: [
              Answer(surveyQuizId: 27, answerScore: 0, answerText: '예'),
              Answer(surveyQuizId: 27, answerScore: 1, answerText: '아니요'),
            ],
          ),
          SurveyQuiz(
            surveyId: 2,
            surveyQuizId: 28,
            questionText: '28. 사람들과 어울리는 자리를 피하는 편이십니까?',
            answers: [
              Answer(surveyQuizId: 28, answerScore: 1, answerText: '예'),
              Answer(surveyQuizId: 28, answerScore: 0, answerText: '아니요'),
            ],
          ),
          SurveyQuiz(
            surveyId: 2,
            surveyQuizId: 29,
            questionText: '29. 쉽게 결정하는 편이십니까?',
            answers: [
              Answer(surveyQuizId: 29, answerScore: 0, answerText: '예'),
              Answer(surveyQuizId: 29, answerScore: 1, answerText: '아니요'),
            ],
          ),
          SurveyQuiz(
            surveyId: 2,
            surveyQuizId: 30,
            questionText: '30. 예전처럼 정신이 맑습니까?',
            answers: [
              Answer(surveyQuizId: 30, answerScore: 0, answerText: '예'),
              Answer(surveyQuizId: 30, answerScore: 1, answerText: '아니요'),
            ],
          ),
        ],
        nameOfSurvey: '파킨슨 심리진단'),
    Survey(
        surveyId: 3,
        quizes: [
          SurveyQuiz(
            surveyId: 3,
            surveyQuizId: 301,
            questionText: '1. 때때로 매우 생생한 꿈을 꾼다.',
            answers: [
              Answer(surveyQuizId: 301, answerScore: 1, answerText: '예'),
              Answer(surveyQuizId: 301, answerScore: 0, answerText: '아니요'),
            ],
          ),
          SurveyQuiz(
            surveyId: 3,
            surveyQuizId: 302,
            questionText: '2. 꿈이 공격적이거나 움직임이 많은 내용일 때가 많다.',
            answers: [
              Answer(surveyQuizId: 302, answerScore: 1, answerText: '예'),
              Answer(surveyQuizId: 302, answerScore: 0, answerText: '아니요'),
            ],
          ),
          SurveyQuiz(
            surveyId: 3,
            surveyQuizId: 303,
            questionText: '3. 꿈의 내용을 그대로 행동으로 옮긴다.',
            answers: [
              Answer(surveyQuizId: 303, answerScore: 1, answerText: '예'),
              Answer(surveyQuizId: 303, answerScore: 0, answerText: '아니요'),
            ],
          ),
          SurveyQuiz(
            surveyId: 3,
            surveyQuizId: 304,
            questionText: '4. 잘 때, 내 팔이나 발이 움직이는 것을 느낀다.',
            answers: [
              Answer(surveyQuizId: 304, answerScore: 1, answerText: '예'),
              Answer(surveyQuizId: 304, answerScore: 0, answerText: '아니요'),
            ],
          ),
          SurveyQuiz(
            surveyId: 3,
            surveyQuizId: 305,
            questionText: '5. 수면 중 행동 때문에 같이 자는 배우자나 내 자신이 다친 일이 있다.',
            answers: [
              Answer(surveyQuizId: 305, answerScore: 1, answerText: '예'),
              Answer(surveyQuizId: 305, answerScore: 0, answerText: '아니요'),
            ],
          ),
          SurveyQuiz(
            surveyId: 3,
            surveyQuizId: 306,
            questionText: '6. 꿈을 꿀 때 아래의 일이 발생한다.',
            answers: [
              Answer(surveyQuizId: 306, answerScore: 1, answerText: '예'),
              Answer(surveyQuizId: 306, answerScore: 0, answerText: '아니요'),
            ],
          ),
          SurveyQuiz(
            surveyId: 3,
            surveyQuizId: 307,
            questionText: '6.1. 말하거나 소리를 지르거나 욕하거나 크게 웃는 일',
            answers: [
              Answer(surveyQuizId: 307, answerScore: 1, answerText: '예'),
              Answer(surveyQuizId: 307, answerScore: 0, answerText: '아니요'),
            ],
          ),
          SurveyQuiz(
            surveyId: 3,
            surveyQuizId: 308,
            questionText: '6.2. “싸우듯이” 갑자기 팔과 다리를 움직이는 일',
            answers: [
              Answer(surveyQuizId: 308, answerScore: 1, answerText: '예'),
              Answer(surveyQuizId: 308, answerScore: 0, answerText: '아니요'),
            ],
          ),
          SurveyQuiz(
            surveyId: 3,
            surveyQuizId: 309,
            questionText:
                '6.3. 자는 동안에는 필요 없는 몸짓이나 행동(예: 손 흔들기, 인사하기, 벌레 쫓는 행동, 침대에서 떨어지는 일)',
            answers: [
              Answer(surveyQuizId: 309, answerScore: 1, answerText: '예'),
              Answer(surveyQuizId: 309, answerScore: 0, answerText: '아니요'),
            ],
          ),
          SurveyQuiz(
            surveyId: 3,
            surveyQuizId: 310,
            questionText: '6.4. 침대 주변에 물건(예:침대 전등, 책, 안경)이 떨어져 있는 일',
            answers: [
              Answer(surveyQuizId: 310, answerScore: 1, answerText: '예'),
              Answer(surveyQuizId: 310, answerScore: 0, answerText: '아니요'),
            ],
          ),
          SurveyQuiz(
            surveyId: 3,
            surveyQuizId: 311,
            questionText: '7. 침대 주변에 물건(예:침대 전등, 책, 안경)이 떨어져 있는 일',
            answers: [
              Answer(surveyQuizId: 311, answerScore: 1, answerText: '예'),
              Answer(surveyQuizId: 311, answerScore: 0, answerText: '아니요'),
            ],
          ),
          SurveyQuiz(
            surveyId: 3,
            surveyQuizId: 312,
            questionText: '8. 잠에서 깼을 때, 대부분 꿈의 내용을 잘 기억한다.',
            answers: [
              Answer(surveyQuizId: 312, answerScore: 1, answerText: '예'),
              Answer(surveyQuizId: 312, answerScore: 0, answerText: '아니요'),
            ],
          ),
          SurveyQuiz(
            surveyId: 3,
            surveyQuizId: 313,
            questionText: '9. 잠을 설칠 때가 자주 있다.',
            answers: [
              Answer(surveyQuizId: 313, answerScore: 1, answerText: '예'),
              Answer(surveyQuizId: 313, answerScore: 0, answerText: '아니요'),
            ],
          ),
          SurveyQuiz(
            surveyId: 3,
            surveyQuizId: 314,
            questionText:
                '10. 신경계 질환을 가진적이 있다.(예: 뇌졸중, 머리 타박상, 파킨슨병, 하지불안증후군, 기면병, 우울증, 간질, 뇌의 염증성 질환 등이 있다면 어떤질환인지 구체적으로 기술해 주십시오.',
            answers: [
              Answer(surveyQuizId: 314, answerScore: 1, answerText: '예'),
              Answer(surveyQuizId: 314, answerScore: 0, answerText: '아니요'),
            ],
          ),
        ],
        nameOfSurvey: '수면자가진단'),
  ];

  // Data ▼ ============================================
  Rx<int> questionNumber = 0.obs;
  Rx<int> score = 0.obs;
  Rx<bool> isFinish = false.obs;
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
    if (questionNumber.value >= survey.value.quizes.length - 1) {
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

  // * 유저가 문제의 답을 선택했을 경우
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
    Logger().d(surveyList[findIndex].toJson());
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
