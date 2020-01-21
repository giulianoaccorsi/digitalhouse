//
//  ViewController.swift
//  Core-MLDigital
//
//  Created by Giuliano Accorsi on 15/08/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController {
    @IBOutlet weak var cameraButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func abrirCamera(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .camera
            imagePicker.cameraFlashMode = .on
            self.present(imagePicker, animated: true)
            
        }
    }
    
    func configureML(image: UIImage) {
        guard let model = try? VNCoreMLModel(for: MobileNetV2().model) else {
            fatalError("cannot load ML")
        }
        
        let request = VNCoreMLRequest(model: model) { (request, error) in
            guard let results = request.results as? [VNClassificationObservation], let firstResult = results.first else {
                fatalError("cannot get result")
            }
               print("Confidence = \(Int(firstResult.confidence * 100))%,\n Identifier = \(firstResult.identifier      )")
        }
        
        guard let ciImage = CIImage(image: image) else {
            fatalError("Converte failed")
        }
        
        let imageHandle = VNImageRequestHandler(ciImage: ciImage)
        try? imageHandle.perform([request])
    }
    
}
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            configureML(image: pickedImage)
        }
        picker.dismiss(animated: true)
    }
}

