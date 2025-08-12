//
//  PlusForList.swift
//  BoardGameTrackerUI
//
//  Created by Shaylee on 7/30/25.
//
import SwiftUI

struct PlusForList: View {
    @State private var paths = NavigationPath()
    @State private var selectedFilter = false
    
    let yarns = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    let patterns = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    
    var yarnBody: some View {
        List {
            ForEach(yarns, id: \.self) { yarn in
                Text("Yarn \(yarn)")
            }
        }
    }
    
    var patternBody: some View {
        
        // USE BUTTON INSTEAD OF NAVIGATIONLINK
        VStack {
            Button {
                paths.append(1)
            } label: {
                Text("Pattern \(1)")
            }
            Button {
                paths.append(2)
            } label: {
                Text("COOL")
            }
            Button {
                paths.append(1)
                paths.append(2)
            } label: {
                Text("Many")
            }
        }
        .buttonStyle(.plain)
        .navigationDestination(for: Int.self) {dest in
            if dest == 1 {
                Text("PATTERNEREJRIO")
            }
            if dest == 2 {
                Text("COOLLLL")
            }
        }
        
      
        
    }
    
    var body: some View {
        NavigationStack(path: $paths) {
            VStack {
                patternBody
            
                Text("Another view lol")
            }
            
        }
    }
}

#Preview {
    PlusForList()
}
