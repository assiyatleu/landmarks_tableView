//
//  TableViewController.swift
//  tableViewLandmarks
//
//  Created by Assiya Tleu on 01.09.2025.
//

import UIKit

class TableViewController: UITableViewController {

    
    
    //var array = ["1", "2", "3", "4"]
    var arrayLandmarks = [Landmarks(placeName: "Bao", description: "A turquoise mountain lake located south of the city", image: "Bao"),
                          Landmarks(placeName: "Kok-Tobe", description: "A hill with panoramic views of Almaty and a popular leisure area", image: "Koktobe"),
                          Landmarks(placeName: "Medeu", description: "The world’s highest outdoor skating rink surrounded by mountains", image: "Medeu"),
                          Landmarks(placeName: "Ascension", description: "A wooden Orthodox church built without nails in Panfilov Park", image: "Ascension")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    
    @IBAction func addPlace(_ sender: Any) {
        arrayLandmarks.append(Landmarks(placeName: "NewPlace", description: "about", image: "newplace"))
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayLandmarks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row % 2 == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

            // Configure the cell...

            let label = cell.viewWithTag(1001) as! UILabel
            label.text = arrayLandmarks[indexPath.row].placeName
          
            let labelDescription = cell.viewWithTag(1002) as! UILabel
            labelDescription.text = arrayLandmarks[indexPath.row].description
            
            let imageView = cell.viewWithTag(1003) as! UIImageView
            imageView.image = UIImage(named: arrayLandmarks[indexPath.row].image)
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath)

        // Configure the cell...

        let label = cell.viewWithTag(1001) as! UILabel
        label.text = arrayLandmarks[indexPath.row].placeName
      
        let labelDescription = cell.viewWithTag(1002) as! UILabel
        labelDescription.text = arrayLandmarks[indexPath.row].description
        
        let imageView = cell.viewWithTag(1003) as! UIImageView
        imageView.image = UIImage(named: arrayLandmarks[indexPath.row].image)
        
        
        return cell
        
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 153
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        
        vc.landmarks = arrayLandmarks[indexPath.row]
        
        navigationController?.show(vc, sender: self)
    }
    
    
    
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            
            arrayLandmarks.remove(at: indexPath.row)
            
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
