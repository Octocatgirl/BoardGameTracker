//
//  EventListView.swift
//  BoardGameTrackerUI
//
//  Created by Shaylee Coulter on 8/1/25.
//

import SwiftUI

struct EventListView: View {
    @Binding var paths: NavigationPath
    @ObservedObject var account: Account
    @Binding var isTabBarVisible: Bool
    @State private var alertDelete: Bool = false
    @State private var indexToDelete: IndexSet?
    
    
    var body: some View {
        ScrollView{
            LazyVStack(spacing: 15) {
                ForEach(account.events) { event in
        
                    Button(action: {
                        isTabBarVisible = false
                        paths.append(event .id)
                    }) {
                        HStack {
                            Text(event.date() + "  " + event.name())
                            Spacer()
                            Spacer()
                            Image(systemName: "chevron.right")
                        }.padding()
                    }
                    // styling for each item list
                    .listRowSeparator(.hidden)
                       .background(Color.brightBlue)
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .cornerRadius(10)
                        
                    // make sure that user wants to delete since action is permament
                        .alert(isPresented: $alertDelete) {
                            Alert(title: Text("Confirm Deletion"),
                                  message: Text("Are you sure you want to delete event? Action cannot be undone."),
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
                let event = account.events.first(where: {$0.id == dest})!
                TeamListView(account: account, paths: $paths, teams: event.teams(), eventData: event.data())
                }
        }
          
            
    }
    
    func delete(at offsets: IndexSet)  {
        account.templates.remove(atOffsets: offsets)
    }
    
    
}
