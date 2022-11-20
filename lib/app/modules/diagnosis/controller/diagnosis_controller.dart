// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:get/get.dart';

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
    // 무조건 갑을 선택해야 한다.
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
