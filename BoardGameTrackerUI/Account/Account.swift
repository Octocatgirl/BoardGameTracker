//
//  Account.swift
//  BoardGameTrackerUI
//
//  Created by Shaylee on 7/2/25.
//
import Foundation


class Account: ObservableObject, Equatable, Identifiable {
    public var id: UUID = UUID()
    
    private var _username: String
    private var _password: String
    private var _friends: [Account] = []
    private var _imageURL: String = "person.circle"
    
    @Published public var events: [Event] = []
    @Published public var templates: [Template] = []
    
    // called when account is first created 
    init(username: String, password: String){
        _username = username
        _password = password
    }
    
    func add_event(event: Event){
        events.append(event)
    }
    
    func add_template(template: Template) {
        templates.append(template)
    }
    
    func add_friend(otherAccount: Account){
        _friends.append(otherAccount)
    }
    
    func getFriend(index: Int) -> Account{
        return _friends[index]
    }
    
    func image() -> String {
        return _imageURL
    }

    func username() -> String {
        return _username
    }
    
    func friendsList() -> [Account] {
        return _friends
    }
    
    static func == (lhs: Account, rhs: Account) -> Bool {
           return lhs.id == rhs.id && lhs._username == rhs._username
       }
}
