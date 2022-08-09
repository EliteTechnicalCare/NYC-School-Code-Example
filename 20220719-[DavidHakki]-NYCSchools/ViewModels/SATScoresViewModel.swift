//
//  SATScoresViewModel.swift
//  20220719-[DavidHakki]-NYCSchools
//
//  Created by Work on 7/19/22.
//

import Foundation

class SATScoresViewModel: ObservableObject {
    @Published var satScores: SATScores?
    //Published here
    
    func fetchScores(dbn: String) async {
        let url = URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json?dbn="+dbn)!
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let scores = try JSONDecoder().decode([SATScores].self, from: data)
            
            DispatchQueue.main.async {
                if let finalData = scores.first {
                    self.satScores = finalData
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
