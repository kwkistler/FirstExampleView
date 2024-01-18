//
//  MockData_InPreview.swift
//  FirstExampleView
//
//  Created by Kraig Kistler on 1/17/24.
//  Copyright © 2024 Kraig Kistler. All rights reserved.
//

import SwiftData
import SwiftUI

struct MockData_InPreview: View {
    @Query private var friends: [FriendModel]
    
    var body: some View {
        List(friends) { friend in
            HStack {
                Text(friend.firstName)
                Text(friend.lastName)
            }
        }
        .font(.title)
    }
}

#Preview {
    let container = try! ModelContainer(for: FriendModel.self,
                                       configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    
    container.mainContext.insert(FriendModel(firstName: "Jason", lastName: "Barlow"))
    container.mainContext.insert(FriendModel(firstName: "Jennie", lastName: "Wilkinson"))
    container.mainContext.insert(FriendModel(firstName: "Lauren", lastName: "Brady"))
    container.mainContext.insert(FriendModel(firstName: "Matthew", lastName: "Schultz"))
    
    return MockData_InPreview()
        .modelContainer(container)
}
