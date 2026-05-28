//
//  MainViewController.swift
//  SOPT38-assignment
//
//  Created by Seoyoung Lee on 5/1/26.
//

import UIKit

import Then
import SnapKit

class MainViewController: UIViewController {

    // MARK: - Section

    enum Section: Int, CaseIterable {
        case mainPoster
        case newContent
        case watgorithm
        case release
        case watchaParty
    }

    // MARK: - UI

    private let header = Header()

    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: makeLayout()).then {
        $0.backgroundColor = .black
        $0.showsVerticalScrollIndicator = false
        $0.clipsToBounds = false
    }

    // MARK: - Data

    private var mainPosterList = MainPosterModel.dummy()
    private var newContentList = NewContentModel.dummy()
    private var watgorithmList = WatgorithmModel.dummy()
    private var releaseList = ReleaseModel.dummy()
    private var watchaPartyList = WatchaPartyModel.dummy()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        register()
        setDelegate()
    }

    private func setUI() {
        [header, collectionView].forEach { view.addSubview($0) }
        view.bringSubviewToFront(header)
    }

    private func setLayout() {
        header.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(151)
        }
        collectionView.snp.makeConstraints {
            $0.top.equalTo(header.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview().inset(99)
        }
    }

    private func register() {
        collectionView.register(MainPosterCollectionViewCell.self, forCellWithReuseIdentifier: MainPosterCollectionViewCell.identifier)
        collectionView.register(NewContentCollectionViewCell.self, forCellWithReuseIdentifier: NewContentCollectionViewCell.identifier)
        collectionView.register(WatgorithmCollectionViewCell.self, forCellWithReuseIdentifier: WatgorithmCollectionViewCell.identifier)
        collectionView.register(ReleaseCollectionViewCell.self, forCellWithReuseIdentifier: ReleaseCollectionViewCell.identifier)
        collectionView.register(WatchaPartyCollectionViewCell.self, forCellWithReuseIdentifier: WatchaPartyCollectionViewCell.identifier)
        collectionView.register(SectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeaderView.identifier)
    }

    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: - Compositional Layout

extension MainViewController {

    private func makeLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            switch Section(rawValue: sectionIndex) {
            case .mainPoster: return self?.makeCarouselSection()
            case .newContent: return self?.makeNewContentSection()
            case .watgorithm: return self?.makeWatgorithmSection()
            case .release: return self?.makeReleaseSection()
            case .watchaParty: return self?.makeWatchaPartySection()
            default: return nil
            }
        }
    }

    private func makeCarouselSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        )
        let interItemSpacing: CGFloat = 15
        let peekWidth: CGFloat = 40
        var cellWidth: CGFloat {
            UIScreen.main.bounds.width - 2 * peekWidth - 2 * interItemSpacing
        }
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(widthDimension: .absolute(cellWidth), heightDimension: .absolute(399)),
            subitems: [item]
        )
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.interGroupSpacing = interItemSpacing
        section.contentInsets = NSDirectionalEdgeInsets(top: 28, leading: 0, bottom: 40, trailing: 0)
        return section
    }

    private func makeSectionHeader(leadingInset: CGFloat) -> NSCollectionLayoutBoundarySupplementaryItem {
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(60)
        )
        return NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top,
            absoluteOffset: CGPoint(x: -leadingInset, y: 0)
        )
    }

    private func makeNewContentSection() -> NSCollectionLayoutSection {
        let leadingInset: CGFloat = 21
        let interItemSpacing: CGFloat = 12
        let peekWidth: CGFloat = 15
        let cellWidth = UIScreen.main.bounds.width - 2 * peekWidth - 2 * interItemSpacing

        let item = NSCollectionLayoutItem(
            layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(widthDimension: .absolute(cellWidth), heightDimension: .absolute(180)),
            subitems: [item]
        )
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.interGroupSpacing = interItemSpacing
        section.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: leadingInset, bottom: 40, trailing: 0)
        section.boundarySupplementaryItems = [makeSectionHeader(leadingInset: leadingInset)]
        return section
    }

    private func makeWatgorithmSection() -> NSCollectionLayoutSection {
        let leadingInset: CGFloat = 21

        let item = NSCollectionLayoutItem(
            layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(widthDimension: .absolute(103), heightDimension: .absolute(153)),
            subitems: [item]
        )
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 13
        section.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: leadingInset, bottom: 40, trailing: 0)
        section.boundarySupplementaryItems = [makeSectionHeader(leadingInset: leadingInset)]
        return section
    }

    private func makeReleaseSection() -> NSCollectionLayoutSection {
        let leadingInset: CGFloat = 21

        let item = NSCollectionLayoutItem(
            layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(widthDimension: .absolute(103), heightDimension: .absolute(153)),
            subitems: [item]
        )
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 13
        section.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: leadingInset, bottom: 40, trailing: 0)
        section.boundarySupplementaryItems = [makeSectionHeader(leadingInset: leadingInset)]
        return section
    }

    private func makeWatchaPartySection() -> NSCollectionLayoutSection {
        let leadingInset: CGFloat = 21

        let item = NSCollectionLayoutItem(
            layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(widthDimension: .absolute(196), heightDimension: .absolute(185)),
            subitems: [item]
        )
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 12
        section.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: leadingInset, bottom: 40, trailing: 0)
        section.boundarySupplementaryItems = [makeSectionHeader(leadingInset: leadingInset)]
        return section
    }
}

// MARK: - UICollectionViewDataSource

extension MainViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        Section.allCases.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch Section(rawValue: section) {
        case .mainPoster: return mainPosterList.count
        case .newContent: return newContentList.count
        case .watgorithm: return watgorithmList.count
        case .release: return releaseList.count
        case .watchaParty: return watchaPartyList.count
        default: return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch Section(rawValue: indexPath.section) {
        case .mainPoster:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainPosterCollectionViewCell.identifier, for: indexPath) as? MainPosterCollectionViewCell else { return UICollectionViewCell() }
            cell.dataBind(mainPosterList[indexPath.row])
            return cell
        case .newContent:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewContentCollectionViewCell.identifier, for: indexPath) as? NewContentCollectionViewCell else { return UICollectionViewCell() }
            cell.dataBind(newContentList[indexPath.row])
            return cell
        case .watgorithm:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WatgorithmCollectionViewCell.identifier, for: indexPath) as? WatgorithmCollectionViewCell else { return UICollectionViewCell() }
            cell.dataBind(watgorithmList[indexPath.row])
            return cell
        case .release:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReleaseCollectionViewCell.identifier, for: indexPath) as? ReleaseCollectionViewCell else { return UICollectionViewCell() }
            cell.dataBind(releaseList[indexPath.row])
            return cell
        case .watchaParty:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WatchaPartyCollectionViewCell.identifier, for: indexPath) as? WatchaPartyCollectionViewCell else { return UICollectionViewCell() }
            cell.dataBind(watchaPartyList[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader,
              let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeaderView.identifier, for: indexPath) as? SectionHeaderView
        else { return UICollectionReusableView() }

        switch Section(rawValue: indexPath.section) {
        case .newContent:
            header.configure(title: .text("방금 막 도착한 신상 컨텐츠"), subtitle: "예능부터 드라마까지!")
        case .watgorithm:
            header.configure(title: .image(.watgorithm), subtitle: "예능부터 드라마까지!")
        case .release:
            header.configure(title: .text("공개 예정 컨텐츠"))
        case .watchaParty:
            header.configure(title: .text("왓챠 파티"))
        default:
            break
        }
        return header
    }
}

// MARK: - UICollectionViewDelegate

extension MainViewController: UICollectionViewDelegate {}
