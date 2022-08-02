//
//  ViewController.swift
//  Test_Mocks_Genertion
//
//  Created by Vasile Morari on 31.07.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let arguments = ["sourcery", "documents/protocols/Test.swift"]
        let path: NSString = NSString(string: arguments[1])
        let pathExtension = path.pathExtension
        
        if pathExtension.isEmpty {
            // User has entered a directory
            print("User has entered a directory")
            
            
        } else if pathExtension == "swift" {
            // User entered a swift file
            print("User entered a swift file")
            
            
        }
    }
}

