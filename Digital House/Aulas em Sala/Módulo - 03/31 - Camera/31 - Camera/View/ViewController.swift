//
//  ViewController.swift
//  31 - Camera
//
//  Created by Giuliano Accorsi on 27/06/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var button: UIButton!
    var smallImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func clicouBotao(_ sender: Any) {
        let alerta = UIAlertController(title: "Photo Selection", message: "Select", preferredStyle: .actionSheet)
        
        
        let camera = UIAlertAction(title: "Camera", style: .default) { (action) in
            self.getImage(sourceType: .camera)
        }
        
        let album = UIAlertAction(title: "PhotoAlbum", style: .default) { (action) in
            self.getImage(sourceType: .photoLibrary)
        }
        
        alerta.addAction(camera)
        alerta.addAction(album)
        self.present(alerta, animated: true)
    }
    
    func getImage(sourceType: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = sourceType
            self.present(imagePickerController, animated: true)
        }
    }
    
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        self.imageView.image = image
        dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}





