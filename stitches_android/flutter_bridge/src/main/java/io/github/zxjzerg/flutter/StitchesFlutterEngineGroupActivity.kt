package io.github.zxjzerg.flutter

import android.content.Context
import dagger.hilt.android.AndroidEntryPoint
import io.flutter.FlutterInjector
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineGroup
import io.flutter.embedding.engine.dart.DartExecutor
import javax.inject.Inject

@AndroidEntryPoint
class StitchesFlutterEngineGroupActivity : FlutterFragmentActivity() {
    @Inject
    lateinit var flutterEngineGroup: FlutterEngineGroup

    override fun provideFlutterEngine(context: Context): FlutterEngine? {
        val dartEntrypoint = DartExecutor.DartEntrypoint(FlutterInjector.instance().flutterLoader().findAppBundlePath(), "main")
        return flutterEngineGroup.createAndRunEngine(this, dartEntrypoint)
    }
}