//
//  SectionHeaderView.swift
//  SOPT38-assignment
//
//  Created by Seoyoung Lee on 5/1/26.
//

import UIKit

import Then
import SnapKit

final class SectionHeaderView: UICollectionReusableView {

    static let identifier = "SectionHeaderView"

    enum Title {
        case text(String)
        case image(UIImage)
    }

    private let titleLabel = UILabel().then {
        $0.font = UIFont.Watcha.head3
        $0.textColor = .white
    }

    private let titleImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }

    private let subtitleLabel = UILabel().then {
        $0.font = UIFont.Watcha.subhead1
        $0.textColor = UIColor.Watcha.gray100
    }

    private lazy var stack = UIStackView(arrangedSubviews: [titleLabel, titleImageView, subtitleLabel]).then {
        $0.axis = .vertical
        $0.alignment = .leading
        $0.spacing = 3
    }
    
    private let moreButton = UIButton().then {
        $0.setTitle("더보기", for: .normal)
        $0.setTitleColor(.gray100, for: .normal)
        $0.titleLabel?.font = UIFont.Watcha.cap1
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(stack)
        addSubview(moreButton)
        stack.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(21)
            $0.verticalEdges.equalToSuperview()
        }
        moreButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(22)
            $0.centerY.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(title: Title, subtitle: String? = nil) {
        switch title {
        case .text(let str):
            titleLabel.text = str
            titleLabel.isHidden = false
            titleImageView.isHidden = true
        case .image(let img):
            titleImageView.image = img
            titleImageView.isHidden = false
            titleLabel.isHidden = true
        }
        subtitleLabel.text = subtitle
        subtitleLabel.isHidden = subtitle == nil
    }
}
