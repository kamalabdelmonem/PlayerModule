//
//  PlayerDateailsVC.swift
//  PlayersAssesment
//
//  Created by kamal abdelmonem on 17/03/2023.
//

import UIKit

protocol PassingTableHeight{
    func updateHeight(selectedStatisticsSection:Int)
}
class PlayerDatailsVC: BaseVC , PassingTableHeight {
    
    func updateHeight(selectedStatisticsSection:Int) {
        self.selectedStatisticsSection = selectedStatisticsSection
        self.tableViewHeight.constant = self.getTableHeight()
        self.tableView.reloadData()
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerPosition: UILabel!
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var playerAge: UILabel!
    @IBOutlet weak var playerPrice: UILabel!
    @IBOutlet weak var playerNumber: UILabel!
    @IBOutlet weak var playerRate: UILabel!
    @IBOutlet weak var teamImage: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var teamCity: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollToUpView: UIView!
    
    var selectedSection: PlayerSection?
    var playerBrief = ""
    var scrollViewY = 0.0
    var selectedStatisticsSection = 0
    var sections: [PlayerSection] = []
    var playerOldData: PlayerItem?
    var playerStatistics: [Statistic] = []
    var playerIndicators: [Indicator] = []
    var playerRating: [Indicator] = []
    var playerEvents: [Event] = []
    var playerMedias: [Media] = []
    
    override func viewDidLoad() {
        Items = [.back]
        super.viewDidLoad()
        setupOldData()
        setupTable()
        setupCollection()
        getPlayerDetails()
    }
    
    
    func setupOldData(){
        self.scrollToUpView.alpha = 0
        self.scrollViewY = 0
        self.scrollView.delegate = self
        self.playerImage.cornerRadius = 22
        self.playerImage.clipsToBounds = true
        self.playerImage.sd_setImage(with: URL(string: playerOldData?.photo ?? ""))
        self.teamImage.sd_setImage(with: URL(string: playerOldData?.teamLogo ?? ""))
        self.playerName.text = playerOldData?.name
        self.playerPosition.text = playerOldData?.positionName
        self.playerAge.text = playerOldData?.age
        var convertedValue = (((playerOldData?.marketValue as? NSString) ?? "0.0").doubleValue)/1000000
        if convertedValue > 1.0 {
            self.playerPrice.text = "\(convertedValue)" + "M " + (playerOldData?.marketCurrency ?? "")
        }else{
            convertedValue = (((playerOldData?.marketValue as? NSString) ?? "0.0").doubleValue)/1000
            self.playerPrice.text = "\(convertedValue)" + "K " + (playerOldData?.marketCurrency ?? "")
        }
        self.playerNumber.text = playerOldData?.shirtNumber
        self.playerRate.text = "\(((playerOldData?.rating as? NSString) ?? "0.0").integerValue)"
        self.teamName.text = playerOldData?.teamName
        self.teamCity.text = playerOldData?.teamCountry
    }
    
    func getPlayerDetails(){
        
        showLoading()
        NPApi.shared.getPlayerDetails(slug: playerOldData?.slug ?? "") { [weak self] response in
            self?.playerStatistics = response?.data?.statistics ?? []
            self?.playerIndicators = response?.data?.indicators ?? []
            self?.playerRating = response?.data?.rating ?? []
            self?.playerEvents = response?.data?.events ?? []
            self?.playerMedias = response?.data?.medias ?? []
            self?.playerBrief = response?.data?.about ?? ""
            self?.sections = []
            if (self?.playerIndicators.count ?? 0 > 0) || (self?.playerRating.count ?? 0 > 0) {
                var section = (PlayerSection(section: "Info"))
                section.isSelected = true
                self?.selectedSection = section
                self?.sections.append(section)
            }
            if self?.playerStatistics.count ?? 0 > 0 {
                self?.playerStatistics[0].isSelected = true
                self?.sections.append(PlayerSection(section: "Statistics"))
            }
            if self?.playerEvents.count ?? 0 > 0 {
                self?.sections.append(PlayerSection(section: "Events"))
            }
            if self?.playerMedias.count ?? 0 > 0 {
                self?.sections.append(PlayerSection(section: "Media"))
            }
            // reloadData
            self?.tableViewHeight.constant = self?.getTableHeight() ?? 0
            self?.collectionView.reloadData()
            self?.tableView.reloadData()
            hideLoading()
        } failure: { err in
            hideLoading()
            print(err?.mssage ?? "")
        }
        
    }
    
    func getTableHeight() -> CGFloat {
        if selectedSection?.section == "Info" {
            // playerBrief width
            if (playerBrief != "" || (playerIndicators.count > 0)){
                var lblHeight = 0 // playerBrief
                if playerBrief != "" {
                    // screen width - 56
                    let label:UILabel = UILabel(frame: CGRectMake(0, 0, UIScreen.main.bounds.width - 56 , CGFloat.greatestFiniteMagnitude))
                    label.numberOfLines = 0
                    label.lineBreakMode = NSLineBreakMode.byWordWrapping
                    label.font = .systemFont(ofSize: 14, weight: .thin)
                    label.text = playerBrief
                    label.sizeToFit()
                    lblHeight = Int(label.frame.height)
                }
                var h = 88 + (playerIndicators.count * 40) + lblHeight
                if playerRating.count > 0 {
                    h += 88 + (playerRating.count * 40)
                }
                return CGFloat(h)
            }else{
                return CGFloat(88 + (playerRating.count * 40))
            }
        }
        if selectedSection?.section == "Statistics" {
            if self.playerStatistics.count == 0 {
                return 0
            }
            var totalTableHeight = 0
            let currentData = self.playerStatistics[selectedStatisticsSection].data
            currentData?.forEach({ s in
                if s.section != "Matches" {
                    totalTableHeight += (88 + ((s.data?.count ?? 0) * 40))
                }
            })
            totalTableHeight = 120 + totalTableHeight
            return CGFloat(60 + totalTableHeight)
        }
        if selectedSection?.section == "Events" {
            var totalTableHeight = 0
            self.playerEvents.forEach({ e in
                if totalTableHeight == 0 {
                    totalTableHeight += 106 + ((e.matches?.count ?? 0) * 56)
                }else{
                    totalTableHeight += 60 + ((e.matches?.count ?? 0) * 56)
                }
            })
            return CGFloat(totalTableHeight)
        }
        if selectedSection?.section == "Media" {
            return CGFloat(88 + (playerMedias.count * 324))
        }
        return 0.0
    }
    
    @IBAction func scrollToUp(_ sender: UIButton) {
        self.scrollView.setContentOffset(CGPoint(x:0,y:scrollViewY), animated: true)
    }

}
