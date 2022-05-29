//
//  ModelBuilder.swift
//  DemoExpandableCell
//
//  Created by Julio Collado on 28/5/22.
//

import UIKit

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
