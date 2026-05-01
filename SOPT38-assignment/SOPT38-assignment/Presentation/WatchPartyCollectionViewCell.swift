//
//  WatchPartyCollectionViewCell.swift
//  SOPT38-assignment
//
//  Created by Seoyoung Lee on 5/1/26.
//

import UIKit

import Then
import SnapKit

class WatchaPartyCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "WatchaPartyCollectionViewCell"

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let posterImageView = UIImageView().then {
        $0.image = .party1
    }
    
    private let scheduleLabel = UILabel().then {
        $0.font = UIFont.Watcha.body1
        $0.textColor = .pink
    }
    
    private let titleLabel = UILabel().then {
        $0.font = UIFont.Watcha.subhead3
        $0.textColor = .white
    }
    
    private let alarmButton = UIButton().then {
        $0.setImage(.alarm, for: .normal)
    }
    
    private func setUI() {
        self.backgroundColor = .gray600
        [posterImageView, scheduleLabel, titleLabel, alarmButton].forEach { self.addSubview($0) }
    }
    
    private func setLayout() {
        posterImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(139)
        }
        scheduleLabel.snp.makeConstraints {
            $0.top.equalTo(posterImageView.snp.bottom).offset(6)
            $0.leading.equalToSuperview().inset(8)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(scheduleLabel.snp.bottom).offset(6)
            $0.bottom.equalToSuperview().inset(7)
            $0.leading.equalToSuperview().inset(8)
        }
        alarmButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(7)
            $0.trailing.equalToSuperview().inset(5)
        }
    }
}

extension WatchaPartyCollectionViewCell {
    func dataBind(_ partyData: WatchaPartyModel) {
        posterImageView.image = partyData.posterImg
        scheduleLabel.text = "오늘 \(partyData.startTime)에 시작"
        titleLabel.text = "# \(partyData.title)"
        alarmButton.isSelected = partyData.isAlarmOn
    }
}
