//
//  ViewController.swift
//  Examen_IOS
//
//  Created by Mañanas on 24/9/24.
//

import UIKit
import Foundation

class ListViewController: UIViewController,
                          UISearchBarDelegate, UITableViewDataSource {
    
    var movieList: [Movie] = []
    var movieListInitial: [Movie] = []

    @IBOutlet weak var moviesSearchBar: UISearchBar!
    @IBOutlet weak var moviesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        moviesTableView.dataSource = self
        moviesSearchBar.delegate = self
        
    }

    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
        moviesTableView.reloadData()
        }

    
    func numberOfSections(in moviesTableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = moviesTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieViewCell
        
        let movie = movieList[indexPath.row]
        
        cell.movieImageView.loadFrom(url: movie.Poster)
        cell.movieNameLabel.text = movie.Title
        cell.movieYearLabel.text = movie.Year
        
        return cell
    }
    
        // MARK: SearchBar delegate
            
            func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
                MovieAPIProvider.searchMovieListByName(movieName: searchBar.text!, completionHandler: { [weak self] results in
                    self?.movieList = results
                    DispatchQueue.main.async {
                        self?.moviesTableView.reloadData()
                    }
                })
            }
            
            func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
                self.movieList = self.movieListInitial
                self.moviesTableView.reloadData()
            }
            
            func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
                if (searchText.isEmpty) {
                    self.movieList = self.movieListInitial
                    self.moviesTableView.reloadData()
                }
            }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // Preguntamos cual es el identificador del segue
            if segue.identifier == "navToDetail" {
                // Obtenemos el viewController de destino
                let viewController = segue.destination as! DetailViewController
                // Obtenemos la celda seleccionada
                let indexPath = moviesTableView.indexPathForSelectedRow!
                // Asignamos en detalle el heroe que corresponde a la celda seleccionada
                viewController.movie = movieList[indexPath.row]
                // Deseleccionamos la celda para que no aparezca marcada
                moviesTableView.deselectRow(at: indexPath, animated: false)
            }
        }
    
}

