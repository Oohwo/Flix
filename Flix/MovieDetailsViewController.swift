//
//  MovieDetailsViewController.swift
//  Flix
//
//  Created by Rachel Sacdalan on 1/24/22.
//

import UIKit
import AlamofireImage

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var backdropImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    
    var movie: [String:Any]!
    var movie_videos = [[String : Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print("Showing " + (movie["title"] as! String) + " details!")
        
        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit()
        synopsisLabel.text = movie["overview"] as? String
        synopsisLabel.sizeToFit()
        
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)!
        
        posterImageView.af.setImage(withURL: posterUrl)
        
        let backdropPath = movie["backdrop_path"] as! String
        let backdropUrl = URL(string: "https://image.tmdb.org/t/p/w780" + backdropPath)!
        
        backdropImageView.af.setImage(withURL: backdropUrl)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTap(sender:)))
        posterImageView.isUserInteractionEnabled = true
        posterImageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func didTap(sender: UITapGestureRecognizer) {
        // let location = sender.location(in: view)
        print("PosterImageView tapped!")
        performSegue(withIdentifier: "TrailerSegue", sender: nil)
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        var movieTrailerViewController = segue.destination as! MovieTrailerViewController
        
        // movieTrailerViewController.key = movie["key"] as? String
        print(movie["title"] as? String)
    }
    

}
