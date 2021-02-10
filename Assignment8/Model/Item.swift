//
//  Item.swift
//  Assignment8
//
//  Created by Kazunobu Someya on 2021-02-08.
//

import Foundation
import UIKit

enum Item: Hashable {
    case category(String)
    case details(RestaurantDetail)
    
    var category: String? {
        if case .category(let category) = self {
            return category
        } else {
            return nil
        }
    }
    
    var details: RestaurantDetail? {
        if case .details(let details) = self {
            return details
        } else {
            return nil
        }
    }
    
    static let categories: [Item] = [
        .category("Asia"),
        .category("Europe"),
        .category("Italian"),
        .category("Noodle"),
        .category("Meat"),
        .category("Fish"),
        .category("Africa"),
        .category("Turkish"),
        .category("Japanese"),
        .category("Chinese")
    ]
    
    static let details: [Item] = [
        .details(RestaurantDetail(image: UIImage(named: "tafelspitz")!, name: "Figul Müller", categories: [.europe,.meat])),
        .details(RestaurantDetail(image: UIImage(named: "beef_pho")!, name: "Pho24", categories: [.asia,.noodle,.meat])),
        .details(RestaurantDetail(image: UIImage(named: "halski")!, name: "Prašná Bašta", categories: [.europe,.meat])),
        .details(RestaurantDetail(image: UIImage(named: "kofute")!, name: "Kofute stand", categories: [.europe,.turkish,.meat])),
        .details(RestaurantDetail(image: UIImage(named: "kumamoto_ramen")!, name: "Kokutei", categories: [.asia,.japanese,.noodle])),
        .details(RestaurantDetail(image: UIImage(named: "mapo_tofu")!, name: "Chen Mapo Tofu Restaurant", categories: [.asia,.chinese])),
        .details(RestaurantDetail(image: UIImage(named: "nacchipokung")!, name: "Kemichip", categories: [.asia,.fish])),
        .details(RestaurantDetail(image: UIImage(named: "paella")!, name: "Barcelona", categories: [.europe,.fish])),
        .details(RestaurantDetail(image: UIImage(named: "rippchen")!, name: "Keller", categories: [.europe,.meat])),
        .details(RestaurantDetail(image: UIImage(named: "toriten")!, name: "Toriten House", categories: [.asia,.japanese,.meat]))
    ]
}
