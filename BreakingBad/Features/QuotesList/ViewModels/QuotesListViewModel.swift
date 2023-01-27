//
//  QuotesListViewModel.swift
//  BreakingBad
//
//  Created by zuri cohen on 1/23/23.
//

import SwiftUI

class QuotesListViewModel: ObservableObject {
    
    @Published var quotes = [Quote]()
    @Published private(set) var isLoading = true
    
    private var networkingManager: NetworkingManagerImpl!
    
    init(networkingManager: NetworkingManagerImpl = NetworkingManager.sheredInstance) {
        self.networkingManager = networkingManager
    }

    @MainActor
    func fetchQuotes() async {
        self.isLoading = true
        defer { self.isLoading = false }
        
        do {
            let response = try await NetworkingManager.sheredInstance.request(.quotes(amount: 100) , type: [Quote].self)
            self.quotes = response
        } catch {
            print("fetch quotes faild")
        }
    }
}
