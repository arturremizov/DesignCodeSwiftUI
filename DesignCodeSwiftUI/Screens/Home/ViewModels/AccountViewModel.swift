//
//  AccountViewModel.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 23.01.23.
//

import Foundation

class AccountViewModel: ObservableObject {
    
    @Published var address: Address? = nil
    @Published var coins: [Coin] = []
    
    func fetchData() async {
        await fetchAddress()
        await fetchCoins()
    }
    
    private func fetchAddress() async {
        let urlString = "https://random-data-api.com/api/v2/addresses"
        let fetchedAddress: Address? = await fetchData(from: urlString)
        await MainActor.run {
            address = fetchedAddress
        }
    }
    
    private func fetchCoins() async {
        let urlString = "https://random-data-api.com/api/crypto_coin/random_crypto_coin?size=10"
        let fetchedCoins: [Coin] = await fetchData(from: urlString) ?? []
        await MainActor.run {
            coins = fetchedCoins
        }
    }
    
    private func fetchData<T: Decodable>(from urlString: String) async -> T? {
        guard let url = URL(string: urlString) else { return nil }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(T.self, from: data)
            return decodedData
        } catch {
            print("Error: \(error)")
            return nil
        }
    }
}
