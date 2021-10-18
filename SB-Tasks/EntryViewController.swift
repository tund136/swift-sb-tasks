//
//  EntryViewController.swift
//  SB-Tasks
//
//  Created by Danh Tu on 18/10/2021.
//

import UIKit

class EntryViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var field: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        field.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveTask))
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        saveTask()
        
        return true
    }
    
    // @objc (Objective-C) allows this function to be used as a selector
    @objc func saveTask() {
        guard let text = field.text, !text.isEmpty
        else {
            return
        }
        
        guard let count = UserDefaults().value(forKey: "count") as? Int
        else {
            return
        }
        
        let newCount = count + 1
        
        UserDefaults().set(newCount, forKey: "count")
        UserDefaults().set(text, forKey: "task_\(newCount)")
    }
}
