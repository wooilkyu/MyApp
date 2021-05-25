//
//  BountyInfo.swift
//  BountyList2
//
//  Created by 우일규 on 2021/04/25.
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
