//
//  ViewController.swift
//  ScreenLock
//  Created by Talha on 17/03/2020.
//  Copyright © 2020 Talha. All rights reserved.
import UIKit
class UIInputViewController: UIViewController{
    @IBOutlet var hiddentextFeild: UITextField!
    @IBOutlet var firstView: UIView!
     @IBOutlet var secoundView: UIView!
     @IBOutlet var thirdView: UIView!
    @IBOutlet var fourthView: UIView!
    @IBOutlet var fifthView: UIView!
    @IBOutlet var sixthView: UIView!
    var obj = KeyInputView()
    override func viewDidLoad() {
        super.viewDidLoad()
       firstView.layer.cornerRadius = 25.0
       secoundView.layer.cornerRadius = 25.0
        thirdView.layer.cornerRadius = 25.0
        fourthView.layer.cornerRadius = 25.0
        fifthView.layer.cornerRadius = 25.0
        sixthView.layer.cornerRadius = 25.0
        hiddentextFeild.isHidden = true
        hiddentextFeild.delegate = self
        firstView.layer.borderWidth = 3
        firstView.layer.borderColor = UIColor.black.cgColor
        secoundView.layer.borderWidth = 3
        secoundView.layer.borderColor = UIColor.black.cgColor
        thirdView.layer.borderWidth = 3
        thirdView.layer.borderColor = UIColor.black.cgColor
        fourthView.layer.borderWidth = 3
        fourthView.layer.borderColor = UIColor.black.cgColor
        fifthView.layer.borderWidth = 3
        fifthView.layer.borderColor = UIColor.black.cgColor
        sixthView.layer.borderWidth = 3
        sixthView.layer.borderColor = UIColor.black.cgColor
        hiddentextFeild.delegate = self
       hiddentextFeild.addTarget(self, action: #selector(textFieldDidChange(sender:)), for: .editingChanged)
    }
     @objc func textFieldDidChange(sender: UITextField) {
        obj.insertText(hiddentextFeild.text!)
        if obj.count() == 1 {
            firstView.backgroundColor = .green
        }
        else if obj.count() == 2 {
            secoundView.backgroundColor = .green
        }
        else if obj.count() == 3 {
            thirdView.backgroundColor = .green
        }
        else if obj.count() == 4 {
             fourthView.backgroundColor = .green
        }
        else if obj.count() == 5 {
             fifthView.backgroundColor = .green
           
        }
        else if obj.count() == 6 {
             sixthView.backgroundColor = .green
            if obj.code == "123456"{
                performSegue(withIdentifier: "goToNext", sender: self)
            }
            else{
                print("Wrong Password")
            }
        }
        
        print(obj.code)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        DispatchQueue.main.async {
            self.hiddentextFeild.becomeFirstResponder()
        }
    }
}
extension UIInputViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField:
        UITextField) -> Bool {
       
        hiddentextFeild.endEditing(true)
        self.viewDidLoad()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        //print(textField.text!)
        
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
     func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let char = string.cString(using: String.Encoding.utf8)
        let isBackSpace: Int = Int(strcmp(char, "\u{8}"))
        if isBackSpace == -8 {
            print(obj.count())
            if obj.count() == 1 {
                firstView.backgroundColor = .white            }
            if obj.count() == 2 {
                secoundView.backgroundColor = .white
                       }
            if obj.count() == 3 {
                thirdView.backgroundColor = .white
                       }
            if obj.count() == 4 {
                           fourthView.backgroundColor = .white
                                  }
            if obj.count() == 5 {
                           fifthView.backgroundColor = .white
                                  }
            if obj.count() == 6 {
                           sixthView.backgroundColor = .white
                                  }
            print("backpressed")
           // print(obj.count())
           
           obj.deleteBackward()
        }
           let maxLength = 6
        let currentString: NSString = hiddentextFeild?.text as! NSString
              let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
              return newString.length <= maxLength
        }
}

