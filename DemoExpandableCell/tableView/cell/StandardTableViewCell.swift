//
//  StandardTableViewCell.swift
//  DemoExpandableCell
//
//  Created by Julio Collado on 28/5/22.
//

import UIKit

class StandardTableViewCell: UITableViewCell {
    
    static let identifier = "StandardTableViewCell"
    static var nib: UINib {
        UINib(nibName: Self.identifier, bundle: nil)
    }
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.layer.cornerRadius = 10
            containerView.clipsToBounds = true
        }
    }
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    var delegate: StandardTableViewCellDelegate?
    var indexPath: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.addGestureRecognizer(gestureRecognizer)
    }
    
    func set(with model: StandardTableViewCellModel) {
        containerView.backgroundColor = model.backgroundColor
        titleLabel.text = model.title
        subTitleLabel.text = model.subTitle
        animate()
    }
    
    private func animate() {
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
    }
    
    @objc private  func handleTap() {
        delegate?.didTap(indexPath: indexPath)
    }
    
}

protocol StandardTableViewCellDelegate {
    func didTap(indexPath: IndexPath?)
}
