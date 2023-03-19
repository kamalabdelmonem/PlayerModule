//
//  EventsMatchTVC.swift
//  PlayersAssesment
//
//  Created by kamal abdelmonem on 19/03/2023.
//

import UIKit

class EventsMatchTVC: UITableViewCell {

    @IBOutlet weak var matchDate: UILabel!
    @IBOutlet weak var round: UILabel!
    @IBOutlet weak var homeName: UILabel!
    @IBOutlet weak var awayName: UILabel!
    @IBOutlet weak var homeScores: UILabel!
    @IBOutlet weak var awayScores: UILabel!

    func setupMatch(item:Match) {
        self.matchDate.text = item.date
        let roundValue = item.round ?? ""
        self.round.text = roundValue.components(separatedBy:CharacterSet.decimalDigits.inverted).joined()
        self.homeName.text = item.homeName
        self.awayName.text = item.awayName
        self.homeScores.text = item.homeScore
        self.awayScores.text = item.awayScore
    }

}
