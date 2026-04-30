//
//  NicknameBottomSheetViewController.swift
//  SOPT38-assignment
//
//  Created by Seoyoung Lee on 4/23/26.
//

import UIKit
import SnapKit
import Then

protocol SetNicknameDelegateProtocol: AnyObject {
    func setNickname(nickname: String)
}

class NicknameBottomSheetViewController: UIViewController {
    
    weak var delegate: SetNicknameDelegateProtocol?
    
    private var nickname: String?
    
    private let titleLabel = UILabel().then {
        $0.text = "닉네임을 입력해주세요"
        $0.font = UIFont.Watcha.subhead1
        $0.textColor = UIColor.Watcha.white
        $0.textAlignment = .left
    }
    
    private let nicknameTextField = UITextField().then {
        $0.backgroundColor = UIColor.Watcha.gray600
        $0.font = UIFont.Watcha.body2
        $0.textAlignment = .left
        $0.placeholder = "닉네임을 입력하세요"
        
        $0.textColor = UIColor.Watcha.white
        $0.setPlaceholderColor(UIColor.Watcha.gray300)
        $0.tintColor = UIColor.Watcha.pink
        
        $0.layer.cornerRadius = 10
        $0.addLeftPadding(15)
        
        $0.autocapitalizationType = .none
        $0.spellCheckingType = .no
        $0.autocorrectionType = .no
    }
    
    private let confirmButton = UIButton().then {
        $0.setTitle("완료", for: .normal)
        $0.titleLabel?.font = UIFont.Watcha.medium
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = UIColor.Watcha.gray600
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(confirmButtonDidTap), for: .touchUpInside)
    }
    
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
            $0.leading.equalToSuperview().inset(24)
        }
        nicknameTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(19)
            $0.horizontalEdges.equalToSuperview().inset(31)
            $0.height.equalTo(47)
        }
        confirmButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(47)
            $0.horizontalEdges.equalToSuperview().inset(22)
            $0.height.equalTo(56)
        }
    }
    
    @objc private func confirmButtonDidTap() {
        if let nickname = nicknameTextField.text {
            delegate?.setNickname(nickname: nickname)
        }
        
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
