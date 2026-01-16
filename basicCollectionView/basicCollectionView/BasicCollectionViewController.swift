//
//  BasicCollectionViewController.swift
//  BasicCollectionView
//
//  Created by GEU on 16/01/26.
//

import UIKit

private let reuseIdentifier = "Cell"

class BasicCollectionViewController: UICollectionViewController, UISearchResultsUpdating {
    
//    search
    let searchController = UISearchController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        search
        navigationItem.searchController = searchController
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        navigationItem.hidesSearchBarWhenScrolling = false
        
        let layout = generateLayout()
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
    
//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return filteredItems.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! BasicCollectionViewCell
        cell.label.text = filteredItems[indexPath.item]
        cell.backgroundColor = .systemRed
        return cell
    }
    
//    search
    func updateSearchResults(for searchController: UISearchController) {
        if let searchString = searchController.searchBar.text, searchString.isEmpty == false {
            filteredItems = items.filter { (item)-> Bool in
                item.localizedCaseInsensitiveContains(searchString)
            }
        } else {
            filteredItems = items
        }
        collectionView.reloadData()
    }
    
    
    private func generateLayout() -> UICollectionViewLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(70.0))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        
//        let layout = UICollectionViewCompositionalLayout(section: section)
        let spacing: CGFloat = 5.0
        group.contentInsets = NSDirectionalEdgeInsets(top: spacing, leading: spacing, bottom: 0, trailing: spacing)
        
        let section = NSCollectionLayoutSection(group: group)
        return UICollectionViewCompositionalLayout(section: section)
    }
}
