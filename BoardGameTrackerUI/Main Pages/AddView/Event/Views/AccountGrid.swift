    //
    //  AccountGrid.swift
    //  BoardGameTrackerUI
    //
    //  Created by Shaylee on 7/28/25.
    //
import SwiftUI
// grid of profiles 
struct AccountGridView : View {
    var accountList: [Account]
    @Binding var selectedAccounts: [Bool]
    @Binding var locked: [Int]
    
    var body: some View {
        let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible() )]
        
        ScrollView {
            LazyVGrid(columns: columns) {
                
                ForEach(Array(accountList.enumerated()), id: \.1.id) { [self]index, account in
                    
                    if locked.contains(where: { $0 == index }) {
                        AccountProfileView(name: account.username())
                            .background(Color.brightBlue)
                        
                    }else {
                        let isSelected = selectedAccounts.indices.contains(index) && selectedAccounts[index]
                        let  backgroundColor = isSelected ? Color.brightYellow : Color.clear
                        
                        AccountProfileView(name: account.username())
                            .onAppear{
                                selectedAccounts.append(false)
                            }
                            .background(backgroundColor)
                            .onTapGesture {
                                selectedAccounts[index].toggle()
                            }
                    }
                }
                
            }
        }.padding(.horizontal)
    }
}

