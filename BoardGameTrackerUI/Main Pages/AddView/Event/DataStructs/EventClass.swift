    //
    //  Event.swift
    //  BoardGameTrackerUI
    //
    //  Created by Shaylee on 7/2/25.
    //

import Foundation
import SwiftData
import SwiftUI



class Event : Identifiable{
    public var id = UUID()
    private var _name: String
    private var _date: String
    private var _template: Template
    private var _data: [Team : [TemplateSection]] = [:]
    
    init(name: String, template: Template) {
        _name = name
        _template = template
            //formating date into string
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateStyle = .short
        _date = dateFormatter.string(from: Date())
        
    }
    
    protocol Identifiable {
        associatedtype ID: Hashable
        var id: ID { get }
    }
    
    
    func name() -> String {
        return _name
    }
    
    func date() -> String {
        return _date
    }
    
    func data() -> [Team : [TemplateSection]] {
        return _data
    }
    
    func teams() -> [Team] {
        return Array(_data.keys)
    }
    func updateData(newData: [Team: [TemplateSection]]){
        _data = newData
    }
    
    func getData(team: Team) -> [TemplateSection] {
        return _data[team] ?? []
    }
    
    func description() -> some View {
        return DescriptionView(name: _name, date: _date)
    }
    
    func display() -> some View {
        var body: some View {
            VStack {
                Text(_name).font(.headline)
                Text(_date).font(.headline)
//                List(Array(_teams.enumerated()), id: \.1.id){ [self]index, team in
//                    Text(team.string()).font(.body)
//                    EventView(data: _data[index])
//                    
//                }
            }
        }
        return body
    }
    
}


struct DescriptionView: View {
    var name: String
    var date: String
    var body: some View {
        HStack{
            Text(name)
            Text(date)
        }
        
    }
}



