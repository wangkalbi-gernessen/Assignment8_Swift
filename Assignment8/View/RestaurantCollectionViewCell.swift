//
//  RestaurantCollectionViewCell.swift
//  Assignment8
//
//  Created by Kazunobu Someya on 2021-02-05.
//

import UIKit

class RestaurantCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "RestaurantCollectionViewCell"
    
    let imageView: UIImageView = {
        let igv = UIImageView()
        igv.contentMode = .scaleAspectFill
        igv.clipsToBounds = true
        igv.backgroundColor = .blue
        return igv
    }()
    
    let label: UILabel = {
        let lb = UILabel()
        lb.textAlignment = .left
        lb.numberOfLines = 0
        lb.layer.cornerRadius = 10
        lb.font = UIFont.boldSystemFont(ofSize: 20.0)
        return lb
    }()
    
    let categoryLabel: UILabel = {
        let cateLb = UILabel()
        cateLb.textAlignment = .center
        cateLb.font = UIFont(name: "Georgia", size: 15.0)
        return cateLb
    }()
    
    lazy var VstackView: UIStackView = {
        let Vstack = UIStackView(arrangedSubviews: [imageView,label,categoryLabel])
        Vstack.axis = .vertical
        Vstack.distribution = .fill
        Vstack.alignment = .leading
        Vstack.spacing = 0
        return Vstack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(VstackView)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        imageView.widthAnchor.constraint(equalTo: VstackView.widthAnchor, multiplier: 1).isActive = true
        imageView.heightAnchor.constraint(equalTo: VstackView.heightAnchor, multiplier: 1/2).isActive = true
        VstackView.translatesAutoresizingMaskIntoConstraints = false 
        VstackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        VstackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        VstackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        VstackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
    
    func configureCell(_ details: RestaurantDetail) {
        let image = details.image
        imageView.image =  image
        label.text = details.name
        var str = ""
        for cate in details.categories {
            str += "\(cate.rawValue) "
        }
        categoryLabel.text = str
    }
}
