//
//  EventScoreView.swift
//  BoardGameTrackerUI
//
//  Created by Shaylee Coulter on 8/1/25.
//

import SwiftUI

struct EventScoreView: View {
    var label: String
    @State var value: String
    
    var body: some View {
        
        HStack {
            HStack {
                Text(label + ":")
                    .font(.headline)
                Text(value)
            }
            .padding()
            .font(.system(size: 20, design: .rounded))
            
            Spacer()
        }
    }
}



#Preview {
  
        EventScoreView(label: "Culture Points", value: "5")

}
