package com.iossocket.qrdetector

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.king.wechat.qrcode.WeChatQRCodeDetector
import org.opencv.OpenCV

// https://github.com/jenly1314/WeChatQRCode
// https://github.com/woshiwzy/opencv_wechat_qr

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        OpenCV.initAsync(this)
        WeChatQRCodeDetector.init(this)
    }
}