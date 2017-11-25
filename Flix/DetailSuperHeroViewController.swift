//
//  DetailSuperHeroViewController.swift
//  Flix
//
//  Created by Harold  on 11/24/17.
//  Copyright © 2017 Harold . All rights reserved.
//

import UIKit

class DetailSuperHeroViewController: UIViewController {

    @IBOutlet weak var backDropImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    var movie: [String:Any]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        posterImageView.layer.cornerRadius = 10.0
        posterImageView.layer.borderWidth = 2
        
        self.navigationItem.title = "Movie Detail"
        if let movie = movie {
            titleLabel.text = movie["title"] as? String
            releaseDateLabel.text = movie["release_date"] as? String
            overviewLabel.text = movie["overview"] as? String
            let backdropPathString = movie["backdrop_path"] as! String
            let posterPathString = movie["poster_path"] as! String
            let baseUrlString = "https://image.tmdb.org/t/p/w500"
            
            let backdropUrl = URL(string: baseUrlString + backdropPathString)!
            backDropImageView.af_setImage(withURL: backdropUrl)
            
            let posterPathUrl = URL(string: baseUrlString + posterPathString)!
            posterImageView.af_setImage(withURL: posterPathUrl)
        }
    }
    
    
    override func viewWillLayoutSubviews() {
        overviewLabel.sizeToFit()
    }


    

}
