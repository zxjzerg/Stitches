package io.github.zxjzerg.stitches

import android.content.Intent
import android.os.Bundle
import androidx.activity.compose.setContent
import androidx.appcompat.app.AppCompatActivity
import androidx.compose.foundation.layout.Column
import androidx.compose.material3.Button
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.tooling.preview.Preview
import dagger.hilt.android.AndroidEntryPoint
import io.github.zxjzerg.flutter.StitchesFlutterEngineGroupActivity

@AndroidEntryPoint
class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            MainPage()
        }
    }

    @Composable
    @Preview
    fun MainPage() {
        Column {
            Button(onClick = {
                val intent = Intent(this@MainActivity, StitchesFlutterEngineGroupActivity::class.java)
                startActivity(intent)
            }) {
                Text("启动笔记界面（Flutter）")
            }
        }
    }
}