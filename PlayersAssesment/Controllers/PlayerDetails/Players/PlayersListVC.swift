//
//  PlayersListVC.swift
//  PlayersAssesment
//
//  Created by kamal abdelmonem on 17/03/2023.

import UIKit

class PlayersListVC: BaseVC {
    
    @IBOutlet weak var tableView: UITableView!
    
    var players: [PlayerItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        getPlayersList()
    }
    
    func getPlayersList(){
        
        showLoading()
        NPApi.shared.getPlayers { [weak self] response in
            self?.players = response?.data ?? []
            self?.tableView.reloadData()
            hideLoading()
        } failure: { err in
            hideLoading()
            print(err?.mssage ?? "")
        }
        
    }
}

