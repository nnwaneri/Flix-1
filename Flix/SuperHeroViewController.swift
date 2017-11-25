//
//  SuperHeroViewController.swift
//  Flix
//
//  Created by Harold  on 11/24/17.
//  Copyright © 2017 Harold . All rights reserved.
//

import UIKit
import AlamofireImage

class SuperHeroViewController: UIViewController, UICollectionViewDataSource {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var movies: [[String:Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let cellsPerLine: CGFloat = 2
        let addedHeaderAndLeftSpacing:CGFloat = 20
        let interItemSpacingTotal = (layout.minimumInteritemSpacing + addedHeaderAndLeftSpacing) * (cellsPerLine - 1)
        let width = collectionView.frame.size.width / cellsPerLine - interItemSpacingTotal/cellsPerLine
        
        layout.itemSize = CGSize(width: width, height: width * 3/2)
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        fetchMovieData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCell
        
        let movie = movies[indexPath.item]
        if let posterPathString = movie["poster_path"] as? String {
            let baseUrlString = "https://image.tmdb.org/t/p/w500"
            let posterUrlString = URL(string: baseUrlString + posterPathString)!
            
            cell.posterImageView.af_setImage(withURL: posterUrlString)
            cell.posterImageView.layer.cornerRadius = 10.0
            
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UICollectionViewCell
        if let indexPath = collectionView.indexPath(for: cell) {
            let movie = movies[indexPath.item]
            let detailViewController = segue.destination as! DetailSuperHeroViewController
            detailViewController.movie = movie
        }
        
    }

    func fetchMovieData() {
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=cddafef891a214cf8df28c4334102412")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            // This would run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                let movies = dataDictionary["results"] as! [[String:Any]]
                
                self.movies = movies
                self.collectionView.reloadData()
               
            }
        }
        
        task.resume()
    }
    
    
}
