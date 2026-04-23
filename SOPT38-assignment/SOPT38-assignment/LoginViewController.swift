//
//  LoginVewController.swift
//  SOPT38-assignment
//
//  Created by Seoyoung Lee on 4/22/26.
//

import UIKit
import SnapKit
import Then

class LoginViewController: UIViewController {
    
    private let titleLabel = UILabel().then {
        $0.text = "로그인/가입하려는\n이메일을 입력해주세요"
        $0.textColor = UIColor.Watcha.white
        $0.textAlignment = .left
        $0.numberOfLines = 2
        $0.font = UIFont.Watcha.head2
    }
    
    private let descriptionLabel = UILabel().then {
        $0.text = "결제 등 중요 정보 알림, 로그인, 비밀번호 찾기에 필요해요.\n사용 중인 이메일을 입력해주세요."
        $0.textColor = UIColor.Watcha.gray100
        $0.textAlignment = .left
        $0.numberOfLines = 2
        $0.font = UIFont.Watcha.body1
        $0.setLineHeight(5)
    }
    
    private let emailTextField = UITextField().then {
        $0.backgroundColor = UIColor.Watcha.gray600
        $0.placeholder = "email@address.com"
        $0.font = UIFont.Watcha.body2
        $0.textColor = UIColor.Watcha.white
        $0.setPlaceholderColor(UIColor.Watcha.gray300)
        $0.tintColor = UIColor.Watcha.pink
        
        $0.layer.cornerRadius = 10
        $0.addLeftPadding(15)
        
        $0.autocapitalizationType = .none
        $0.spellCheckingType = .no
        $0.autocorrectionType = .no
        
        $0.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    private let nextButton = UIButton().then {
        $0.setTitle("다음", for: .normal)
        $0.setTitleColor(UIColor.Watcha.white, for: .normal)
        $0.titleLabel?.font = UIFont.Watcha.medium
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(nextButtonDidTap), for: .touchUpInside)
    }
    
    private let clearButton = UIButton().then {
        $0.setImage(UIImage.Watcha.closeSquare, for: .normal)
        $0.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
    }
    
    private let checkButton = UIButton().then {
        $0.setImage(UIImage.Watcha.checkOff, for: .normal)
        $0.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
    }
    
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
