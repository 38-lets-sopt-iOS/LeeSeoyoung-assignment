//
//  LoginVewController.swift
//  SOPT38-assignment
//
//  Created by Seoyoung Lee on 4/22/26.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "로그인/가입하려는\n이메일을 입력해주세요"
        label.textColor = UIColor.Watcha.white
        label.textAlignment = .left
        label.numberOfLines = 2
        label.font = UIFont.Watcha.head2
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "결제 등 중요 정보 알림, 로그인, 비밀번호 찾기에 필요해요.\n사용 중인 이메일을 입력해주세요."
        label.textColor = UIColor.Watcha.gray100
        label.textAlignment = .left
        label.numberOfLines = 2
        label.font = UIFont.Watcha.body1
        label.setLineHeight(5)
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.Watcha.gray600
        textField.placeholder = "email@address.com"
        textField.font = UIFont.Watcha.body2
        textField.textColor = UIColor.Watcha.white
        textField.setPlaceholderColor(UIColor.Watcha.gray300)
        textField.tintColor = UIColor.Watcha.pink
        
        textField.layer.cornerRadius = 10
        textField.addLeftPadding(15)
        
        textField.autocapitalizationType = .none
        textField.spellCheckingType = .no
        textField.autocorrectionType = .no
        
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        return textField
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("다음", for: .normal)
        button.setTitleColor(UIColor.Watcha.white, for: .normal)
        button.titleLabel?.font = UIFont.Watcha.medium
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(nextButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private let clearButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.Watcha.closeSquare, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        return button
    }()
    
    private let checkButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.Watcha.checkOff, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.Watcha.black
        setUI()
        setLayout()
    }
    
    private func setUI() {
        [titleLabel, descriptionLabel, emailTextField, nextButton].forEach{self.view.addSubview($0)}
        
        emailTextField.addRightButtons([clearButton, checkButton], padding: 15)
        clearButton.addTarget(self, action: #selector(clearText), for: .touchUpInside)
        emailTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        emailTextField.delegate = self
        
        nextButton.isEnabled = false
        nextButton.backgroundColor = UIColor.Watcha.gray400
        nextButton.setTitleColor(UIColor.Watcha.gray200, for: .disabled)
        
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(152)
            $0.left.equalToSuperview().inset(30)
        }
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(13)
            $0.left.equalTo(titleLabel.snp.left)
        }
        emailTextField.snp.makeConstraints{
            $0.left.right.equalToSuperview().inset(31)
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(27)
            $0.height.equalTo(47)
        }
        nextButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(47)
            $0.left.right.equalToSuperview().inset(21)
            $0.height.equalTo(56)
        }
    }
    
    @objc private func clearText() {
        emailTextField.text = ""
        emailTextField.resignFirstResponder()
        nextButton.isEnabled = false
        nextButton.backgroundColor = UIColor.Watcha.gray400
        resignFirstResponder()
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        let isEmpty = textField.text?.isEmpty ?? true
        nextButton.isEnabled = !isEmpty && isValid(email: self.emailTextField.text)
        
        if nextButton.isEnabled {
            nextButton.backgroundColor = UIColor.Watcha.pink
            checkButton.setImage(UIImage.Watcha.checkOn, for: .normal)
        } else {
            nextButton.backgroundColor = UIColor.Watcha.gray400
            checkButton.setImage(UIImage.Watcha.checkOff, for: .normal)
        }
    }
    
    @objc private func nextButtonDidTap() {
        pushToPasswordVC()
    }
    
    private func pushToPasswordVC() {
        let passwordVC = PasswordViewController()
        passwordVC.setLabelText(email: emailTextField.text)
        self.navigationController?.pushViewController(passwordVC, animated: true)
    }
    
    private func isValid(email: String?) -> Bool {
        let regExp = "^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$"
        return NSPredicate(format: "SELF MATCHES %@", regExp).evaluate(with: email)
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.Watcha.gray200.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 0
    }
}
