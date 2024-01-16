//
//  MockData_Intro.swift
//  FirstExampleView
//
//  Created by Kraig Kistler on 1/9/24.
//  Copyright © 2024 Kraig Kistler. All rights reserved.
//

import SwiftUI
import SwiftData

struct MockData_Intro: View {
    
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
    MockData_Intro()
    // static preview
        .modelContainer(FriendModel.preview)
}

