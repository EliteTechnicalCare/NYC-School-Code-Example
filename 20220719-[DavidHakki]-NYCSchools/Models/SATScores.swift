//
//  SATScores.swift
//  20220719-[DavidHakki]-NYCSchools
//
//  Created by Work on 7/19/22.
//

import Foundation

struct SATScores: Codable {
    var dbn: String?
    var school_name: String?
    
    var satReading: String?
    var satMath: String?
    var satWriting: String?
    
    //use codingkeys to clean up the struct
    enum CodingKeys: String, CodingKey {
        case satReading = "sat_critical_reading_avg_score"
        case satMath = "sat_math_avg_score"
        case satWriting = "sat_writing_avg_score"
    }
}
