//
//  ViewController.swift
//  systemViewController
//
//  Created by GEU on 15/01/26.
//

import UIKit
import SafariServices
import MessageUI
class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var Image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {return}
        Image.image = image
        
    }
    
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        print("Email sent")
        dismiss(animated: true)
    }
    
    @IBAction func ShareButton(_ sender: Any) {
        if let image = Image.image {
            let activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = sender as? UIView
            present(activityViewController, animated: true)
        }
        
    }
    @IBAction func SafariButton(_ sender: Any) {
        if let url = URL(string: "https://www.apple.com"){
            let safariViewController = SFSafariViewController(url : url)
            present(safariViewController, animated: true)
        }
        
    }
    @IBAction func AlertButton(_ sender: Any) {
        let alertViewControler = UIAlertController(title: "Alert", message: "Do you wish to proceed?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive){ _ in print("Canceller")
        }
        let okAction = UIAlertAction(title: "OK", style: .default){ _ in print("OK")
        }
        alertViewControler.addAction(cancelAction)
        alertViewControler.addAction(okAction)
        present(alertViewControler, animated: true)
        
        
        
    }
    @IBAction func PhotoButton(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true)
        
    }
    @IBAction func MailButton(_ sender: Any) {
        let mailComposeViewController = MFMailComposeViewController()
        mailComposeViewController.mailComposeDelegate = self
        mailComposeViewController.setToRecipients(["abc@gmail.com"])
        mailComposeViewController.setSubject("Hello")
        mailComposeViewController.setMessageBody("This is a test Email", isHTML: false)
        
        if MFMailComposeViewController.canSendMail() {
            present(mailComposeViewController, animated: true)
        }
        else {
            print("Can't send email")
        }
    }
    

}

