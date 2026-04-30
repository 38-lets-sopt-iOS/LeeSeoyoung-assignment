//
//  WelcomeViewController.swift
//  SOPT38-assignment
//
//  Created by Seoyoung Lee on 4/23/26.
//

import UIKit
import SnapKit
import Then

class WelcomeViewController: UIViewController {
    
    private var nickname: String?
    
    private let logoImageView = UIImageView().then {
        $0.image = UIImage.Watcha.logo
        $0.contentMode = .scaleAspectFit
    }
    
    private let welcomeLabel = UILabel().then {
        $0.text = "??님\n가입을 환영합니다!"
        $0.font = UIFont.Watcha.head2
        $0.textColor = UIColor.Watcha.white
        $0.numberOfLines = 2
        $0.textAlignment = .center
    }
    
    private let mainButton = UIButton().then {
        $0.setTitle("메인으로", for: .normal)
        $0.setTitleColor(UIColor.Watcha.white, for: .normal)
        $0.titleLabel?.font = UIFont.Watcha.medium
        $0.layer.cornerRadius = 10
        $0.backgroundColor = UIColor.Watcha.pink
        $0.addTarget(self, action: #selector(mainButtonDidTap), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.Watcha.black
        setUI()
        setLayout()
    }
    
    func setLabelText(nickname: String?) {
        self.nickname = nickname
        
        if let nickname = nickname {
            welcomeLabel.text = "\(nickname)님\n가입을 환영합니다!"
        }
    }
    
    private func setUI() {
        [logoImageView, welcomeLabel, mainButton].forEach{self.view.addSubview($0)}
        
    }
    
    private func setLayout() {
        logoImageView.snp.makeConstraints{
            $0.horizontalEdges.equalToSuperview().inset(28)
            $0.top.equalToSuperview().inset(85)
        }
        welcomeLabel.snp.makeConstraints{
            $0.top.equalTo(logoImageView.snp.bottom).offset(54)
            $0.centerX.equalToSuperview()
        }
        mainButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(47)
            $0.horizontalEdges.equalToSuperview().inset(21)
            $0.height.equalTo(56)
        }
    }
    
    @objc private func mainButtonDidTap() {
        let mainVC = MainViewController()
        
        // navigation stack을 아예 교체
        self.navigationController?.setViewControllers([mainVC], animated: true)
    }
}
