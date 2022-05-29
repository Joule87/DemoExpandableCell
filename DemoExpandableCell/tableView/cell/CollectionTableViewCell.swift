//
//  CollectionTableViewCell.swift
//  DemoExpandableCell
//
//  Created by Julio Collado on 28/5/22.
//

import UIKit

class CollectionTableViewCell: UITableViewCell {
    
    static let identifier = "CollectionTableViewCell"
    static var nib: UINib {
        UINib(nibName: Self.identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

 
    
}
