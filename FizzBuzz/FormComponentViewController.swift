//
//  FormComponentViewController.swift
//  FizzBuzz
//
//  Created by Julien Perso on 11/01/2021.
//

import UIKit

class FormComponentViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var labelText: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = labelText
    }
    

}
