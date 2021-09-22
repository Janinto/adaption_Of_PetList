//
//  BountyInfo.swift
//  BountyList
//
//  Created by Choyunje on 2021/09/22.
//

import UIKit

struct BountyInfo {
    let name: String
    let bounty: String
    
    var image: UIImage? {
        return UIImage(named: "\(name).jpg")
    }
    
    init(name: String, bounty: String) {
        self.name = name
        self.bounty = bounty
    }
}
