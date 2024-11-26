//
//  MovieTableViewCell.swift
//  Movies
//
//  Created by Karina Kinzhigaliyeva on 23.11.2024.
//

import UIKit
import SDWebImage

class MovieTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var genreLabel: UILabel!
    
    @IBOutlet weak var yearLabel: UILabel!
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setdata(movie: Movie) {
        titleLabel.text = movie.title
        genreLabel.text = movie.type
        yearLabel.text = movie.year
        posterImageView.sd_setImage(with: URL(string: movie.poster!))
    }
    
}


