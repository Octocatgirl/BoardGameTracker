//
//  SectionView.swift
//  BoardGameTrackerUI
//
//  Created by Shaylee Coulter on 7/15/25.
//
import SwiftUI

struct ScoreView: View {
    var lable: String
    @Binding var value: String
    
    var body : some View {
        HStack {
            Text(lable + ":")
            TextField("Input", text: $value)
                .padding()
                .keyboardType(.decimalPad)
        }
    }
}

struct AchievementView: View {
    var lable: String
    var hasValue: Bool
    var value: String
    @Binding var isAchieved: Bool
    
    var body : some View {
        
        Toggle(isOn: $isAchieved) {
            HStack {
                Text(lable + ":")
                if(hasValue){
                    if isAchieved {
                        Text(value).foregroundColor(.green)
                    }else {
                        Text(value)
                    }
                }
            }
        }
        
    }
}

