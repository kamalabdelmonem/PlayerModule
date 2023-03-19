//
//  MatchesRowTVC.swift
//  PlayersAssesment
//
//  Created by kamal abdelmonem on 18/03/2023.
//

import UIKit

class MatchesRowTVC: UITableViewCell {

    @IBOutlet weak var sectionTitle: UILabel!
    @IBOutlet weak var key1: UILabel!
    @IBOutlet weak var key2: UILabel!
    @IBOutlet weak var key3: UILabel!
    @IBOutlet weak var value1: UILabel!
    @IBOutlet weak var value2: UILabel!
    @IBOutlet weak var value3: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setupMedia(statistic:StatisticData){
        self.sectionTitle.text = statistic.section
        if statistic.data?.count == 3 {
            self.key1.text = statistic.data?[0].key
            self.value1.text = statistic.data?[0].value
            self.key2.text = statistic.data?[1].key
            self.value2.text = statistic.data?[1].value
            self.key3.text = statistic.data?[2].key
            self.value3.text = statistic.data?[2].value
        }
    }

}
