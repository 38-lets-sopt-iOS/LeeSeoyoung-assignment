//
//  CustomTabBar.swift
//  SOPT38-assignment
//
//  Created by Seoyoung Lee on 5/1/26.
//

import UIKit

import Then
import SnapKit

protocol CustomTabBarDelegate: AnyObject {
    func customTabBar(_ tabBar: CustomTabBar, didSelectAt index: Int)
}

final class CustomTabBar: UIView {

    weak var delegate: CustomTabBarDelegate?
    private var items: [TabItemView] = []

    private let stackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
    }

    private let tabData: [(unselected: UIImage?, selected: UIImage?)] = [
        (.unselectedSubscribtion, .selectedSubscribtion),
        (.unselectedPurchase, .selectedPurchase),
        (.unselectedWebtoon, .selectedWebtoon),
        (.unselectedSearch, .selectedSearch),
        (.unselectedLibrary, .selectedLibrary)
    ]

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        backgroundColor = .black

        addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(99)
        }

        tabData.enumerated().forEach { index, data in
            let item = TabItemView(unselected: data.unselected, selected: data.selected)
            item.tag = index
            item.addTarget(self, action: #selector(itemTapped(_:)), for: .touchUpInside)
            stackView.addArrangedSubview(item)
            items.append(item)
        }

        select(at: 0)
    }

    @objc private func itemTapped(_ sender: TabItemView) {
        select(at: sender.tag)
        delegate?.customTabBar(self, didSelectAt: sender.tag)
    }

    func select(at index: Int) {
        items.enumerated().forEach { i, item in
            item.setSelected(i == index)
        }
    }
}

final class TabItemView: UIControl {

    private let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.isUserInteractionEnabled = false
    }

    private let normalImage: UIImage?
    private let selectedImage: UIImage?

    init(unselected: UIImage?, selected: UIImage?) {
        self.normalImage = unselected?.withRenderingMode(.alwaysOriginal)
        self.selectedImage = selected?.withRenderingMode(.alwaysOriginal)
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(50)
        }
    }

    func setSelected(_ selected: Bool) {
        imageView.image = selected ? selectedImage : normalImage
    }
}
