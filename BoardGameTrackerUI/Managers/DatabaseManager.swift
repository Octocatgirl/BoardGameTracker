    //
    //  DatabaseManager.swift
    //  BoardGameTrackerUI
    //
    //  Created by Shaylee Coulter on 8/13/25.
    //
import Foundation
import Supabase

class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private init() {}
   
    
    let client = SupabaseClient(supabaseURL: URL(string: "https://cdfpguwsgfkkyynwqdan.supabase.co")!, supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNkZnBndXdzZ2Zra3l5bndxZGFuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTUxMTY4MjAsImV4cCI6MjA3MDY5MjgyMH0.V946TwcXZ-deLjYdPiphLbeUzyXUebT4fFvaOgyUdqs")
    
        // can make it just one adding function but...
        // I think doing multiple makes it safer from bugs
    func addNewTemplate(item: TemplatePayload) async throws {
        try await client.from("Template").insert(item).execute()
    }
    
    func addNewSection(item: SectionParams) async throws -> UUID {
        let response: UUID = try await  client.rpc("insert_or_get_section", params: item)
            .execute()
            .value
        return response

    }
    
    func addTemplateSection(item: TemplateSectionPayload) async throws {
        try await client.from("TemplateSections").insert(item).execute()
    }
    
    func fetchTemplateItems(for uid: String) async throws -> [TemplateListItem] {
        let response : [TemplateListItem] = try await client.from("Template").select().eq("user_id", value: uid).order("created_at", ascending: true).execute().value
     
//        
//        let decoder = JSONDecoder()
//            decoder.keyDecodingStrategy = .convertFromSnakeCase
//        let templates = try decoder.decode([TemplateListItem].self, from: data)
        
        print("returning...")
        print(response)
        
        return response 
    }
        //
        //    func deleteToDoItem(id: Int) async throws {
        //        let response = try await client.database.from("todos").delete().eq("id", value: id).execute()
        //        print(response)
        //        print(response.status)
        //        print(String(data: response.underlyingResponse.data, encoding: .utf8))
        //    }
        //
}
