package com.reactnativeqrdetector

import android.graphics.Color
import android.view.View
import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.annotations.ReactProp

import android.view.LayoutInflater
import com.camerakit.CameraKitView

class QrDetectorViewManager : SimpleViewManager<View>() {
  override fun getName() = "QrDetectorView"
  private var cameraKitView: CameraKitView? = null

  override fun createViewInstance(reactContext: ThemedReactContext): View {
    val content: View = LayoutInflater.from(reactContext).inflate(R.layout.camera, null)
    this.cameraKitView = content.findViewById<CameraKitView>(R.id.camera)
    return content
  }

  @ReactProp(name = "color")
  fun setColor(view: View, color: String) {
    view.setBackgroundColor(Color.parseColor(color))
  }
}
