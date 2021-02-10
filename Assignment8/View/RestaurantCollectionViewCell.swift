//
//  RestaurantCollectionViewCell.swift
//  Assignment8
//
//  Created by Kazunobu Someya on 2021-02-05.
//

import UIKit

class RestaurantCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "RestaurantCollectionViewCell"
    
    let view: UIView = {
        let vw = UIView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.heightAnchor.constraint(equalToConstant: 100).isActive = true
        vw.widthAnchor.constraint(equalToConstant: 200).isActive = true
        return vw
    }()
    
    let label: UILabel = {
        let lb = UILabel()
        lb.textAlignment = .center
        lb.layer.cornerRadius = 10
        return lb
    }()
    
    let categoryLabel: UILabel = {
        let cateLb = UILabel()
        cateLb.textAlignment = .center
        return cateLb
    }()
    
    lazy var VstackView: UIStackView = {
        let Vstack = UIStackView(arrangedSubviews: [view,label,categoryLabel])
        Vstack.axis = .vertical
        Vstack.distribution = .fill
        Vstack.alignment = .leading
        Vstack.spacing = 3
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
        VstackView.translatesAutoresizingMaskIntoConstraints = false 
        VstackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        VstackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        VstackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        VstackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
    
    func configureCell(_ details: RestaurantDetail) {
        let image = details.image
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        imageView.image =  image
        view.addSubview(imageView)
        label.text = details.name
        var str = ""
        for cate in details.categories {
            str += "\(cate.rawValue)   "
        }
        categoryLabel.text = str
    }
}
