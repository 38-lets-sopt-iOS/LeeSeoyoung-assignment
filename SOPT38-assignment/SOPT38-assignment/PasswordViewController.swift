//
//  PasswordViewController.swift
//  SOPT38-assignment
//
//  Created by Seoyoung Lee on 4/23/26.
//

import UIKit
import SnapKit
import Then

class PasswordViewController: UIViewController, SetNicknameDelegateProtocol {
    
    func setNickname(nickname: String) {
        setNicknameButton.setUnderlineTitle(
            nickname, font: UIFont.Watcha.body2, color: UIColor.Watcha.gray200
        )
    }
    
    private var userEmail: String?
    private var isPasswordVisible = false
    
    private let titleLabel = UILabel().then {
        $0.text = "사용할 비밀번호를\n입력해주세요"
        $0.textColor = UIColor.Watcha.white
        $0.textAlignment = .left
        $0.numberOfLines = 2
        $0.font = UIFont.Watcha.head2
    }
    
    private let descriptionLabel = UILabel().then {
        $0.text = "???로 가입 중"
        $0.textColor = UIColor.Watcha.gray100
        $0.textAlignment = .left
        $0.font = UIFont.Watcha.body1
    }
    
    private let pwTextField = UITextField().then {
        $0.backgroundColor = UIColor.Watcha.gray600
        $0.placeholder = "비밀번호"
        $0.font = UIFont.Watcha.body2
        $0.textColor = UIColor.Watcha.white
        $0.setPlaceholderColor(UIColor.Watcha.gray300)
        $0.tintColor = UIColor.Watcha.pink
        
        $0.layer.cornerRadius = 10
        $0.addLeftPadding(15)
        
        $0.autocapitalizationType = .none
        $0.spellCheckingType = .no
        $0.autocorrectionType = .no
        $0.isSecureTextEntry = true
    }
    
    private let signupButton = UIButton().then {
        $0.setTitle("가입하기", for: .normal)
        $0.setTitleColor(UIColor.Watcha.white, for: .normal)
        $0.titleLabel?.font = UIFont.Watcha.medium
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(signupButtonDidTap), for: .touchUpInside)
    }
    
    private let clearButton = UIButton().then {
        $0.setImage(UIImage.Watcha.closeSquare, for: .normal)
        $0.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
    }
    
    private let eyeButton = UIButton().then {
        $0.setImage(UIImage.Watcha.eyeOn, for: .normal)
        $0.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
    }
    
    private let setNicknameButton = UIButton().then {
        $0.setTitle("닉네임 설정", for: .normal)
        $0.titleLabel?.font = UIFont.Watcha.body2
        $0.setTitleColor(UIColor.Watcha.gray200, for: .normal)
        $0.setUnderline()
    }
    
    private let enableImageView = UIImageView().then {
        $0.image = UIImage.Watcha.enableOff
    }
    
    private let enableLabel = UILabel().then {
        $0.text = "영문, 숫자, 특수문자 포함 10글자 이상"
        $0.textAlignment = .left
        $0.font = UIFont.Watcha.body2
        $0.textColor = UIColor.Watcha.gray100
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.Watcha.black
        setUI()
        setLayout()
    }
    
    func setLabelText(email: String?) {
        self.userEmail = email
        
        if let email = email {
            descriptionLabel.text = "\(email)로 가입 중"
        }
    }
    
    private func setUI() {
        [titleLabel, descriptionLabel, pwTextField, signupButton, setNicknameButton, enableImageView, enableLabel].forEach{self.view.addSubview($0)}
        
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
        setNicknameButton.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.top.equalTo(pwTextField.snp.bottom).offset(67)
        }
        enableImageView.snp.makeConstraints {
            $0.left.equalToSuperview().inset(35)
            $0.top.equalTo(pwTextField.snp.bottom).offset(13)
        }
        enableLabel.snp.makeConstraints {
            $0.top.equalTo(pwTextField.snp.bottom).offset(13)
            $0.left.equalTo(enableImageView.snp.right).offset(8)
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
        signupButton.isEnabled = !isEmpty && isValid(pw: self.pwTextField.text)
        if signupButton.isEnabled {
            signupButton.backgroundColor = UIColor.Watcha.pink
            enableImageView.image = UIImage.Watcha.enableOn
            enableLabel.textColor = UIColor.Watcha.green
        } else {
            signupButton.backgroundColor = UIColor.Watcha.gray400
            enableImageView.image = UIImage.Watcha.enableOff
            enableLabel.textColor = UIColor.Watcha.gray100
        }
    }
    
    @objc private func togglePasswordVisibility() {
        isPasswordVisible.toggle()
        pwTextField.isSecureTextEntry = !isPasswordVisible
        let eyeImage = isPasswordVisible ? UIImage.Watcha.eyeOff : UIImage.Watcha.eyeOn
        eyeButton.setImage(eyeImage, for: .normal)
    }
    
    @objc private func showNicknameBottomSheet() {
        let bottomsheet = NicknameBottomSheetViewController()
        bottomsheet.delegate = self
        
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
        welcomeVC.setLabelText(nickname: setNicknameButton.titleLabel?.text)
        self.navigationController?.pushViewController(welcomeVC, animated: true)
    }
    
    private func isValid(pw: String?) -> Bool {
        let regExp = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>\\/?]).{10,}$"
        return NSPredicate(format: "SELF MATCHES %@", regExp).evaluate(with: pw)
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
