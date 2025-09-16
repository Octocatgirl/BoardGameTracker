//
//  AccountProfileView.swift
//  BoardGameTrackerUI
//
//  Created by Shaylee Coulter on 7/24/25.
//


import SwiftUI


struct FitSystemFont: ViewModifier {
    var lineLimit: Int
    var minimumScaleFactor: CGFloat
    var percentage: CGFloat

    func body(content: Content) -> some View {
        GeometryReader { geometry in
            content
                .font(.system(size: min(geometry.size.width, geometry.size.height) * percentage))
                .lineLimit(self.lineLimit)
                .minimumScaleFactor(self.minimumScaleFactor)
                .position(x: geometry.frame(in: .local).midX, y: geometry.frame(in: .local).midY)
        }
    }
}

extension View {
    func fitSystemFont(lineLimit: Int = 1, minimumScaleFactor: CGFloat = 0.01, percentage: CGFloat = 1) -> ModifiedContent<Self, FitSystemFont> {
        return modifier(FitSystemFont(lineLimit: lineLimit, minimumScaleFactor: minimumScaleFactor, percentage: percentage))
    }
}

struct AccountProfileView: View {
    var name: String
   
    
    
    
    var body: some View {
        VStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.accent)                
           Spacer()
            Text(name)
                .font(.system(size: 50))
                .minimumScaleFactor(0.04)
                .lineLimit(1)
        }
        .padding()
        
        
            
        
    }
}


#Preview {
    AccountProfileView(name: "Account Name")
}
