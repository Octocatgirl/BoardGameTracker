    //
    //  PopupQueryView.swift
    //  BoardGameTrackerUI
    //
    //  Created by Shaylee on 7/28/25.
    //

import SwiftUI

struct PopupQueryView: View {
    var query: String
        @Binding var isVisible: Bool
        @Binding var result: String
        @Binding var queryAnswered: Bool
   
    
    var body: some View {
        ZStack{
           
            VStack {
                Text(query).font(.headline).padding(20)
                TextField("input", text: $result)
                    .padding(5)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                    )
                    .padding(.horizontal)
                HStack {
                    Button("Submit"){
                        isVisible = false
                        queryAnswered = true
                    }.padding(25)
                    Spacer()
                    Button("Cancel"){
                        result = ""
                        queryAnswered = false
                        isVisible = false
                    }.foregroundColor(Color.red)
                        .padding(20)
                }
            }.frame(minWidth: 300,  minHeight: 150)
                .background(Color.white)
                .cornerRadius(10)
                .padding(.horizontal)
         
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray.opacity(0.8))
    }
}

