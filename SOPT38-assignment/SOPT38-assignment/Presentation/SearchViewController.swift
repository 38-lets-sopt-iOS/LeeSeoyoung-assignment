//
//  SearchViewController.swift
//  SOPT38-assignment
//
//  Created by Seoyoung Lee on 5/1/26.
//

import UIKit

import Then
import SnapKit

class SearchViewController: UIViewController {
    private let tempLabel = UILabel().then {
        $0.text = "찾기 페이지입니다"
        $0.textColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
    
    private func setUI() {
        view.backgroundColor = .black
        [tempLabel].forEach{self.view.addSubview($0)}
    }
    private func setLayout() {
        tempLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
