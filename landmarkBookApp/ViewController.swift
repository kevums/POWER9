//
//  ViewController.swift
//  landmarkBookApp
//
//  Created by Kevin Landry on 6/21/20.
//  Copyright © 2020 Kevin Landry. All rights reserved.
//

import UIKit

// adding these functions(UITableViewDelegate, UITableViewDataSource) is required with each new table view
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    // notice - called up in both view controllers, but renamed for overall class functionality here
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // this loads the tableview after it starts; required
        tableView.delegate = self
        tableView.dataSource = self
        
        
        // LANDMARK BOOK DATA
        // storing values in an array-ish move right here; consist of strings that isnt initialized and can be appended to
        // var landmarkNames = [String]() ; MOVING TO TOP TO REFERENCE IN COUNT (REACHABLE EVERYWERE)
        landmarkNames.append("Ancestral Recall")
        landmarkNames.append("Black Lotus")
        landmarkNames.append("Mox Emerald")
        landmarkNames.append("Mox Jet")
        landmarkNames.append("Mox Pearl")
        landmarkNames.append("Mox Ruby")
        landmarkNames.append("Mox Sapphire")
        landmarkNames.append("Time Walk")
        landmarkNames.append("Timetwister")
        
        // initializing landmarkImages as a UIImage type and an array
        // var landmarkImages = [UIImage](); MOVING TO TOP TO REFERENCE IN COUNT
        landmarkImages.append(UIImage(named: "batch_Ancestral Recall")!)
        landmarkImages.append(UIImage(named: "batch_Black Lotus")!)
        landmarkImages.append(UIImage(named: "batch_Mox Emerald")!)
        landmarkImages.append(UIImage(named: "batch_Mox Jet")!)
        landmarkImages.append(UIImage(named: "batch_Mox Pearl")!)
        landmarkImages.append(UIImage(named: "batch_Mox Ruby")!)
        landmarkImages.append(UIImage(named: "batch_Mox Sapphire")!)
        landmarkImages.append(UIImage(named: "batch_Time Walk")!)
        landmarkImages.append(UIImage(named: "batch_Timetwister")!)

        navigationItem.title = "The Power Nine"
       
    }
    
    
    // typed editingstyle and hit enter; this is to enable the deletion of rows
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            landmarkNames.remove(at: indexPath.row)
            landmarkImages.remove(at: indexPath.row)
            // deletes the row with an animation of fading
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
        
    }
    
// typed "cellforrow" and hit enter; calls up indiv rows
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        // next line says that it should take the landmark names and place them as rows within accordingly
        cell.textLabel?.text = landmarkNames[indexPath.row]
        return cell
    }
// typed "numberofrows" and hit enter; both this and above correlate to the two additional functions called above; returns 10 rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
// gets calls when one of rows is tapped (to perform segue)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // these two are specifically calling up the accurate, referenced info per the path called (ex: 0 is Colosseum, colosseum (see above))
        chosenLandmarkName = landmarkNames[indexPath.row]
        chosenLandmarkImage = landmarkImages[indexPath.row]
        
        performSegue(withIdentifier: "toImageViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toImageViewController" {
            // sort of obvious but the below is defining the image view controller as a variable; force casting(!) bc you know for certain where it will land (imageViewController)
            let destinationVC = segue.destination as! imageViewController
            // is referencing to other view controller
            destinationVC.selectedLandmarkName = chosenLandmarkName
            destinationVC.selectedLandmarkImage = chosenLandmarkImage
        }
    }
    
    
    
}

