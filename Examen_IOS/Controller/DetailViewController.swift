//
//  DetailViewController.swift
//  Examen_IOS
//
//  Created by Mañanas on 24/9/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var plotTextView: UITextView!
    
    var movie: Movie? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let imdbID = movie!.imdbID
        MovieAPIProvider.findMovieById(movieId: imdbID, completionHandler: { [weak self] results in
            self?.movie = results
            DispatchQueue.main.async {
                self?.posterImageView.loadFrom(url: (self?.movie!.Poster)!)
                self?.titleLabel.text = self?.movie!.Title
                self?.yearLabel.text = self?.movie!.Year
                self?.timeLabel.text = self?.movie!.Runtime
                self?.directorLabel.text = self?.movie!.Director
                self?.genreLabel.text = self?.movie!.Genre
                self?.countryLabel.text = self?.movie!.Country
                self?.plotTextView.text = self?.movie!.Plot
            }
        })
        
        
        /*if let movie = movie {
            
            posterImageView.loadFrom(url: movie.Poster)
            titleLabel.text = movie.Title
            yearLabel.text = movie.Year
        }*/
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
