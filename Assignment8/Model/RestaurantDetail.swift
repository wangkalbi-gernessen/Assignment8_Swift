//
//  RestaurantDetail.swift
//  Assignment8
//
//  Created by Kazunobu Someya on 2021-02-08.
//

import Foundation
import UIKit

struct RestaurantDetail: Hashable {
    var image: UIImage
    var name: String
    var categories: [Categories]
}

enum Categories: String,CaseIterable {
    case asia = "Asia"
    case europe = "Europe"
    case italian = "Italian"
    case noodle = "Noodle"
    case meat = "Meat"
    case fish = "Fish"
    case africa = "Africa"
    case turkish = "Turkish"
    case japanese = "Japanese"
    case chinese = "Chinese"
}
