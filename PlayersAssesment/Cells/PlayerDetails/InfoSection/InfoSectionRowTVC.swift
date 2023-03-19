//
//  InfoSectionRowTVC.swift
//  PlayersAssesment
//
//  Created by kamal abdelmonem on 18/03/2023.
//

import UIKit

class InfoSectionRowTVC: UITableViewCell {
    
    @IBOutlet weak var keyLbl: UILabel!
    @IBOutlet weak var valueLbl: UILabel!
    
    func setupCell(key:String,value:String){
        keyLbl.text = key + ":"
        valueLbl.text = value
    }

}
