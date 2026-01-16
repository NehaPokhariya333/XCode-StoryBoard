//
//  ViewController.swift
//  MVCModels
//
//  Created by GEU on 14/01/26.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    struct Note: Codable{
        let title: String
        let text: String
        let timestamp: Date
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let newNote = Note(title: "Grocery Run", text: "Pick up mayonnaise, mustard,lettuce, tomato and pickles", timestamp: Date())
        
        let propertyListEncoder = PropertyListEncoder()
        
        if let encoderNote = try? propertyListEncoder.encode(newNote) {
            print(encoderNote)
            
            let protertyListDecoder = PropertyListDecoder()
            
            if let decodeNote = try? protertyListDecoder.decode(Note.self, from: encoderNote) {
                print(decodeNote)
            }
        }
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        let archiveURL = documentsDirectory.appendingPathComponent("notes").appendingPathExtension("plist")
        
        let encodedNote = try? propertyListEncoder.encode(newNote)
        try? encodedNote?.write(to: archiveURL, options: .noFileProtection)
        
        let propertyListDecoder2 = PropertyListDecoder()
        
        if let retrieveNoteData = try? Data(contentsOf: archiveURL), let decodedNote = try? propertyListDecoder2.decode(Note.self, from: retrieveNoteData) {
            print(decodedNote)
        }
        print(documentsDirectory.path())
        print(archiveURL)
        
        
        
    }


}

