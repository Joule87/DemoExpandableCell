//
//  ViewController.swift
//  DemoExpandableCell
//
//  Created by Julio Collado on 28/5/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(StandardTableViewCell.nib, forCellReuseIdentifier: StandardTableViewCell.identifier)
            tableView.register(CollectionTableViewCell.nib, forCellReuseIdentifier: CollectionTableViewCell.identifier)
        }
    }
    
    let data: [MaimModel] = [.dog(dogList: ModelBuilder.dogCards), .dummy(dummyData: ModelBuilder.dummyData)]
    var selectedDogCard: IndexPath?
    var selectedDummyData: IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionContent = data[section]
        switch sectionContent {
        case .dog(dogList: let dog):
            return dog.count
        case .dummy(dummyData: let dummyData):
            return dummyData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionContent = data[indexPath.section]
        switch sectionContent {
        case .dog(dogList: let dog):
            let dogContent = dog[indexPath.row]
            return UITableViewCell ()
        case .dummy(dummyData: let dummyData):
            return dummyDataCell(tableView, cellForRowAt: indexPath, model: dummyData[indexPath.row])
        }
    }
    
    private func dummyDataCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, model: StandardTableViewCellModel) -> StandardTableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StandardTableViewCell.identifier, for: indexPath) as? StandardTableViewCell else {
            preconditionFailure()
        }
        cell.indexPath = indexPath
        cell.delegate = self
        cell.set(with: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let sectionContent = data[indexPath.section]
        switch sectionContent {
        case .dog(dogList: _):
            return 0
        case .dummy(dummyData: _):
            return getDummyDataCellHeight(indexPath: indexPath)
        }
    }
    
    private func collectionViewCell () {
        
    }
    
    private func getDummyDataCellHeight(indexPath: IndexPath) -> CGFloat {
        guard let selectedDummyData = selectedDummyData else {
            return 80
        }
        
        return indexPath.row == selectedDummyData.row ? 150 : 80
    }
    
    
}

//MARK: - StandardTableViewCellDelegate
extension ViewController: StandardTableViewCellDelegate {
    func didTap(indexPath: IndexPath?) {
        if selectedDummyData?.row == indexPath?.row {
            return
        }
        
        selectedDummyData = indexPath
        guard let selectedIndex = selectedDummyData else {
            return
        }
        tableView.reloadRows(at: [selectedIndex], with: .none)
    }
}


struct ImageCard {
    let title: String
    let description: String
    let imageName: String
}


struct StandardTableViewCellModel {
    let backgroundColor: UIColor
    let title: String?
    let subTitle: String?
}

struct ModelBuilder {
    private static let card1 = ImageCard(title: "Title1", description: "Some day to run", imageName: "dog1")
    private static let card2 = ImageCard(title: "Title2", description: "nice done", imageName: "dog2")
    private static let card3 = ImageCard(title: "Title3", description: "welcome to the cinema", imageName: "dog3")
    
    private static let dummyData1 = StandardTableViewCellModel(backgroundColor: .lightGray, title: "No better day", subTitle: "with subs")
    private static let dummyData2 = StandardTableViewCellModel(backgroundColor: .lightGray, title: "hello word", subTitle: "come to the ground")
    private static let dummyData3 = StandardTableViewCellModel(backgroundColor: .lightGray, title: "Sugar plus", subTitle: "Ban ban team")
    
    static let dogCards: [ImageCard] = [Self.card1, Self.card2, Self.card3]
    static let dummyData: [StandardTableViewCellModel] = [Self.dummyData1, Self.dummyData2, Self.dummyData3]
    
}


enum MaimModel {
    case dog(dogList:  [ImageCard])
    case dummy(dummyData:  [StandardTableViewCellModel])
}
