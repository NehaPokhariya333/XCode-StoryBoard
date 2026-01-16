//
//  ViewController.swift
//  homeFurnitureSharing
//
//  Created by GEU on 16/01/26.
//

import UIKit
import MessageUI
import SafariServices

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func imagePickerController(
            _ picker: UIImagePickerController,
            didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
    ) {
        if let image = info[.editedImage] as? UIImage {
            imageView.image = image
        } else if let image = info[.originalImage] as? UIImage {
            imageView.image = image
        }
        dismiss(animated: true)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        dismiss(animated: true)
    }

    
    @IBAction func photoButtonTapped(_ sender: Any){
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        let alertController = UIAlertController(
            title: "Choose Image",
            message: "Select image source",
            preferredStyle: .actionSheet
        )
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Camera", style: .default) { _ in
                imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true)
            }
            alertController.addAction(cameraAction)
        }
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let libraryAction = UIAlertAction(title: "Photo Library", style: .default) { _ in
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true)
            }
            alertController.addAction(libraryAction)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(cancelAction)
        alertController.popoverPresentationController?.sourceView = sender as? UIView
        present(alertController, animated: true)
    }
    
    @IBAction func shareButtonTapped(_ sender: Any){
        guard let image = imageView.image else { return }
        let activityVC = UIActivityViewController(
            activityItems: [image],
            applicationActivities: nil
        )
        activityVC.popoverPresentationController?.sourceView = sender as? UIView
        present(activityVC, animated: true)
    }
    @IBAction func safariButtonTapped(_ sender: Any){
        guard let url = URL(string: "https://developer.apple.com") else { return }
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }
    @IBAction func alertButtonTapped(_ sender: Any){
        let alertVC = UIAlertController(
            title: "Alert",
            message: "Do you wish to proceed?",
            preferredStyle: .alert
        )
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let yesAction = UIAlertAction(title: "Yes", style: .default)
        let noAction = UIAlertAction(title: "No", style: .default)
        alertVC.addAction(cancelAction)
        alertVC.addAction(yesAction)
        alertVC.addAction(noAction)
        present(alertVC, animated: true)
    }
    @IBAction func mailButtonTapped(_ sender: Any){
        guard MFMailComposeViewController.canSendMail() else { return }
        let mailVC = MFMailComposeViewController()
        mailVC.mailComposeDelegate = self
        mailVC.setToRecipients(["abc123@gmail.com"])
        mailVC.setSubject("Testing Swift Mail")
        mailVC.setMessageBody("This is a test email", isHTML: false)
        present(mailVC, animated: true)
    }


}
