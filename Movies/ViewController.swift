//
//  ViewController.swift
//  Movies
//
//  Created by Karina Kinzhigaliyeva on 23.11.2024.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    private var model: Movie?
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var yearLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var karinaLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        guard let model = model else {
            // Обработайте ситуацию, когда модель не установлена
            return
        }
        
        if let poster = model.poster {
            imageView.sd_setImage(with: URL(string: poster))
        }
        yearLabel.text = model.year
        nameLabel.text = model.title
        descriptionLabel.text = model.type
        karinaLabel.text = "© 2024-2024 Karina Group AO"
    }
    
    func getModel(model2: Movie) {
        self.model = model2
    }
}

