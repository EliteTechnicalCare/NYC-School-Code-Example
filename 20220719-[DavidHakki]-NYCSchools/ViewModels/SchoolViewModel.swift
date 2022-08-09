//
//  SchoolViewModel.swift
//  20220719-[DavidHakki]-NYCSchools
//
//  Created by Work on 7/19/22.
//

import Foundation

class SchoolViewModel: ObservableObject {
    let url = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json")! //Normally I would check for the validity of the url but given the static nature of this project I forced unwrap it.
    @Published var schools = [School]()
    //Published here
    
    func fetchSchools() async {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let schools = try JSONDecoder().decode([School].self, from: data)
            
            DispatchQueue.main.async {
                self.schools = schools
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
