//
//  Test.swift
//  BoardGameTrackerUI
//
//  Created by Shaylee Coulter on 7/16/25.
//

import SwiftUI

enum Flavor: String, CaseIterable, Identifiable {
    case chocolate, vanilla, strawberry
    var id: Self { self }
}


struct Tooltip: ViewModifier {
    let text: String
    @Binding var isPresented: Bool
    let content: () -> Content
    @State private var selectedFlavor: Flavor = .chocolate

    func body(content: Content) -> some View {
        ZStack(alignment: .top) {
            content
            if isPresented {
                Text(text)
                    .font(.caption)
                    .padding(8)
                    .background(Color(.systemGray6))
                    .foregroundColor(.primary)
                    .cornerRadius(8)
                    .shadow(radius: 4)
                    .offset(y: -50)
                    .transition(.opacity)
                    .zIndex(1)
            }
        }

        
        
        List {
            Picker(selection: $selectedFlavor) {
                Text("Chocolate").tag(Flavor.chocolate)
                Text("Vanilla").tag(Flavor.vanilla)
                Text("Strawberry").tag(Flavor.strawberry)
            } label: {
                Text("Flavor")
                Text("Choose your favorite flavor")
            }
        }
    }
}

extension View {
    func tooltip(_ text: String, isPresented: Binding<Bool>) -> some View {
        self.modifier(Tooltip(text: text, isPresented: isPresented, content: { self as! Tooltip.Content }))
    }
}


struct TestView: View {
    @State private var showTooltip = false

     var body: some View {
         Button(action: {
             withAnimation {
                 showTooltip.toggle()
             }
         }) {
             Image(systemName: "info.circle")
                 .resizable()
                 .frame(width: 24, height: 24)
                 .foregroundColor(.blue)
         }
         .tooltip("This is a tooltip!", isPresented: $showTooltip)

     }
}

#Preview {
    TestView()
}
