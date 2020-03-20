//
//  ViewController.swift
//  ScreenLock
//  Created by Talha on 17/03/2020.
//  Copyright © 2020 Talha. All rights reserved.
import UIKit
class LockScreenViewController: UIViewController{
    @IBOutlet var hiddentextFeild: UITextField!
    @IBOutlet var firstView: UIView!
    @IBOutlet var secoundView: UIView!
    @IBOutlet var thirdView: UIView!
    @IBOutlet var fourthView: UIView!
    @IBOutlet var fifthView: UIView!
    @IBOutlet var sixthView: UIView!
    var obj = Passcode()
    override func viewDidLoad() {
        super.viewDidLoad()
        firstView.viewdesign()
       secoundView.viewdesign()
        thirdView.viewdesign()
        fourthView.viewdesign()
        fifthView.viewdesign()
        sixthView.viewdesign()
        hiddentextFeild.isHidden = true
        hiddentextFeild.delegate = self
       hiddentextFeild.addTarget(self, action: #selector(textFieldDidChange(sender:)), for: .editingChanged)
    }
     @objc func textFieldDidChange(sender: UITextField) {
        obj.insertText(hiddentextFeild.text!)
        if obj.count() == 1 {
            firstView.fillColor()
        }
        else if obj.count() == 2 {
            secoundView.fillColor()
        }
        else if obj.count() == 3 {
            thirdView.fillColor()
        }
        else if obj.count() == 4 {
            fourthView.fillColor()
        }
        else if obj.count() == 5 {
            fifthView.fillColor()
           
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
extension LockScreenViewController : UITextFieldDelegate{
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
                firstView.unFillColor()           }
            if obj.count() == 2 {
                secoundView.unFillColor()
                       }
            if obj.count() == 3 {
                thirdView.unFillColor()
                       }
            if obj.count() == 4 {
                fourthView.unFillColor()
                                  }
            if obj.count() == 5 {
                fifthView.unFillColor()
                                  }
            if obj.count() == 6 {
                sixthView.unFillColor()
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
extension UIView{
    func viewdesign()  {
        self.layer.cornerRadius = 18.0
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
    }
    func fillColor(){
        self.backgroundColor = .green

    }
    func unFillColor(){
        self.backgroundColor = .white

    }
}
