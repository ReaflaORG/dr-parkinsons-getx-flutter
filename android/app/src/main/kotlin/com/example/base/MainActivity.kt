package com.gilhospital.parkinsons

import android.os.Bundle
import androidx.core.view.WindowCompat
import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // Android 15 Edge-to-edge 디스플레이 지원
        // WindowCompat.setDecorFitsSystemWindows를 false로 설정하여
        // 시스템 바(상태바, 내비게이션 바) 뒤까지 콘텐츠를 확장합니다.
        // Flutter의 SafeArea 위젯이 자동으로 인셋을 처리합니다.
        WindowCompat.setDecorFitsSystemWindows(window, false)
    }
}
