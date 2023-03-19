//
//  PlayerSection.swift
//  PlayersAssesment
//
//  Created by kamal abdelmonem on 18/03/2023.
//

import Foundation

struct PlayerSection {

    var section : String?
    var isSelected : Bool = false
    var icon : String?

    init(section: String? = nil) {
        self.section = section
        self.icon = section
    }
}
