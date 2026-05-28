//
//  NewContentCollectionViewCell.swift
//  SOPT38-assignment
//
//  Created by Seoyoung Lee on 5/1/26.
//

import UIKit

import Then
import SnapKit

final class NewContentCollectionViewCell: UICollectionViewCell {

    static let identifier = "NewContentCollectionViewCell"

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
        posterImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let posterImageView = UIImageView().then {
        $0.image = .newPoster1
    }

    func dataBind(_ model: NewContentModel) {
        posterImageView.image = model.posterImg
    }
}
