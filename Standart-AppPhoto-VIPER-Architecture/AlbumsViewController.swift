//
//  AlbumsViewController.swift
//  Standart-AppPhoto-VIPER-Architecture
//
//  Created by Артем on 15.09.2021.
//

import UIKit

protocol ViewProtocol {
    func updateModule(with data: [String: [ModelCellAlbums]]?)
}

class AlbumsViewController: UIViewController, ViewProtocol {
    
    // MARK: - Properties
    
    var presenter: PresenterProtocol?

    private var data: [String: [ModelCellAlbums]]?
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupNavigationBar()
        collectionView.collectionViewLayout = createCompositionalLayout()

        presenter?.moduleWasLoaded(with: self)
    }

    // MARK: - ViewProtocol

    func updateModule(with data: [String : [ModelCellAlbums]]?) {
        self.data = data
        collectionView.reloadData()
    }
    
    //MARK: - Setup
    
    private lazy var collectionView: UICollectionView = {

        let viewLayout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        
        collectionView.register(CellMyAlbums.self, forCellWithReuseIdentifier: "CellMyAlbums")
        collectionView.register(CellPeopleAndPlaces.self, forCellWithReuseIdentifier: "CellPeopleAndPlaces")
        collectionView.register(СellTypesOfMedia.self, forCellWithReuseIdentifier: "СellTypesOfMedia")
        
        collectionView.register(HeaderCellMyAlbums.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCellMyAlbums")
        
        collectionView.register(HeaderCellPeopleAndPlaces.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCellPeopleAndPlaces")
        
        collectionView.register(HeaderCellTypesOfMedia.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCellTypesOfMedia")
        
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    private func setupNavigationBar() {
        
        navigationItem.title = "Альбомы"
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .clear
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTappedNavigationBar))
    }
    
    //MARK: - Setup Layout
    
    private func setupLayout() {
        
        self.view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    //MARK: - Actions
    
    @objc private func addTappedNavigationBar() {
        print("Press button NavigationBar: AddTapped")
    }
}

extension AlbumsViewController {
    
    //MARK: - Settings Sections
    
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            
            switch sectionNumber {
            case 0: return self.layoutSectionCellAlbumsViewCell()
            case 1: return self.layoutSectionCellPeopleAndPlaces()
            case 2: return self.layoutSectionСellTypesOfMedia()
            default:
                return self.layoutSectionCellAlbumsViewCell()
            }
        }
    }
    
    private func layoutSectionCellAlbumsViewCell() -> NSCollectionLayoutSection {
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                heightDimension: .absolute(50))
        
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,elementKind: "HeaderCellMyAlbums",
            alignment: .top)
        
        sectionHeader.pinToVisibleBounds = true
        sectionHeader.zIndex = Int.max
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(UIScreen.main.bounds.width * 0.5),
            heightDimension: .absolute(UIScreen.main.bounds.width))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count:2)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                      leading: 0,
                                                      bottom: 60,
                                                      trailing: 0)
        group.interItemSpacing = .fixed(60)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.boundarySupplementaryItems = [sectionHeader]
        return section
    }
    
    private func layoutSectionCellPeopleAndPlaces() -> NSCollectionLayoutSection {
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                heightDimension: .absolute(50))
        
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,elementKind: "HeaderCellPeopleAndPlaces",
            alignment: .top)
        
        sectionHeader.pinToVisibleBounds = true
        sectionHeader.zIndex = Int.max
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(UIScreen.main.bounds.width * 0.5),
            heightDimension: .absolute(215))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count:1)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                      leading: 0,
                                                      bottom: 60,
                                                      trailing: 0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.boundarySupplementaryItems = [sectionHeader]
        return section
    }
    
    private func layoutSectionСellTypesOfMedia() -> NSCollectionLayoutSection {
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                heightDimension: .absolute(35))
        
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,elementKind: "HeaderСellTypesOfMedia",
            alignment: .top)
        
        sectionHeader.pinToVisibleBounds = true
        sectionHeader.zIndex = Int.max
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(UIScreen.main.bounds.width),
            heightDimension: .absolute(35))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                      leading: 0,
                                                      bottom: 0,
                                                      trailing: 0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [sectionHeader]
        
        return section
    }
}

// MARK: - UICollectionViewDelegate & Data Source

extension AlbumsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data?["Section\(section)"]?.count ?? 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard  let data = data?["Section\(indexPath.section)"]?[indexPath.row] else { return UICollectionViewCell() }
        
        switch data.type {
        case .cellMyAlbums:
            return setupCellMyAlbums(for: indexPath, with: data)
        case .cellPeopleAndPlaces:
            return setupCellPeopleAndPlaces(for: indexPath, with: data)
        case .cellTypesOfMedia:
            return setupСellTypesOfMedia(for: indexPath, with: data)
        }
    }
    
    private  func setupCellMyAlbums(for indexPath: IndexPath, with data: ModelCellAlbums) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellMyAlbums", for: indexPath) as? CellMyAlbums else { return UICollectionViewCell() }
        
        cell.titleLabel.text = data.titleLabel
        cell.titleImage = data.titleImage
        cell.titleCount.text = data.titleCount
        return cell
    }
    
    private  func setupCellPeopleAndPlaces(for indexPath: IndexPath, with data: ModelCellAlbums) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellPeopleAndPlaces", for: indexPath) as? CellPeopleAndPlaces else { return UICollectionViewCell() }
        
        cell.titleLabel.text = data.titleLabel
        cell.titleImage = data.titleImage
        cell.titleCount.text = data.titleCount
        return cell
    }
    
    private  func setupСellTypesOfMedia(for indexPath: IndexPath, with data: ModelCellAlbums) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "СellTypesOfMedia", for: indexPath) as? СellTypesOfMedia else { return UICollectionViewCell() }
        
        cell.titleLabel.text = data.titleLabel
        cell.titleImage = data.titleImage
        cell.titleCount.text = data.titleCount
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerCellMyAlbums =  collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCellMyAlbums", for: indexPath) as! HeaderCellMyAlbums
        
        let headerCellPeopleAndPlaces =  collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCellPeopleAndPlaces", for: indexPath) as! HeaderCellPeopleAndPlaces
        
        let headerСellTypesOfMedia =  collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCellTypesOfMedia", for: indexPath) as! HeaderCellTypesOfMedia
        
        guard  let data = data?["Section\(indexPath.section)"]?[indexPath.row] else { return UICollectionViewCell() }
        
        switch data.type {
        case .cellMyAlbums:
            headerCellMyAlbums.configure()
            return headerCellMyAlbums
        case .cellPeopleAndPlaces:
            headerCellPeopleAndPlaces.configure()
            return headerCellPeopleAndPlaces
        case .cellTypesOfMedia:
            headerСellTypesOfMedia.configure()
            return headerСellTypesOfMedia
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Press cell: \(String(describing: data?["Section\(indexPath.section)"]?[indexPath.row].titleLabel))")
    }
}

