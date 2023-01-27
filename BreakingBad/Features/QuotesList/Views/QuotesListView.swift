//
//  QuotesListView.swift
//  BreakingBad
//
//  Created by zuri cohen on 1/23/23.
//

import SwiftUI

struct QuotesListView: View {
    
    @ObservedObject  var vm = QuotesListViewModel()
    
    var body: some View {
        ZStack {
            if vm.isLoading {
                ProgressView()
            } else {
                List(vm.quotes, id: \.quote) { quote in
                    VStack(alignment: .leading) {
                        Text(quote.author)
                            .font(.headline)
                            .foregroundColor(.white)
                        Text(quote.quote)
                            .font(.body)
                            .foregroundColor(.white)
                    }
                }
            }
        }
        .navigationTitle("Quotes")
        .task {
            await vm.fetchQuotes()
        }
    }
}

struct QuotesListView_Previews: PreviewProvider {
    static var previews: some View {
        QuotesListView()
    }
}
