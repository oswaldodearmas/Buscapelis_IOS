//
//  MovieViewController.swift
//  Examen_IOS
//
//  Created by Mañanas on 24/9/24.
//
import Foundation
import UIKit

class MovieViewCell: UITableViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieYearLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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
