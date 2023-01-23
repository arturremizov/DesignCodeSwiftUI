//
//  AccountViewModel.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 23.01.23.
//

import Foundation

class AccountViewModel: ObservableObject {
    
    @Published var address: Address? = nil
    
    func fetchAddress() async {
        guard let url = URL(string: "https://random-data-api.com/api/v2/addresses") else { return }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            let decodedAdress = try decoder.decode(Address.self, from: data)
            await MainActor.run {
                address = decodedAdress
            }
        } catch {
            print("Error: \(error)")
        }
    }
}
