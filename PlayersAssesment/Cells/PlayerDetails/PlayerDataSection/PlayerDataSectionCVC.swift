//
//  PlayerDataSectionCVC.swift
//  PlayersAssesment
//
//  Created by kamal abdelmonem on 17/03/2023.
//

import UIKit

class PlayerDataSectionCVC: UICollectionViewCell {

    @IBOutlet weak var sectionTitle: UILabel!
    @IBOutlet weak var sectionIcon: UIImageView!
    @IBOutlet weak var mainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupCell(section:PlayerSection){
        self.sectionTitle.text = section.section
        self.sectionIcon.image = UIImage(named: section.icon ?? "")
        self.sectionTitle.textColor = UIColor.black
        self.mainView.backgroundColor = UIColor.white
        UIView.animate(withDuration: 0.25, delay: 0) {
            self.sectionTitle.textColor = section.isSelected ? UIColor.white : UIColor.black
            self.mainView.backgroundColor = section.isSelected ? UIColor(named: "Main") : UIColor.white
        }
    }
    
}
