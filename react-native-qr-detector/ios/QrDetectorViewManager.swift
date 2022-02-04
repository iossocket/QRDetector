import AVFoundation


@objc(QrDetectorViewManager)
class QrDetectorViewManager: RCTViewManager {

    override func view() -> (QrDetectorView) {
        return QrDetectorView()
    }
    
    override var methodQueue: DispatchQueue! {
        return DispatchQueue.main
    }
    
    override class func requiresMainQueueSetup() -> Bool {
        return true
    }
    
    @objc final func getCameraPermissionStatus(_ resolve: @escaping RCTPromiseResolveBlock, reject: @escaping RCTPromiseRejectBlock) {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        resolve(status.rawValue)
    }
    
    @objc final func requestCameraPermission(_ resolve: @escaping RCTPromiseResolveBlock, reject _: @escaping RCTPromiseRejectBlock) {
        AVCaptureDevice.requestAccess(for: .video) { granted in
            let result: AVAuthorizationStatus = granted ? .authorized : .denied
            resolve(result.rawValue)
        }
    }
}

class QrDetectorView : UIView {
    
    var captureSession: AVCaptureSession = AVCaptureSession()
    
    var videoPreviewLayer: AVCaptureVideoPreviewLayer {
        return layer as! AVCaptureVideoPreviewLayer
    }
    
    override public class var layerClass: AnyClass {
        return AVCaptureVideoPreviewLayer.self
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let captureDevice = AVCaptureDevice.default(for: .video)!
        let input = try! AVCaptureDeviceInput(device: captureDevice)
        captureSession.addInput(input)
        
        let captureMetadataOutput = AVCaptureMetadataOutput()
        captureSession.addOutput(captureMetadataOutput)
        
        captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        captureMetadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        
        videoPreviewLayer.session = captureSession
        videoPreviewLayer.videoGravity = .resizeAspectFill
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didSetProps(_ changedProps: [String]!) {
        captureSession.startRunning()
    }
}

extension QrDetectorView: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        print("metadataObjects: \(metadataObjects)")
    }
}
