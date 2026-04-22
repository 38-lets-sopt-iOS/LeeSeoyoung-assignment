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
        textField.layer.cornerRadius = 10
        textField.addLeftPadding(15)
        return textField
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("다음", for: .normal)
        button.setTitleColor(UIColor.Watcha.white, for: .normal)
        button.backgroundColor = UIColor.Watcha.pink
        button.titleLabel?.font = UIFont.Watcha.medium
        button.layer.cornerRadius = 10
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
}
