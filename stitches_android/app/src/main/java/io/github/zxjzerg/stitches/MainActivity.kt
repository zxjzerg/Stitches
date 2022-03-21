package io.github.zxjzerg.stitches

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import dagger.hilt.android.AndroidEntryPoint
import io.github.zxjzerg.flutter.StitchesFlutterEngineGroupActivity

@AndroidEntryPoint
class MainActivity : AppCompatActivity() {

    private lateinit var btnStartFlutterEngineGroupActivity: Button

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        btnStartFlutterEngineGroupActivity = findViewById(R.id.btnStartFlutterEngineGroupActivity)
        btnStartFlutterEngineGroupActivity.setOnClickListener {
            val intent = Intent(this, StitchesFlutterEngineGroupActivity::class.java)
            startActivity(intent)
        }
    }
}