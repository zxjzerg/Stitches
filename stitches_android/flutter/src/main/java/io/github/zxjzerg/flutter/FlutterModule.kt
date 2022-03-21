package io.github.zxjzerg.flutter

import android.content.Context
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.components.SingletonComponent
import io.flutter.embedding.engine.FlutterEngineGroup

/**
 * Flutter模块的管理类
 */
@InstallIn(SingletonComponent::class)
@Module
class FlutterModule {
    @Provides
    fun provideFlutterEngineGroup(@ApplicationContext context: Context): FlutterEngineGroup {
        return FlutterEngineGroup(context)
    }
}