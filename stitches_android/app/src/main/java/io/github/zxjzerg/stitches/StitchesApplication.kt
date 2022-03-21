package io.github.zxjzerg.stitches

import android.app.Application
import dagger.hilt.android.HiltAndroidApp

@HiltAndroidApp
class StitchesApplication : Application() {

    override fun onCreate() {
        super.onCreate()
    }
}