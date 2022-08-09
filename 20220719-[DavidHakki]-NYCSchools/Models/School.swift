//
//  School.swift
//  20220719-[DavidHakki]-NYCSchools
//
//  Created by Work on 7/19/22.
//

import Foundation

struct School: Codable {
    var dbn: String
    var school_name: String
    var primary_address_line_1: String
    
    var city: String
    var state_code: String
    var zip: String
}
