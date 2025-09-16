//
//  Account.swift
//  BoardGameTrackerUI
//
//  Created by Shaylee on 7/2/25.
//
import Foundation


class Account: ObservableObject, Equatable, Identifiable {
    public var id: UUID
    
    private var _email: String
    private var _friends: [Account] = []
    private var _imageURL: String = "person.circle"
    
    @Published public var events: [Event] = []
    @Published public var templates: [Template] = []
    
    // called when account is first created 
    init(uid: UUID, email: String){
        id = uid
        _email = email
    }
    
    func add_event(event: Event){
        events.append(event)
    }
    
    func add_template(template: Template) {
        let temPay = TemplatePayload(id: template.id, userId: self.id, title: template.title)
//        let link = UserTemplateIdPayload(userId: self.id, templateId: template.id)
        Task {
            do{
                try await DatabaseManager.shared.addNewTemplate(item: temPay)
            } catch {
                print("Error adding Template: \(error.localizedDescription)")
            }
        }
        
        print("New Template added to database")
        
        template.uploadSection()
    }
    
    func loadTemplatesList() async -> [TemplateListItem] {
//        var templates: [TemplateListItem] = []
        do {
            return try await DatabaseManager.shared.fetchTemplateItems(for: self.id.uuidString)
//            for template in templateData {
//                let newTemplate = Template(id: template.id, title: template.name, owner: self)
//                templates.append(newTemplate)
//            }
            
        } catch {
            print("Error in fetching Template List: \(error.localizedDescription)")
            return []
        }
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
        return _email
    }
    
    func friendsList() -> [Account] {
        return _friends
    }
    
    static func == (lhs: Account, rhs: Account) -> Bool {
           return lhs.id == rhs.id && lhs._email == rhs._email
       }
}
