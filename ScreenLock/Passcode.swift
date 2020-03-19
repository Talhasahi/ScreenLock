//
//  Passcode.swift
//  ScreenLock
//
//  Created by Talha on 17/03/2020.
//  Copyright © 2020 Talha. All rights reserved.
//

import Foundation
import UIKit
class KeyInputView {
    var code : String = ""
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

