//
//  WelcomeViewController.swift
//  SOPT38-assignment
//
//  Created by Seoyoung Lee on 4/23/26.
//

import UIKit
import SnapKit

class WelcomeViewController: UIViewController {
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.Watcha.logo
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "??님\n가입을 환영합니다!"
        label.font = UIFont.Watcha.head2
        label.textColor = UIColor.Watcha.white
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    private let mainButton: UIButton = {
        let button = UIButton()
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(UIColor.Watcha.white, for: .normal)
        button.titleLabel?.font = UIFont.Watcha.medium
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor.Watcha.pink
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.Watcha.black
        setUI()
        setLayout()
    }
    
    private func setUI() {
        [logoImageView, welcomeLabel, mainButton].forEach{self.view.addSubview($0)}
        
    }
    
    private func setLayout() {
        logoImageView.snp.makeConstraints{
            $0.left.right.equalToSuperview().inset(28)
            $0.top.equalToSuperview().inset(85)
        }
        welcomeLabel.snp.makeConstraints{
            $0.top.equalTo(logoImageView.snp.bottom).offset(54)
            $0.centerX.equalToSuperview()
        }
        mainButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(47)
            $0.left.right.equalToSuperview().inset(21)
            $0.height.equalTo(56)
        }
    }
}
