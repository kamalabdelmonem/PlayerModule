//
//  MediaSectionRowTVC.swift
//  PlayersAssesment
//
//  Created by kamal abdelmonem on 18/03/2023.
//

import UIKit
import SDWebImage

class MediaSectionRowTVC: UITableViewCell {

    @IBOutlet weak var mediaDate: UILabel!
    @IBOutlet weak var mediaTitle: UILabel!
    @IBOutlet weak var mediaDescription: UILabel!
    @IBOutlet weak var mediaPreview: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        mediaPreview.cornerRadius = 12
        mediaPreview.clipsToBounds = true
    }

    func setupCell(media:Media){
        mediaDate.text = media.date
        mediaTitle.text = media.title
        mediaDescription.text = media.subtitle
        mediaPreview.sd_setImage(with: URL(string: media.preview ?? ""))

    }

}
