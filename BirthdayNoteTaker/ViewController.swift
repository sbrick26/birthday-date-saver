//
//  ViewController.swift
//  BirthdayNoteTaker
//
//  Created by Swayam Barik on 9/23/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if let myName = storedName as? String, let myBday = storedBirthday as? String{
            nameLabel.text = myName
            birthdayLabel.text = myBday
        }
    }

    @IBAction func deleteClicked(_ sender: Any) {
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if (storedName as? String) != nil && (storedBirthday as? String) != nil{
            UserDefaults.standard.removeObject(forKey: "name")
            UserDefaults.standard.removeObject(forKey: "birthday")
            nameLabel.text = "Name: "
            birthdayLabel.text = "Birthday: "
        }
        
        
    }
    @IBAction func saveClicked(_ sender: Any) {
        
        
        
        if let name = nameTextField.text, let birthday = birthdayTextField.text {
            UserDefaults.standard.set(name, forKey: "name")
            UserDefaults.standard.set(birthday, forKey: "birthday")
            // dont have to use syncronize will store data for you
            // creates dictoniary to store values on their phone
            
            nameLabel.text = "Name: \(name)"
            birthdayLabel.text = "Birthday: \(birthday)"
        }
    }
    
}

