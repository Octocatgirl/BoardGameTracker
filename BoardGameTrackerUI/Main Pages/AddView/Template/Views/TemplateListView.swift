//
//  TemplateListView.swift
//  BoardGameTrackerUI
//
//  Created by Shaylee Coulter on 8/1/25.
//
import SwiftUI

struct TemplateListView: View {
    @Binding var paths: NavigationPath
    @ObservedObject var account: Account
    @Binding var isTabBarVisible: Bool
    @State private var alertDelete: Bool = false
    @State private var indexToDelete: IndexSet?
    
    var body: some View {
        ScrollView{
            LazyVStack(spacing: 15) {
                ForEach(account.templates) { temp in
        
                    Button(action: {
                        temp.account = self.account
                        isTabBarVisible = false
                        paths.append(temp.id)
                    }) {
                        HStack {
                            Text(temp.name)
                            Spacer()
                            Image(systemName: "plus")
                        }.padding()
                    }
                    // styling for each item list
                    .listRowSeparator(.hidden)
                        .background(Color.brightPink)
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .cornerRadius(10)
                        
                    // make sure that user wants to delete since action is permament
                        .alert(isPresented: $alertDelete) {
                            Alert(title: Text("Confirm Deletion"),
                                  message: Text("Are you sure you want to delete template? Action cannot be undone."),
                                  primaryButton: .destructive(Text("Delete")){
                                delete(at: self.indexToDelete!)
                            }, secondaryButton: .cancel())
                        }
                    
                } .onDelete {  (indexSet) in
                    self.alertDelete.toggle()
                    self.indexToDelete = indexSet
                }
                
                
            }
            .padding()
            .navigationDestination(for: UUID.self){ dest in
                SelectPlayersView(paths: $paths, account: account, template: account.templates.first(where: {$0.id == dest})!)
                }
        }
          
            
    }
    
    func delete(at offsets: IndexSet)  {
        account.templates.remove(atOffsets: offsets)
    }
    
    
}
