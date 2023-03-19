//
//  PlayerItemTVC.swift
//  PlayersAssesment
//
//  Created by kamal abdelmonem on 17/03/2023.
//

import UIKit
import SDWebImage

class PlayerItemTVC: UITableViewCell {

    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerClub: UILabel!
    @IBOutlet weak var playerPosition: UILabel!
    @IBOutlet weak var playerRate: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        playerImage.cornerRadius = 12
        playerImage.clipsToBounds = true
    }

    func setupCell(player:PlayerItem){
        playerName.text = player.name
        playerClub.text = player.teamName
        playerPosition.text = player.positionName
        playerRate.text = "\(((player.rating as? NSString) ?? "0.0").integerValue)"
        playerImage.sd_setImage(with: URL(string: player.photo ?? ""))
    }

}
