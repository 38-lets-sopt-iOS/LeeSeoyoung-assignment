//
//  UIButton+.swift
//  SOPT38-assignment
//
//  Created by Seoyoung Lee on 4/23/26.
//

import UIKit

extension UIButton {
    func setUnderline() {
        guard let title = title(for: .normal) else { return }
        let attributedString = NSMutableAttributedString(string: title)
        attributedString.addAttribute(.underlineStyle,
                                      value: NSUnderlineStyle.single.rawValue,
                                      range: NSRange(location: 0, length: attributedString.length)
        )
        setAttributedTitle(attributedString, for: .normal)
    }
}
