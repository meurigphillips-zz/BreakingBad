//
//  CharacterDetailViewController.swift
//  BreakingBadBluePrint
//
//  Created by Meurig Phillips on 09/09/2020.
//  Copyright © 2020 Meurig Phillips. All rights reserved.
//

import UIKit
import SDWebImage

class CharacterDetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var occupationLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var character: Character?
 
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    private func configureView() {
        guard let character = character else { return }
        nameLabel.text = character.name
        nicknameLabel.text = character.nickname
        var occupationString = ""
        for occupation in character.occupation {
            occupationString += "\n‣ \(occupation)"
        }
        occupationLabel.text = "Occupation(s):\(occupationString)"
        statusLabel.text = "Status: \(character.status)"
        let seasons = character.appearance.map(String.init).joined(separator: ", ")
        seasonLabel.text = "Appears in season(s): \(seasons)"
        imageView.sd_setImage(with: URL(string: character.img), placeholderImage: UIImage(systemName: "questionmark.diamond"))
    }
    



}
