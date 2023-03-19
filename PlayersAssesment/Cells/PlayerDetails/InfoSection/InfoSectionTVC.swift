//
//  InfoSectionTVC.swift
//  PlayersAssesment
//
//  Created by kamal abdelmonem on 18/03/2023.
//

import UIKit

class InfoSectionTVC: UITableViewCell {
    
    @IBOutlet weak var sectionTitle: UILabel!
    @IBOutlet weak var playerBrief: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!

    var itemsIndicators:[Indicator] = []
    var itemsMedias:[Media] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        setupTable()
    }

    func setupCell(brief:String,title:String,items:[Indicator]){
        self.containerView.backgroundColor = UIColor(red: 0.97, green: 0.98, blue: 0.98, alpha: 1.00)
        self.containerView.borderColor = .systemGray4
        if brief != "" {
            self.playerBrief.isHidden = false
            self.playerBrief.text = brief
        }else{
            self.playerBrief.isHidden = true
        }
        self.sectionTitle.text = title
        self.itemsIndicators = items
        self.tableViewHeight.constant = CGFloat(items.count * 40)
        self.tableView.reloadData()
    }
    func setupMedia(items:[Media]){
        self.containerView.backgroundColor = .clear
        self.containerView.borderColor = .clear
        self.playerBrief.isHidden = true
        self.sectionTitle.text = "Media"
        self.itemsMedias = items
        self.tableViewHeight.constant = CGFloat(items.count * 324)
        self.tableView.reloadData()
    }

}
