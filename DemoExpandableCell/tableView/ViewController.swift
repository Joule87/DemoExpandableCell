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
