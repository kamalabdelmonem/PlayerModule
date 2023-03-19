//
//  BaseVC.swift
//  PlayersAssesment
//
//  Created by kamal abdelmonem on 17/03/2023.
//

import UIKit

class BaseVC: UIViewController {
    
    var Items = [ItemsEnum]()

    enum ItemsEnum {
        case back
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if Items.contains(.back) {
            var backBtn = UIBarButtonItem(image: UIImage(named:"backIcon")?.withRenderingMode(.alwaysOriginal), style: UIBarButtonItem.Style.plain, target: self, action: #selector(goBack))
            backBtn.width = 32
            navigationItem.leftBarButtonItem = backBtn
        }

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = !(Items.contains(.back))
    }
    @objc func goBack(){
        if (self.navigationController?.viewControllers.count ?? 0) > 1 {
            self.navigationController?.popViewController(animated: true)
        }
        else{
            self.navigationController?.dismiss(animated: true, completion: nil)
        }
    }

}
