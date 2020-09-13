//
//  CharacterTableViewCell.swift
//  BreakingBadBluePrint
//
//  Created by Meurig Phillips on 09/09/2020.
//  Copyright © 2020 Meurig Phillips. All rights reserved.
//

import UIKit
import SDWebImage

class CharacterTableViewCell: UITableViewCell {

    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var characterImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(character: Character) {
        namelabel.text = character.name
        characterImageView.sd_setImage(with: URL(string: character.imageUrl), placeholderImage: UIImage(systemName: "questionmark.diamond"))
    }
}
