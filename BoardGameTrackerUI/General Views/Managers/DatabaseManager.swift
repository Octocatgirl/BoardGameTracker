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
    
    func fetchUser(userId: String) async throws -> Account {
        return Account(username: "")
    }
    
//    func createToDoItem(item: ToDoPayload) async throws {
//        let response = try await client.database.from("todos").insert(item).execute()
//        print(response)
//        print(response.status)
//        print(response.underlyingResponse.data)
//    }
//    
//    func fetchToDoItems(for uid: String) async throws -> [ToDo] {
//        let response = try await client.database.from("todos").select().equals("user_uid", value: uid).order("created_at", ascending: true).execute()
//        let data = response.underlyingResponse.data
//        
//        let decoder = JSONDecoder()
//        decoder.keyDecodingStrategy = .convertFromSnakeCase
//        let todos = try decoder.decode([ToDo].self, from: data)
//        return todos
//    }
//    
//    func deleteToDoItem(id: Int) async throws {
//        let response = try await client.database.from("todos").delete().eq("id", value: id).execute()
//        print(response)
//        print(response.status)
//        print(String(data: response.underlyingResponse.data, encoding: .utf8))
//    }
//    
}
