//
//  RestaurantCollectionViewController.swift
//  Assignment8
//
//  Created by Kazunobu Someya on 2021-02-04.
//

import UIKit

class RestaurantCollectionViewController: UICollectionViewController {
    // define section
    let sections:[Section] = [.category, .images]
    // define selectedIndex on category cell
    var selectedIndex: Int!
    // define empty array for
    var filteredItem: [Item] = []
    // define object of UICollectionViewDiffableDataSource
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    // create snapshot for filtered items
    var snapshot: NSDiffableDataSourceSnapshot<Section, Item> {
        var sp = NSDiffableDataSourceSnapshot<Section, Item>()
        sp.appendSections(Section.allCases)
        // create snapshot for filtered items
        sp.appendItems(Item.categories, toSection: .category)
        sp.appendItems(Item.details, toSection: .images)
        return sp
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor(hexString: "#d3d3d3")
        title = "My Restaurants"
        navigationController?.navigationBar.barTintColor = UIColor(hexString: "#99ccff")
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        // Register cell classes
        collectionView.register(CategoryFilterCollectionViewCell.self, forCellWithReuseIdentifier: CategoryFilterCollectionViewCell.reuseIdentifier)
        collectionView.register(RestaurantCollectionViewCell.self, forCellWithReuseIdentifier: RestaurantCollectionViewCell.reuseIdentifier)
        collectionView.setCollectionViewLayout(generateLayout(), animated: false)
        createDataSource()
    }
    
    // create data source for snapshot
    private func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, item) -> UICollectionViewCell? in
            let section = self.sections[indexPath.section]
            switch section {
            case .category:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryFilterCollectionViewCell.reuseIdentifier, for: indexPath) as! CategoryFilterCollectionViewCell
                cell.label.text = item.category
                cell.backgroundColor = .white
                return cell
            case .images:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RestaurantCollectionViewCell.reuseIdentifier, for: indexPath) as! RestaurantCollectionViewCell
                
                cell.configureCell(item.details!)
                cell.backgroundColor = .white
                return cell
            }
        })
        dataSource.apply(snapshot)
    }
    
    private func generateLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout
        { (sectionIndex, layoutEnvironment) ->
            NSCollectionLayoutSection? in
            let sectionType = self.sections[sectionIndex]
            
            switch sectionType {
            case .category:
                // create 1st section(filter tabs)
                let filterItems = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50)))
                filterItems.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                let filterGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .absolute(60)), subitems: [filterItems])
                let filterSection = NSCollectionLayoutSection(group: filterGroup)
                filterSection.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
                filterSection.interGroupSpacing = 10
                filterSection.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
                return filterSection
            case .images:
                // create 2nd section(Images)
                let ImageItems = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .absolute(200)))
                ImageItems.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)
                let ImageGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(1.7/2.0)), subitems: [ImageItems])
                let ImageSection = NSCollectionLayoutSection(group: ImageGroup)
                return ImageSection
            }
        }
        return layout
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sectionType = sections[indexPath.section]
        switch sectionType {
        case .category:
            selectedIndex = indexPath.item
            let selectedCategory = Item.categories[selectedIndex].category!
            
//            if let cell = collectionView.cellForItem(at: indexPath) {
//                cell.backgroundColor = cell.isSelected ? UIColor(hexString: "#99ccff") : .white
//                cell.tintColor = cell.isSelected ? .white : UIColor(hexString: "#99ccff")
//            }
            
            filteredItem = Item.details.filter {($0.details != nil)}.filter {$0.details!.categories.contains(Categories(rawValue: selectedCategory)!)}
            updateDataSource(filteredItem)
        case .images:
            break
        }
    }
    
    // update snapshot and datasource
    func updateDataSource(_ filteredItemArray: [Item]) {
        var updatedSnapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        updatedSnapshot.appendSections(Section.allCases)
        // create snapshot for filtered items
        updatedSnapshot.appendItems(Item.categories, toSection: .category)
        updatedSnapshot.appendItems(filteredItemArray, toSection: .images)
        dataSource.apply(updatedSnapshot)
    }
}
