//
//  UITextField.swift
//  SOPT38-assignment
//
//  Created by Seoyoung Lee on 4/23/26.
//

import UIKit

extension UITextField {

    func addLeftPadding(_ width: CGFloat = 20) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
    
    func addRightPadding(_ width: CGFloat = 20) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: self.frame.height))
        self.rightView = paddingView
        self.rightViewMode = ViewMode.always
    }
    
    func setPlaceholderColor(_ color: UIColor) {
        guard let string = self.placeholder else { return }
        attributedPlaceholder = NSAttributedString(string: string, attributes: [.foregroundColor: color])
    }
    
    func addRightButton(_ button: UIButton, padding: CGFloat = 15) {
        let containerWidth = button.frame.width + padding
        let container = UIView(frame: CGRect(x: 0, y: 0, width: containerWidth, height: button.frame.height))
        container.addSubview(button)
            
        self.rightView = container
        self.rightViewMode = .whileEditing
    }
}
