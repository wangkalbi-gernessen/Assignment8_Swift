//
//  CategoryFilterCollectionViewCell.swift
//  Assignment8
//
//  Created by Kazunobu Someya on 2021-02-07.
//

import UIKit

class CategoryFilterCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "CategoryFilterCollectionViewCell"
    
    let label: UILabel = {
        let lb = UILabel()
        lb.textAlignment = .center
        lb.layer.cornerRadius = 10
        lb.numberOfLines = 0
        lb.textColor = UIColor(hexString: "#99ccff")
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(label)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
}
