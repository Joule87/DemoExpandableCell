//
//  CardCollectionViewCell.swift
//  DemoExpandableCell
//
//  Created by Julio Collado on 28/5/22.
//

import UIKit

class CardCollectionViewCell: UITableViewCell {
    
    static let identifier = "CardCollectionViewCell"
    static var nib: UINib {
        UINib(nibName: Self.identifier, bundle: nil)
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func set(with model: ImageCard) {
        titleLabel.text = model.title
        subTitleLabel.text = model.description
        imageView?.image = UIImage(named: model.imageName)
    }
    
}
