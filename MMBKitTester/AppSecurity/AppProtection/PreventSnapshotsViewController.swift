//
//  PreventSnapshotsViewController.swift
//  MMBKitTester
//
//  Created by Rasid Ramazanov on 30.03.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import AppSecurity

class PreventSnapshotsViewController: UIViewController {
    
    @IBOutlet private weak var placeholderView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showPlaceholderIfNeeded()
    }
    
    private func showPlaceholderIfNeeded() {
        if let placeholder = AppSecurity.shared().appSwitcherPlaceholderView {
            placeholder.frame = placeholderView.bounds
            placeholderView.addSubview(placeholder)
        }
    }
    
    @IBAction private func setPlaceholder() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.allowsEditing = true
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
    }
    
}

extension PreventSnapshotsViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[.editedImage] as? UIImage else {
            return
        }
        placeholderView.subviews.first?.removeFromSuperview()
        let imageView = UIImageView(frame: placeholderView.frame)
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        AppSecurity.shared().appSwitcherPlaceholderView = imageView
        showPlaceholderIfNeeded()
    }
    
}
