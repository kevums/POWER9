//
//  ImageViewController.swift
//  landmarkBookApp
//
//  Created by Kevin Landry on 6/23/20.
//  Copyright © 2020 Kevin Landry. All rights reserved.
//

import UIKit

class imageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var landmarkLabel: UILabel!
    
    var selectedLandmarkName = ""
    var selectedLandmarkImage = UIImage()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // this and the called variables above pull the info from the other view controller to display
        landmarkLabel.text = selectedLandmarkName
        imageView.image = selectedLandmarkImage
        
    }
    

   

}
