//
//  ViewController.swift
//  ScreenLock
//
//  Created by Talha on 17/03/2020.
//  Copyright © 2020 Talha. All rights reserved.
//
import UIKit
class UIInputViewController: UIViewController,UIKeyInput{
      
    let softwareKeyboardHider = UIView()

    @IBOutlet var hiddentextFeild: UITextField!
    @IBOutlet var first: UIView!
    @IBOutlet var secound: UIView!
    @IBOutlet var third: UIView!
    var obj = KeyInputView()
    @IBOutlet var fourth: UIView!
    var code : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        first.layer.cornerRadius = 25.0
        secound.layer.cornerRadius = 25.0
        third.layer.cornerRadius = 25.0
        fourth.layer.cornerRadius = 25.0
        //hiddentextFeild.isHidden = true
        hiddentextFeild.delegate = self
        first.layer.borderWidth = 3
        first.layer.borderColor = UIColor.black.cgColor
        secound.layer.borderWidth = 3
        secound.layer.borderColor = UIColor.black.cgColor
        third.layer.borderWidth = 3
        third.layer.borderColor = UIColor.black.cgColor
        fourth.layer.borderWidth = 3
        fourth.layer.borderColor = UIColor.black.cgColor
        hiddentextFeild.delegate = self

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        DispatchQueue.main.async {
            self.hiddentextFeild.becomeFirstResponder()
        }
    }

    override var inputView: UIView? {
    return softwareKeyboardHider
    }
    var hasText: Bool {
    return hiddentextFeild.hasText
    }
    func insertText(_ text: String) {
    hiddentextFeild.insertText(text)
        print("text")
    }
    func deleteBackward() {
        print("back")
    hiddentextFeild.deleteBackward()
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
        print(textField.text!)
        
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
     func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(textField.text!)
        obj.insertText(textField.text!)
        print("call")
        let char = string.cString(using: String.Encoding.utf8)
        let isBackSpace: Int = Int(strcmp(char, "\u{8}"))
     
        if isBackSpace == -8 {
            print("w")
        }
        else{
            print(obj.count())
            if obj.count() == 0 {
            first.backgroundColor = .green
        }
        if obj.count() == 1 {
            print("a")
            secound.backgroundColor = .green
        }
        if obj.count() == 2 {
            third.backgroundColor = .green
        }
        if obj.count() == 3 {
           fourth.backgroundColor = .green
            //performSegue(withIdentifier:"goToNext" , sender: self)
            hiddentextFeild.endEditing(true)
        }
        obj.insertText(textField.text!)
        }
        //print(textField.text!)
        
           return true
        }
     func textFieldValueChanged(_ textField: UITextField) {
           let value = textField.text ?? ""
           print("value changed: \(value)")
        print("w")
       }
        }

