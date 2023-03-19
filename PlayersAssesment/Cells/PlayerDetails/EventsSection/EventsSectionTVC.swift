//
//  EventsSectionTVC.swift
//  PlayersAssesment
//
//  Created by kamal abdelmonem on 19/03/2023.
//

import UIKit
import SDWebImage

class EventsSectionTVC: UITableViewCell {
        
    @IBOutlet weak var sectionTitle: UILabel!
    @IBOutlet weak var leageIcon: UIImageView!
    @IBOutlet weak var leageTitle: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!

    var matches:[Match] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        setupTable()
    }

    func setupEvents(item:Event,isHeader:Bool){
        self.sectionTitle.isHidden = !isHeader
        self.leageTitle.text = item.leagueName
        self.leageIcon.sd_setImage(with: URL(string: item.leagueLogo ?? ""))
        self.matches = item.matches ?? []
        self.tableViewHeight.constant = CGFloat((self.matches.count) * 54)
        self.tableView.reloadData()
    }

}
