//
//  FriendModel.swift
//  FirstExampleView
//
//  Created by Kraig Kistler on 1/9/24.
//  Copyright © 2024 Kraig Kistler. All rights reserved.
//

import SwiftData

@Model
class FriendModel {
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

extension FriendModel {
    
    @MainActor
    static var preview: ModelContainer {
        // FriendModel.self - The model definition you want included (This will almost always be the same as the model it is extending)
        // ModelConfiguration(isStoredInMemoryOnly: true) - The only setting you are really interested in for Previews is isStoredInMemoryOnly. This means that the mock data you add will not be persisted it will exit in memory only.
        let container = try! ModelContainer(for: FriendModel.self, 
                                            configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        // Add mock data
        container.mainContext.insert(FriendModel(firstName: "Jason", lastName: "Barlow"))
        container.mainContext.insert(FriendModel(firstName: "Jennie", lastName: "Willinson"))
        container.mainContext.insert(FriendModel(firstName: "Lauren", lastName: "Brady"))
        container.mainContext.insert(FriendModel(firstName: "Matthew", lastName: "Schultz"))
        
        return container
    }
}
