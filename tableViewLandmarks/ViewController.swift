//
//  ViewController.swift
//  tableViewLandmarks
//
//  Created by Assiya Tleu on 01.09.2025.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var placeNameLabel: UILabel!
    
    
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var landmarks = Landmarks()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        placeNameLabel.text = landmarks.placeName
        descriptionLabel.text = landmarks.description
        imageView.image = UIImage(named: landmarks.image)
    }


}

