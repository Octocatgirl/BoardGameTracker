//
//  SuperbaseManager.swift
//  BoardGameTrackerUI
//
//  Created by Shaylee Coulter on 8/14/25.
//

import Supabase
import Foundation

class SupabaseManager {
    static let shared = SupabaseManager()

    let client: SupabaseClient

    private init() {
        let url = URL(string: "https://cdfpguwsgfkkyynwqdan.supabase.co")!
        let anonKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNkZnBndXdzZ2Zra3l5bndxZGFuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTUxMTY4MjAsImV4cCI6MjA3MDY5MjgyMH0.V946TwcXZ-deLjYdPiphLbeUzyXUebT4fFvaOgyUdqs"
        self.client = SupabaseClient(supabaseURL: url, supabaseKey: anonKey)
    }
}
