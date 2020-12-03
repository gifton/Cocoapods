//
//  TrackListViewController.swift
//  Cocoapods
//
//  Created by Gifton on 12/2/20.
//  Copyright © 2020 Javier. All rights reserved.
//

import UIKit

@objc public class TrackListViewController: UIViewController {

    
    init() {
        super.init(nibName: nil, bundle: nil)
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    unowned var trackList: ItunesTrackViewModel {
        ItunesTrackViewModel()
    }
    
    
    deinit {
        
    }
    
    private var collectionView: UICollectionView!
    
    
    enum Section {
      case main
    }
    
    private var tracks: [TrackCellViewModel] = []
    
    
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, TrackCellViewModel>
    typealias DataSource = UICollectionViewDiffableDataSource<Section, TrackCellViewModel>
    
    private var contentDataSource: UICollectionViewDiffableDataSource<Section, TrackCellViewModel>! = nil
    

}

extension TrackListViewController: UISearchBarDelegate {
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        trackList.search(for: searchBar.text!) { (tracks, error) in
            (error == nil) ?
            self.collectionView.reloadData()
                : self.trackList.cancelRequest()
        }
    }
}

extension TrackListViewController: UICollectionViewDelegate {}

private extension TrackListViewController {
    
    
    func setView(){
        
        collectionView = UICollectionView(frame: Device.frame, collectionViewLayout: generateLayout())
        collectionView.registerReusableView(SearchHeader.self, kind: UICollectionView.elementKindSectionHeader)
        collectionView.registerCell(TrackListCell.self)
        collectionView.isPrefetchingEnabled = false
        collectionView.delegate = self
        collectionView.backgroundColor = .black
        collectionView.contentInsetAdjustmentBehavior = .always
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.showsVerticalScrollIndicator = false
        configureDataSource()
        collectionView.dataSource = contentDataSource
        view.addSubview(collectionView)
        
        
        trackList.search(for: "Drake") { (tracks, err) in
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
        }
    }
    
    // collectionview layout with header
    func generateLayout() -> UICollectionViewLayout {
        
        // number of items
        let displayableItems = [NSCollectionLayoutItem](repeating: collectionCellLayoutItemAttributes, count: trackList.tracks.count)
        
        // size (width and set height
        let nestedGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(55.0)),
            subitems: displayableItems
        )
        
        // header size
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(180)
        )
        
        // header
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        
        // build layout
        let section = NSCollectionLayoutSection(group: nestedGroup)
        section.boundarySupplementaryItems = [sectionHeader]
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
    
    var collectionCellLayoutItemAttributes: NSCollectionLayoutItem {
        let sequenceItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(1/3)),
            supplementaryItems: []
        )
        
        sequenceItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        return sequenceItem
    }
    
    func configureDataSource() {
        
        contentDataSource = DataSource(
            collectionView: collectionView,
            cellProvider: { (collectionView, indexPath, vm) -> UICollectionViewCell in
                let cell = collectionView.dequeueReusableCell(withClass: TrackListCell.self, for: indexPath)
                cell.setWith(viewModel: vm)
                return cell
            }
            
        )
        
        var snapshot = Snapshot()
        
        snapshot.appendSections([.main])
        snapshot.appendItems(trackList.tracks, toSection: .main)
        contentDataSource.supplementaryViewProvider = {
            (collectionView: UICollectionView, kind: String, indexPath: IndexPath) -> UICollectionReusableView? in
            if kind == UICollectionView.elementKindSectionHeader {
                let head = collectionView.dequeueReusableHeader(cellWithClass: SearchHeader.self, for: indexPath)
                head.searchBar?.delegate = self

                return head
            }
            
            return nil
        }
        
        contentDataSource.apply(snapshot)
        
    }
}
