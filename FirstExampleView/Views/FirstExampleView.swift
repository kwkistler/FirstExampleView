//
//  ContentView.swift
//  FirstExampleView
//
//  Created by Kraig Kistler on 1/9/24.
//  Copyright © 2024 Kraig Kistler. All rights reserved.
//

import SwiftUI
import SwiftData

struct FirstExampleView: View {
    
    @Environment(\.modelContext) private var modelContext
    
    @Query private var people: [PersonModel]
    
    var body: some View {
        VStack {
            Button("Add Person") {
                let name = ["Mark", "Lem", "Chase"].randomElement()!
                let person = PersonModel(name: name)
                modelContext.insert(person)
            }
            
            List(people) { person in
                Text(person.name)
            }
        }
        .font(.title)
    }
}

#Preview {
    FirstExampleView()
    // model context is added to the environment
    // .self notation refers to the type of a class raher than the class itself
        .modelContainer(for: PersonModel.self)
}
