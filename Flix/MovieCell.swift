//
//  MovieCell.swift
//  Flix
//
//  Created by Harold  on 11/20/17.
//  Copyright © 2017 Harold . All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
       
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
