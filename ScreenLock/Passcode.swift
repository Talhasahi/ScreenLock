//
//  Passcode.swift
//  ScreenLock
//
//  Created by Talha on 17/03/2020.
//  Copyright © 2020 Talha. All rights reserved.
//

import Foundation
import UIKit
import UIKit
class KeyInputView: UIView {
   var _inputView: UIView?
     var code : String = ""
   override var canBecomeFirstResponder: Bool { return true }
   override var canResignFirstResponder: Bool { return true }

   override var inputView: UIView? {
       set { _inputView = newValue }
       get { return _inputView }
   }
}

// MARK: - UIKeyInput
//Modify if need more functionality

extension KeyInputView: UIKeyInput {
   
    var hasText: Bool { return false }
    func insertText(_ text: String) {
        code =  text
    }
    func deleteBackward() {
            code.removeLast()
       
    }
    func count() -> Int{
        return code.count 
    }
}

