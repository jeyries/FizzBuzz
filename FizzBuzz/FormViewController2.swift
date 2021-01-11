//
//  FormViewController2.swift
//  FizzBuzz
//
//  Created by Julien Perso on 11/01/2021.
//

import UIKit

class FormViewController2: UIViewController {

    enum Action {
        case compute(FizzBuzz)
    }

    var callback: ((Action) -> Void)?
    
    private var model: FormViewModel = .init()
    
    @IBOutlet weak var int1TextField: UITextField!
    @IBOutlet weak var computeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func computeAction(_ sender: Any) {
        callback?(.compute(model.fizzBuzz))
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        switch segue.identifier {
        case "segue-component-1":
            let controller = segue.destination as! FormComponentViewController
            controller.labelText = "label 1"
            
        case "segue-component-2":
            let controller = segue.destination as! FormComponentViewController
            controller.labelText = "label 2"
        
        default:
            fatalError()
        }
    }

}
