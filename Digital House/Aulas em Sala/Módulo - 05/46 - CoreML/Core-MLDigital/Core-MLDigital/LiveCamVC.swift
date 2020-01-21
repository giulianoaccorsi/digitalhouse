//
//  LiveCamVC.swift
//  Core-MLDigital
//
//  Created by Giuliano Accorsi on 15/08/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit
import AVKit
import Vision



class LiveCamVC: UIViewController {

    @IBOutlet weak var viewLiveCamera: UIView!
    @IBOutlet weak var labelTexto: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func configureAVCSession() {
        let captureSession = AVCaptureSession()
        captureSession.sessionPreset = .photo
        
        guard let captureDevice = AVCaptureDevice.default(for: .video) else {return}
        guard let input = try? AVCaptureDeviceInput(device: captureDevice) else {return}
        captureSession.addInput(input)
        captureSession.startRunning()
        
        let dataOutput = AVCaptureVideoDataOutput()
        dataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "VideoQueue"))
        
        captureSession.addOutput(dataOutput)
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        
        viewLiveCamera.layer.addSublayer(previewLayer)
        previewLayer.frame = viewLiveCamera.bounds
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureAVCSession()
    }
    



}

extension LiveCamVC: AVCaptureVideoDataOutputSampleBufferDelegate {
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        
        guard let pixelBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {return}
        
        guard let model = try? VNCoreMLModel(for: Resnet50().model) else {return}
        
        let request = VNCoreMLRequest(model: model) { (request, error) in
            guard let results = request.results as? [VNClassificationObservation] else {return}
            guard let firstObeservation = results.first else {return}
            
            DispatchQueue.main.async {
                self.labelTexto.text = "\(firstObeservation.identifier) - \(Int(firstObeservation.confidence * 100))%"
            }
            
            
        }
        
        
        try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
        
    }
    
}
