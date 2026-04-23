//
//  PasswordViewController.swift
//  SOPT38-assignment
//
//  Created by Seoyoung Lee on 4/23/26.
//

import UIKit
import SnapKit

class PasswordViewController: UIViewController {
    
    private var isPasswordVisible = false
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "사용할 비밀번호를\n입력해주세요"
        label.textColor = UIColor.Watcha.white
        label.textAlignment = .left
        label.numberOfLines = 2
        label.font = UIFont.Watcha.head2
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "???로 가입 중"
        label.textColor = UIColor.Watcha.gray100
        label.textAlignment = .left
        label.font = UIFont.Watcha.body1
        return label
    }()
    
    private let pwTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.Watcha.gray600
        textField.placeholder = "비밀번호"
        textField.font = UIFont.Watcha.body2
        textField.textColor = UIColor.Watcha.white
        textField.setPlaceholderColor(UIColor.Watcha.gray300)
        textField.tintColor = UIColor.Watcha.pink
        
        textField.layer.cornerRadius = 10
        textField.addLeftPadding(15)
        
        textField.autocapitalizationType = .none
        textField.spellCheckingType = .no
        textField.autocorrectionType = .no
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let signupButton: UIButton = {
        let button = UIButton()
        button.setTitle("가입하기", for: .normal)
        button.setTitleColor(UIColor.Watcha.white, for: .normal)
        button.titleLabel?.font = UIFont.Watcha.medium
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(signupButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private let clearButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.Watcha.closeSquare, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        return button
    }()
    
    private let eyeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.Watcha.eyeOn, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        return button
    }()
    
    private let setNicknameButton: UIButton = {
        let button = UIButton()
        button.setTitle("닉네임 설정", for: .normal)
        button.titleLabel?.font = UIFont.Watcha.body2
        button.setTitleColor(UIColor.Watcha.gray200, for: .normal)
        button.setUnderline()
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.Watcha.black
        setUI()
        setLayout()
    }
    
    private func setUI() {
        [titleLabel, descriptionLabel, pwTextField, signupButton, setNicknameButton].forEach{self.view.addSubview($0)}
        
        pwTextField.addRightButtons([clearButton, eyeButton], padding: 15)
        clearButton.addTarget(self, action: #selector(clearText), for: .touchUpInside)
        eyeButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        pwTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        pwTextField.delegate = self
        
        signupButton.isEnabled = false
        signupButton.backgroundColor = UIColor.Watcha.gray400
        signupButton.setTitleColor(UIColor.Watcha.gray200, for: .disabled)
        
        setNicknameButton.addTarget(self, action: #selector(showNicknameBottomSheet), for: .touchUpInside)
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
        pwTextField.snp.makeConstraints{
            $0.left.right.equalToSuperview().inset(31)
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(30)
            $0.height.equalTo(47)
        }
        signupButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(47)
            $0.left.right.equalToSuperview().inset(21)
            $0.height.equalTo(56)
        }
        setNicknameButton.snp.makeConstraints{
            $0.center.equalToSuperview()
            $0.top.equalTo(pwTextField.snp.bottom).offset(67)
        }
    }
    
    @objc private func clearText() {
        pwTextField.text = ""
        pwTextField.resignFirstResponder()
        signupButton.isEnabled = false
        signupButton.backgroundColor = UIColor.Watcha.gray400
        resignFirstResponder()
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        let isEmpty = textField.text?.isEmpty ?? true
        signupButton.isEnabled = !isEmpty
        signupButton.backgroundColor = isEmpty ? UIColor.Watcha.gray400 : UIColor.Watcha.pink
    }
    
    @objc private func togglePasswordVisibility() {
        isPasswordVisible.toggle()
        pwTextField.isSecureTextEntry = !isPasswordVisible
        let eyeImage = isPasswordVisible ? UIImage.Watcha.eyeOff : UIImage.Watcha.eyeOn
        eyeButton.setImage(eyeImage, for: .normal)
    }
    
    @objc private func showNicknameBottomSheet() {
        let bottomsheet = NicknameBottomSheetViewController()
        
        if let sheet = bottomsheet.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersGrabberVisible = true
        }
        
        present(bottomsheet, animated: true)
    }
    
    @objc private func signupButtonDidTap() {
        pushToWelcomeVC()
    }
    
    private func pushToWelcomeVC() {
        let welcomeVC = WelcomeViewController()
        self.navigationController?.pushViewController(welcomeVC, animated: true)
    }
}

extension PasswordViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.Watcha.gray200.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 0
    }
}
