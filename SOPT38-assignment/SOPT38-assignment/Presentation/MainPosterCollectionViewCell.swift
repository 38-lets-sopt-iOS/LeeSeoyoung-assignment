//
//  MainPosterCollectionViewCell.swift
//  SOPT38-assignment
//
//  Created by Seoyoung Lee on 5/1/26.
//

import UIKit

import Then
import SnapKit

class MainPosterCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MainPosterCollectionViewCell"

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
        $0.image = .mainPoster1
    }
}

extension MainPosterCollectionViewCell {
    func dataBind(_ mainPosterData: MainPosterModel) {
        posterImageView.image = mainPosterData.posterImg
    }
}
