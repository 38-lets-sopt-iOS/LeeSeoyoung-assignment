//
//  Header.swift
//  SOPT38-assignment
//
//  Created by Seoyoung Lee on 5/1/26.
//

import UIKit

import SnapKit
import Then

class Header: UIView {
    
    private let titleLabel = UILabel().then {
        $0.text = "구독"
        $0.textColor = .white
        $0.font = UIFont.Watcha.head1
    }
    
    private let videoButton = UIButton().then {
        $0.setImage(.video, for: .normal)
    }
    
    private let notificationButton = UIButton().then {
        $0.setImage(.notification, for: .normal)
    }
    
    private let profileButton = UIButton().then {
        $0.setImage(.profile, for: .normal)
    }

    private let bottomLine = UIView().then {
        $0.backgroundColor = UIColor.Watcha.gray600
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        [titleLabel, videoButton, notificationButton, profileButton, bottomLine].forEach{self.addSubview($0)}
        self.backgroundColor = .black
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(28)
            $0.top.equalToSuperview().inset(100)
        }
        profileButton.snp.makeConstraints {
            $0.size.equalTo(24)
            $0.trailing.equalToSuperview().inset(30)
            $0.top.equalToSuperview().inset(61)
        }
        notificationButton.snp.makeConstraints {
            $0.size.equalTo(24)
            $0.trailing.equalTo(profileButton.snp.leading).offset(-20)
            $0.top.equalToSuperview().inset(61)
        }
        videoButton.snp.makeConstraints {
            $0.size.equalTo(24)
            $0.trailing.equalTo(notificationButton.snp.leading).offset(-20)
            $0.top.equalToSuperview().inset(61)
        }

        bottomLine.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
