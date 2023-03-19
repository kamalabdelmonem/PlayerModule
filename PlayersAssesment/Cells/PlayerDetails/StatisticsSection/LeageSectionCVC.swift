//
//  LeageSectionCVC.swift
//  PlayersAssesment
//
//  Created by kamal abdelmonem on 18/03/2023.
//

import UIKit

class LeageSectionCVC: UICollectionViewCell {

    @IBOutlet weak var leageTitle: UILabel!
    @IBOutlet weak var selectedView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupLeage(leage:Statistic){
        self.leageTitle.text = leage.league
        self.leageTitle.textColor = UIColor.black
        self.selectedView.backgroundColor = UIColor.clear
        UIView.animate(withDuration: 0.25, delay: 0) {
            self.leageTitle.textColor = leage.isSelected! ? UIColor(named: "Main") : UIColor.black
            self.selectedView.backgroundColor = leage.isSelected! ? UIColor(named: "Main") : UIColor.clear
        }

    }

}
