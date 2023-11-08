import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../models/diagnosis_survey_model.dart';
import '../../../service/auth_service.dart';
import '../../../theme/color_path.dart';
import '../../../theme/text_path.dart';

class DiagnosisController extends GetxController {
  static DiagnosisController get to => Get.find();

  /// Data ▼

  dynamic params = Get.parameters['id'];

  /// 설문 데이터
  List<Survey> surveyList = [
    Survey(
      surveyId: 1,
      quizes: [
        SurveyQuizModel(
          surveyId: 1,
          surveyQuizId: 1,
          questionText: '입술, 턱, 손, 팔, 또는 다리가 가만히 있을 때 떨립니까?',
          answers: [
            AnswerModel(surveyQuizId: 1, answerScore: 1, answerText: '예'),
            AnswerModel(surveyQuizId: 1, answerScore: 0, answerText: '아니요'),
          ],
        ),
        SurveyQuizModel(
          surveyId: 1,
          surveyQuizId: 2,
          questionText: '걸을 때 발을 끌거나 걸음의 폭이 좁아졌습니까?',
          answers: [
            AnswerModel(surveyQuizId: 1, answerScore: 1, answerText: '예'),
            AnswerModel(surveyQuizId: 1, answerScore: 0, answerText: '아니요'),
          ],
        ),
        SurveyQuizModel(
          surveyId: 1,
          surveyQuizId: 3,
          questionText: '평소 일상 활동에서 움직임이 느려졌습니까? (예: 머리 빗기, 양말 신기, 목욕, 식사 등)',
          answers: [
            AnswerModel(surveyQuizId: 1, answerScore: 1, answerText: '예'),
            AnswerModel(surveyQuizId: 1, answerScore: 0, answerText: '아니요'),
          ],
        ),
        SurveyQuizModel(
          surveyId: 1,
          surveyQuizId: 4,
          questionText: '스스로 혹은 다른 사람들이 보기에 걸을 때 팔을 잘 흔들지 않습니까?',
          answers: [
            AnswerModel(surveyQuizId: 1, answerScore: 1, answerText: '예'),
            AnswerModel(surveyQuizId: 1, answerScore: 0, answerText: '아니요'),
          ],
        ),
        SurveyQuizModel(
          surveyId: 1,
          surveyQuizId: 5,
          questionText: '목소리가 작아졌습니까?',
          answers: [
            AnswerModel(surveyQuizId: 1, answerScore: 1, answerText: '예'),
            AnswerModel(surveyQuizId: 1, answerScore: 0, answerText: '아니요'),
          ],
        ),
        SurveyQuizModel(
          surveyId: 1,
          surveyQuizId: 6,
          questionText: '얼굴이 무표정 해졌습니까?',
          answers: [
            AnswerModel(surveyQuizId: 1, answerScore: 1, answerText: '예'),
            AnswerModel(surveyQuizId: 1, answerScore: 0, answerText: '아니요'),
          ],
        ),
        SurveyQuizModel(
          surveyId: 1,
          surveyQuizId: 7,
          questionText: '전보다 냄새를 잘 못 맡습니까?',
          answers: [
            AnswerModel(surveyQuizId: 1, answerScore: 1, answerText: '예'),
            AnswerModel(surveyQuizId: 1, answerScore: 0, answerText: '아니요'),
          ],
        ),
        SurveyQuizModel(
          surveyId: 1,
          surveyQuizId: 8,
          questionText: '꿈을 꿀 때 말하거나 소리를 지르거나 욕하거나 크게 웃는 일이 발생합니까?',
          answers: [
            AnswerModel(surveyQuizId: 1, answerScore: 1, answerText: '예'),
            AnswerModel(surveyQuizId: 1, answerScore: 0, answerText: '아니요'),
          ],
        ),
        SurveyQuizModel(
          surveyId: 1,
          surveyQuizId: 9,
          questionText: '걷기 시작하거나 방향을 바꿀 때 발이 바닥에 붙은 것같이 잘 안떨어진 적이 있습니까?',
          answers: [
            AnswerModel(surveyQuizId: 1, answerScore: 1, answerText: '예'),
            AnswerModel(surveyQuizId: 1, answerScore: 0, answerText: '아니요'),
          ],
        ),
      ],
      nameOfSurvey: '파킨슨 자가진단',
    ),
    Survey(
      surveyId: 2,
      quizes: [
        SurveyQuizModel(
          surveyId: 2,
          surveyQuizId: 1,
          questionText: '자신의 삶에 대체로 만족하십니까?',
          answers: [
            AnswerModel(surveyQuizId: 1, answerScore: 0, answerText: '예'),
            AnswerModel(surveyQuizId: 1, answerScore: 1, answerText: '아니요'),
          ],
        ),
        SurveyQuizModel(
          surveyId: 2,
          surveyQuizId: 2,
          questionText: '활동이나 관심거리가 많이 줄었습니까?',
          answers: [
            AnswerModel(surveyQuizId: 2, answerScore: 1, answerText: '예'),
            AnswerModel(surveyQuizId: 2, answerScore: 0, answerText: '아니요'),
          ],
        ),
        SurveyQuizModel(
          surveyId: 2,
          surveyQuizId: 3,
          questionText: '삶이 공허하다고 느끼십니까?',
          answers: [
            AnswerModel(surveyQuizId: 3, answerScore: 1, answerText: '예'),
            AnswerModel(surveyQuizId: 3, answerScore: 0, answerText: '아니요'),
          ],
        ),
        SurveyQuizModel(
          surveyId: 2,
          surveyQuizId: 4,
          questionText: '지루하거나 따분할 때가 많습니까?',
          answers: [
            AnswerModel(surveyQuizId: 4, answerScore: 1, answerText: '예'),
            AnswerModel(surveyQuizId: 4, answerScore: 0, answerText: '아니요'),
          ],
        ),
        SurveyQuizModel(
          surveyId: 2,
          surveyQuizId: 5,
          questionText: '앞날이 희망적이라고 생각하십니까?',
          answers: [
            AnswerModel(surveyQuizId: 5, answerScore: 0, answerText: '예'),
            AnswerModel(surveyQuizId: 5, answerScore: 1, answerText: '아니요'),
          ],
        ),
        SurveyQuizModel(
          surveyId: 2,
          surveyQuizId: 6,
          questionText: '떨쳐버릴 수 없는 생각들 때문에 괴롭습니까?',
          answers: [
            AnswerModel(surveyQuizId: 6, answerScore: 1, answerText: '예'),
            AnswerModel(surveyQuizId: 6, answerScore: 0, answerText: '아니요'),
          ],
        ),
        SurveyQuizModel(
          surveyId: 2,
          surveyQuizId: 7,
          questionText: '대체로 활기차게 사시는 편입니까?',
          answers: [
            AnswerModel(surveyQuizId: 7, answerScore: 0, answerText: '예'),
            AnswerModel(surveyQuizId: 7, answerScore: 1, answerText: '아니요'),
          ],
        ),
        SurveyQuizModel(
          surveyId: 2,
          surveyQuizId: 8,
          questionText: '자신에게 좋지 않은 일이 생길 것 같아 걱정스럽습니까?',
          answers: [
            AnswerModel(surveyQuizId: 8, answerScore: 1, answerText: '예'),
            AnswerModel(surveyQuizId: 8, answerScore: 0, answerText: '아니요'),
          ],
        ),
        SurveyQuizModel(
          surveyId: 2,
          surveyQuizId: 9,
          questionText: '대체로 행복하다고 느끼십니까?',
          answers: [
            AnswerModel(surveyQuizId: 9, answerScore: 0, answerText: '예'),
            AnswerModel(surveyQuizId: 9, answerScore: 1, answerText: '아니요'),
          ],
        ),
        SurveyQuizModel(
          surveyId: 2,
          surveyQuizId: 10,
          questionText: '아무것도 할 수 없을 것 같은 무력감이 자주 듭니까?',
          answers: [
            AnswerModel(surveyQuizId: 10, answerScore: 1, answerText: '예'),
            AnswerModel(surveyQuizId: 10, answerScore: 0, answerText: '아니요'),
          ],
        ),
        SurveyQuizModel(
          surveyId: 2,
          surveyQuizId: 11,
          questionText: '불안해지거나 안절부절 못 할 때가 자주 있습니까?',
          answers: [
            AnswerModel(surveyQuizId: 11, answerScore: 1, answerText: '예'),
            AnswerModel(surveyQuizId: 11, answerScore: 0, answerText: '아니요'),
          ],
        ),
        SurveyQuizModel(
          surveyId: 2,
          surveyQuizId: 12,
          questionText: '외출하는 것 보다 그냥 집안에 있는 것이 더 좋습니까?',
          answers: [
            AnswerModel(surveyQuizId: 12, answerScore: 1, answerText: '예'),
            AnswerModel(surveyQuizId: 12, answerScore: 0, answerText: '아니요'),
          ],
        ),
        SurveyQuizModel(
          surveyId: 2,
          surveyQuizId: 13,
          questionText: '앞날에 대한 걱정을 자주 하십니까?',
          answers: [
            AnswerModel(surveyQuizId: 13, answerScore: 1, answerText: '예'),
            AnswerModel(surveyQuizId: 13, answerScore: 0, answerText: '아니요'),
          ],
        ),
        SurveyQuizModel(
          surveyId: 2,
          surveyQuizId: 14,
          questionText: '다른 사람들 보다 기억력에 문제가 더 많다고 느끼십니까?',
          answers: [
            AnswerModel(surveyQuizId: 14, answerScore: 1, answerText: '예'),
            AnswerModel(surveyQuizId: 14, answerScore: 0, answerText: '아니요'),
          ],
        ),
        SurveyQuizModel(
          surveyId: 2,
          surveyQuizId: 15,
          questionText: '지금 살아있다는 사실이 정말 좋다고 느껴지십니까?',
          answers: [
            AnswerModel(surveyQuizId: 15, answerScore: 0, answerText: '예'),
            AnswerModel(surveyQuizId: 15, answerScore: 1, answerText: '아니요'),
          ],
        ),
        SurveyQuizModel(
          surveyId: 2,
          surveyQuizId: 16,
          questionText: '기분이 가라앉거나 울적할 때가 자주 있습니까?',
          answers: [
            AnswerModel(surveyQuizId: 16, answerScore: 1, answerText: '예'),
            AnswerModel(surveyQuizId: 16, answerScore: 0, answerText: '아니요'),
          ],
        ),
        SurveyQuizModel(
          surveyId: 2,
          surveyQuizId: 17,
          questionText: '요즘 자신이 아무 쓸모없는 사람처럼 느껴지십니까?',
          answers: [
            AnswerModel(surveyQuizId: 17, answerScore: 1, answerText: '예'),
            AnswerModel(surveyQuizId: 17, answerScore: 0, answerText: '아니요'),
          ],
        ),
        SurveyQuizModel(
          surveyId: 2,
          surveyQuizId: 18,
          questionText: '지난 일에 대해 걱정을 많이 하십니까?',
          answers: [
            AnswerModel(surveyQuizId: 18, answerScore: 1, answerText: '예'),
            AnswerModel(surveyQuizId: 18, answerScore: 0, answerText: '아니요'),
          ],
        ),
        SurveyQuizModel(
          surveyId: 2,
          surveyQuizId: 19,
          questionText: '산다는 것이 매우 신나고 즐겁습니까?',
          answers: [
            AnswerModel(surveyQuizId: 19, answerScore: 0, answerText: '예'),
            AnswerModel(surveyQuizId: 19, answerScore: 1, answerText: '아니요'),
          ],
        ),
        SurveyQuizModel(
          surveyId: 2,
          surveyQuizId: 20,
          questionText: '새로운 일을 시작하는 것이 어렵습니까?',
          answers: [
            AnswerModel(surveyQuizId: 20, answerScore: 1, answerText: '예'),
            AnswerModel(surveyQuizId: 20, answerScore: 0, answerText: '아니요'),
          ],
        ),
        SurveyQuizModel(
          surveyId: 2,
          surveyQuizId: 21,
          questionText: '생활의 활력이 넘치십니까?',
          answers: [
            AnswerModel(surveyQuizId: 21, answerScore: 0, answerText: '예'),
            AnswerModel(surveyQuizId: 21, answerScore: 1, answerText: '아니요'),
          ],
        ),
        SurveyQuizModel(
          surveyId: 2,
          surveyQuizId: 22,
          questionText: '자신의 처지가 절망적이라고 느끼십니까?',
          answers: [
            AnswerModel(surveyQuizId: 22, answerScore: 1, answerText: '예'),
            AnswerModel(surveyQuizId: 22, answerScore: 0, answerText: '아니요'),
          ],
        ),
        SurveyQuizModel(
          surveyId: 2,
          surveyQuizId: 23,
          questionText: '다른 사람들이 대체로 자신보다 낫다고 느끼십니까?',
          answers: [
            AnswerModel(surveyQuizId: 23, answerScore: 1, answerText: '예'),
            AnswerModel(surveyQuizId: 23, answerScore: 0, answerText: '아니요'),
          ],
        ),
        SurveyQuizModel(
          surveyId: 2,
          surveyQuizId: 24,
          questionText: '사소한 일에도 속상할 때가 많습니까?',
          answers: [
            AnswerModel(surveyQuizId: 24, answerScore: 1, answerText: '예'),
            AnswerModel(surveyQuizId: 24, answerScore: 0, answerText: '아니요'),
          ],
        ),
        SurveyQuizModel(
          surveyId: 2,
          surveyQuizId: 25,
          questionText: '울고 싶을 때가 자주 있습니까?',
          answers: [
            AnswerModel(surveyQuizId: 25, answerScore: 1, answerText: '예'),
            AnswerModel(surveyQuizId: 25, answerScore: 0, answerText: '아니요'),
          ],
        ),
        SurveyQuizModel(
          surveyId: 2,
          surveyQuizId: 26,
          questionText: '집중하기가 어렵습니까?',
          answers: [
            AnswerModel(surveyQuizId: 26, answerScore: 1, answerText: '예'),
            AnswerModel(surveyQuizId: 26, answerScore: 0, answerText: '아니요'),
          ],
        ),
        SurveyQuizModel(
          surveyId: 2,
          surveyQuizId: 27,
          questionText: '아침에 기분 좋게 일어나십니까?',
          answers: [
            AnswerModel(surveyQuizId: 27, answerScore: 0, answerText: '예'),
            AnswerModel(surveyQuizId: 27, answerScore: 1, answerText: '아니요'),
          ],
        ),
        SurveyQuizModel(
          surveyId: 2,
          surveyQuizId: 28,
          questionText: '사람들과 어울리는 자리를 피하는 편이십니까?',
          answers: [
            AnswerModel(surveyQuizId: 28, answerScore: 1, answerText: '예'),
            AnswerModel(surveyQuizId: 28, answerScore: 0, answerText: '아니요'),
          ],
        ),
        SurveyQuizModel(
          surveyId: 2,
          surveyQuizId: 29,
          questionText: '쉽게 결정하는 편이십니까?',
          answers: [
            AnswerModel(surveyQuizId: 29, answerScore: 0, answerText: '예'),
            AnswerModel(surveyQuizId: 29, answerScore: 1, answerText: '아니요'),
          ],
        ),
        SurveyQuizModel(
          surveyId: 2,
          surveyQuizId: 30,
          questionText: '예전처럼 정신이 맑습니까?',
          answers: [
            AnswerModel(surveyQuizId: 30, answerScore: 0, answerText: '예'),
            AnswerModel(surveyQuizId: 30, answerScore: 1, answerText: '아니요'),
          ],
        ),
      ],
      nameOfSurvey: '파킨슨 심리진단',
    ),
    Survey(
      surveyId: 3,
      quizes: [
        SurveyQuizModel(
          surveyId: 3,
          surveyQuizId: 301,
          questionText: '때때로 매우 생생한 꿈을 꾼다.',
          answers: [
            AnswerModel(surveyQuizId: 301, answerScore: 1, answerText: '예'),
            AnswerModel(surveyQuizId: 301, answerScore: 0, answerText: '아니요'),
          ],
        ),
        SurveyQuizModel(
          surveyId: 3,
          surveyQuizId: 302,
          questionText: '꿈이 공격적이거나 움직임이 많은 내용일 때가 많다.',
          answers: [
            AnswerModel(surveyQuizId: 302, answerScore: 1, answerText: '예'),
            AnswerModel(surveyQuizId: 302, answerScore: 0, answerText: '아니요'),
          ],
        ),
        SurveyQuizModel(
          surveyId: 3,
          surveyQuizId: 303,
          questionText: '꿈의 내용을 그대로 행동으로 옮긴다.',
          answers: [
            AnswerModel(surveyQuizId: 303, answerScore: 1, answerText: '예'),
            AnswerModel(surveyQuizId: 303, answerScore: 0, answerText: '아니요'),
          ],
        ),
        SurveyQuizModel(
          surveyId: 3,
          surveyQuizId: 304,
          questionText: '잘 때, 내 팔이나 발이 움직이는 것을 느낀다.',
          answers: [
            AnswerModel(surveyQuizId: 304, answerScore: 1, answerText: '예'),
            AnswerModel(surveyQuizId: 304, answerScore: 0, answerText: '아니요'),
          ],
        ),
        SurveyQuizModel(
          surveyId: 3,
          surveyQuizId: 305,
          questionText: '수면 중 행동 때문에 같이 자는 배우자나 내 자신이 다친 일이 있다.',
          answers: [
            AnswerModel(surveyQuizId: 305, answerScore: 1, answerText: '예'),
            AnswerModel(surveyQuizId: 305, answerScore: 0, answerText: '아니요'),
          ],
        ),
        // 6번 문항은 점수에서 제외된다.
        SurveyQuizModel(
          surveyId: 3,
          surveyQuizId: 306,
          questionText: '꿈을 꿀 때 다음에 일이 발생한다.',
          questionSubText: '(다음을 눌러 진단을 이어서 해주세요)',
          answers: [
            // AnswerModel(surveyQuizId: 306, answerScore: 0, answerText: '예'),
            // AnswerModel(surveyQuizId: 306, answerScore: 0, answerText: '아니요'),
          ],
        ),
        SurveyQuizModel(
          surveyId: 3,
          surveyQuizId: 307,
          questionText: '말하거나 소리를 지르거나 욕하거나 크게 웃는 일',
          answers: [
            AnswerModel(surveyQuizId: 307, answerScore: 1, answerText: '예'),
            AnswerModel(surveyQuizId: 307, answerScore: 0, answerText: '아니요'),
          ],
        ),
        SurveyQuizModel(
          surveyId: 3,
          surveyQuizId: 308,
          questionText: '“싸우듯이” 갑자기 팔과 다리를 움직이는 일',
          answers: [
            AnswerModel(surveyQuizId: 308, answerScore: 1, answerText: '예'),
            AnswerModel(surveyQuizId: 308, answerScore: 0, answerText: '아니요'),
          ],
        ),
        SurveyQuizModel(
          surveyId: 3,
          surveyQuizId: 309,
          questionText:
              '자는 동안에는 필요 없는 몸짓이나 행동(예: 손 흔들기, 인사하기, 벌레 쫓는 행동, 침대에서 떨어지는 일)',
          answers: [
            AnswerModel(surveyQuizId: 309, answerScore: 1, answerText: '예'),
            AnswerModel(surveyQuizId: 309, answerScore: 0, answerText: '아니요'),
          ],
        ),
        // 6.4.
        SurveyQuizModel(
          surveyId: 3,
          surveyQuizId: 310,
          questionText: '침대 주변에 물건(예:침대 전등, 책, 안경)이 떨어져 있는 일',
          answers: [
            AnswerModel(surveyQuizId: 310, answerScore: 1, answerText: '예'),
            AnswerModel(surveyQuizId: 310, answerScore: 0, answerText: '아니요'),
          ],
        ),
        SurveyQuizModel(
          surveyId: 3,
          surveyQuizId: 311,
          questionText: '수면 중 내 움직임에 스스로 깨기도 한다.',
          answers: [
            AnswerModel(surveyQuizId: 311, answerScore: 1, answerText: '예'),
            AnswerModel(surveyQuizId: 311, answerScore: 0, answerText: '아니요'),
          ],
        ),
        SurveyQuizModel(
          surveyId: 3,
          surveyQuizId: 312,
          questionText: '잠에서 깼을 때, 대부분 꿈의 내용을 잘 기억한다.',
          answers: [
            AnswerModel(surveyQuizId: 312, answerScore: 1, answerText: '예'),
            AnswerModel(surveyQuizId: 312, answerScore: 0, answerText: '아니요'),
          ],
        ),
        SurveyQuizModel(
          surveyId: 3,
          surveyQuizId: 313,
          questionText: '잠을 설칠 때가 자주 있다.',
          answers: [
            AnswerModel(surveyQuizId: 313, answerScore: 1, answerText: '예'),
            AnswerModel(surveyQuizId: 313, answerScore: 0, answerText: '아니요'),
          ],
        ),
        SurveyQuizModel(
          surveyId: 3,
          surveyQuizId: 314,
          questionText:
              '신경계 질환을 가진적이 있다.(예: 뇌졸중, 머리 타박상, 파킨슨병, 하지불안증후군, 기면병, 우울증, 간질, 뇌의 염증성 질환 등이 있다면 어떤질환인지 구체적으로 기술해 주십시오.',
          answers: [
            AnswerModel(surveyQuizId: 314, answerScore: 1, answerText: '예'),
            AnswerModel(surveyQuizId: 314, answerScore: 0, answerText: '아니요'),
          ],
        ),
      ],
      nameOfSurvey: '수면자가진단',
    ),
  ];

  // Data ▼
  Rx<int> survey_id = 0.obs;
  Rx<int> questionNumber = 0.obs;
  Rx<int> score = 0.obs;
  Rx<bool> isFinish = false.obs;
  //백엔드가 올때까지 값을 모르므로 late
  late Rx<Survey> survey;
  //사용자가 선택하는  문제답
  // 0 이면 True , 1이면 False

  String handleResultValue() {
    switch (survey_id.value) {
      case 1:
        if (score.value >= 3) {
          //파킨슨증상
          return "${AuthService.to.userData.value.userName ?? '사용자'}님의 점수는 ${score.value}점으로\r\n파킨슨증상이 의심이 되니\r\n\r\n신경과 전문의와 상의하십시오.";
        } else {
          //정상
          return "${AuthService.to.userData.value.userName ?? '사용자'}님의 점수는 ${score.value}점으로\r\n파킨슨증상이 의심되지 않습니다.\r\n\r\n경과를 관찰해보세요.";
        }

      case 2:
        if (score.value >= 18) {
          //우울증
          return "${AuthService.to.userData.value.userName ?? '사용자'}님의 점수는 ${score.value}점으로\r\n유의미한 우울증상을 보이고 있습니다.\r\n\r\n주치의와 상의하십시오.";
        } else if (score >= 11 && score <= 18) {
          //경상 우을
          return "${AuthService.to.userData.value.userName ?? '사용자'}님의 점수는 ${score.value}점으로\r\n경증 우울증상을 보이고 있습니다.\r\n\r\n주치의와 상의하십시오.";
        } else {
          //정상
          return "${AuthService.to.userData.value.userName ?? '사용자'}님의 점수는 ${score.value}점으로\r\n의미있는 우울증상은 없습니다.\r\n\r\n경과를 관찰해보세요.";
        }
      case 3:
        if (score.value >= 5) {
          //우울증
          return "${AuthService.to.userData.value.userName ?? '사용자'}님의 점수는 ${score.value}점으로\r\n렘수면 행동 장애가 있습니다.\r\n\r\n주치의와 상의하십시오.";
        } else {
          //정상
          return "${AuthService.to.userData.value.userName ?? '사용자'}님의 점수는 ${score.value}점으로\r\n의미있는 렘수면 행동 장애는 없습니다.\r\n\r\n경과를 관찰해보세요.";
        }
      default:
        return 'Error';
    }
  }

  // Function ▼

  /// 유저가 다음 문제로 이동하는 함수
  void nextQuestion() {
    if (survey.value.quizes[questionNumber.value].surveyQuizId == 306) {
      questionNumber.value += 1;
      return;
    }

    //! questionNumber.value => 현재 문제 번호
    //! survey.value.quizes[questionNumber.value].userAnswer => 현재 문제에 유저가 답을 작성했는지 : 안했으면 999 , 했으면 0,1
    // 유저가 문제에 대한 답을 선택하지 않았을 경우 디폴트값이 0 이므로 아무 액션 안함
    if (survey.value.quizes[questionNumber.value].userAnswer == 999) return;

    // 현재 문제 번호가 문제 전체 개수보다 크거나 같으면 종료 [ 스코어 점수 계산 ]
    if (questionNumber.value >= survey.value.quizes.length - 1) {
      // 반목문으로 quzie에 저장된 유저 답을 기반으로 계산
      for (int i = 0; i < survey.value.quizes.length; i++) {
        if (survey_id.value == 3) {
          if (i != 5) {
            score.value += survey.value.quizes[i]
                .answers[survey.value.quizes[i].userAnswer!].answerScore;
          }
        } else {
          score.value += survey.value.quizes[i]
              .answers[survey.value.quizes[i].userAnswer!].answerScore;
        }
      }
      isFinish.value = true;
    } else {
      // 다음 문제로 이동
      questionNumber.value += 1;
    }
  }

  /// 유저가 이전 버튼을 클릭햇을 경우
  void prevQuestion() {
    // 첫문제때는 아무것도 안함.
    if (questionNumber.value == 0) return;
    // 이전 문제로 이동
    questionNumber.value -= 1;
  }

  /// 유저가 문제의 답을 선택했을 경우
  void handlePickUserAnswer(int value) {
    survey.value.quizes[questionNumber.value].userAnswer = value;
    survey.refresh();
  }

  /// 뒤로가기 버튼을 클릭했을 경우
  void handlePrevOnPressed() {
    Get.dialog(
      AlertDialog(
        title: Text(
          '진단을 중단 하시겠습니까?',
          style: TextPath.Heading2F18W600.copyWith(
            color: ColorPath.TextGrey1H212121,
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20).w,
              child: const Text('진단을 중단하는 경우 다시 처음부터 진행해야 합니다.'),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: ColorPath.Background1HECEFF1,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                        ),
                      ),
                      height: 48.w,
                      child: Text(
                        '취소',
                        style: TextPath.TextF14W500.copyWith(
                          color: ColorPath.TextGrey1H212121,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () async {
                      Get.back();
                      Get.back();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: ColorPath.PrimaryColor,
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(16),
                          )),
                      height: 48.w,
                      child: Text(
                        '중단',
                        style: TextPath.TextF14W500.copyWith(
                          color: ColorPath.BackgroundWhite,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        contentPadding: EdgeInsets.zero,
      ),
    );
  }

  @override
  Future<void> onInit() async {
    survey_id.value = int.parse(params);
    // get parameter로 들어오는 서베이 아이디 값을 기준으로 서베이를 초기화
    int findIndex = surveyList.indexWhere(
      (element) =>
          element.surveyId ==
          int.parse(
            params!,
          ),
    );

    // 있으면 index, 없으면 -1
    if (findIndex == -1) {
      Get.back();
    }

    survey = surveyList[findIndex].obs;

    super.onInit();
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
