//
//  ViewController.swift
//  AlanaziA assignment5
//
//  Created by abdulrahman alanazi on 2/18/19.
//  Copyright © 2019 abdulrahman alanazi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var descLabel: UITextField!
    @IBOutlet weak var quantLabel: UITextField!
    @IBOutlet weak var listText: UITextView!
    @IBOutlet var textFields: [UITextField]!
    
    var dict: [String:Int] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    @IBAction func backgroundTouched(_ sender: UIControl) { for tf in textFields {
        tf.resignFirstResponder() }
    }
    
    
    @IBAction func editEnded(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    
    @IBAction func addBtn(_ sender: Any) {
        if ( ((descLabel.text?.count)! <= 0) && ( (quantLabel.text?.count)! <= 0)){
            showMsg("Description and Quantitiy are required")
        } else if (( (descLabel.text?.count)! <= 0)){
            showMsg("Description is required")
        } else if (( (quantLabel.text?.count)! <= 0)) {
            showMsg("Quantitiy is required")
        } else {
            if let d = descLabel.text {
                if let n = quantLabel.text {
                    if let q = Int(n) {
                        self.dict[d] = (self.dict[d] != nil) ? self.dict[d]! + q : q
                        quantLabel.text = ""
                        updateList()
                    }
                }
            }
            
        }
    }
    
    @IBAction func newListBtn(_ sender: Any) {
        self.dict.removeAll()
        updateList()
    }
    
    @IBAction func newItemBtn(_ sender: Any) {
        self.descLabel.text = ""
        self.quantLabel.text = ""
    }
    
    func showMsg(_ msg:String) {
        let myAlert = UIAlertController(title: "Missing Fields", message: msg, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
        
    }
    
    func updateList() {
        listText.text = ""
        for i in dict {
            listText.text += "\(i.value)x \(i.key)\n\n"
        }
    }
}

