//
//  NicknameBottomSheetViewController.swift
//  SOPT38-assignment
//
//  Created by Seoyoung Lee on 4/23/26.
//

import UIKit
import SnapKit

class NicknameBottomSheetViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "닉네임을 입력해주세요"
        label.font = UIFont.Watcha.subhead1
        label.textColor = UIColor.Watcha.white
        label.textAlignment = .left
        return label
    }()
    
    private let nicknameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.Watcha.gray600
        textField.font = UIFont.Watcha.body2
        textField.textAlignment = .left
        textField.placeholder = "닉네임을 입력하세요"
        
        textField.textColor = UIColor.Watcha.white
        textField.setPlaceholderColor(UIColor.Watcha.gray300)
        textField.tintColor = UIColor.Watcha.pink
        
        textField.layer.cornerRadius = 10
        textField.addLeftPadding(15)
        
        textField.autocapitalizationType = .none
        textField.spellCheckingType = .no
        textField.autocorrectionType = .no
        return textField
    }()
    
    private let confirmButton: UIButton = {
        let button = UIButton()
        button.setTitle("완료", for: .normal)
        button.titleLabel?.font = UIFont.Watcha.medium
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.Watcha.gray600
        button.layer.cornerRadius = 10
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.Watcha.gray400
        setUI()
        setLayout()
    }
    
    private func setUI() {
        [titleLabel, nicknameTextField, confirmButton].forEach{self.view.addSubview($0)}
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(42)
            $0.left.equalToSuperview().inset(24)
        }
        nicknameTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(19)
            $0.left.right.equalToSuperview().inset(31)
            $0.height.equalTo(47)
        }
        confirmButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(47)
            $0.right.left.equalToSuperview().inset(22)
            $0.height.equalTo(56)
        }
    }
}
