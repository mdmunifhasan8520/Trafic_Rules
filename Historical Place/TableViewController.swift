//
//  TableViewController.swift
//  Historical Place
//
//  Created by MacBook Pro on 7/17/18.
//  Copyright © 2018 Code Drizzlers. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var imageList = ["round_about", "Double Bend First Left", "Dual Carriageway Ends", "Height Limit Ahead", "Road Narrow On Both Sides","Road Narrows In The Right","sharp bend to the right","Steep Hill Downwards","Steep Hill Upwards","Two way Traffic Straight Ahead"]
    var titleList = ["Round About","Double Bend First Left", "Dual Carriageway Ends", "Height Limit Ahead", "Road Narrow On Both Sides","Road Narrows In The Right","Sharp bend to the right","Steep Hill Downwards","Steep Hill Upwards","Two way Traffic Straight Ahead"]
    //var descriptionList = ["Tangail, Dhaka", "Pabna, Rongpur", "Comilla, Chittagong", "Bagerhat, Khulna", "Teknaf,Chittagong"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return titleList.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell

        // Configure the cell...
        cell.cellTitle.text = titleList[indexPath.row]
        //cell.cellDescription.text = descriptionList[indexPath.row]
        
        cell.cellImageView.image = UIImage(named: imageList[indexPath.row])
        

        return cell
    }


   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if (segue.identifier == "showDetails") {
            
            let dvc = segue.destination as! DetailsViewController
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                dvc.sentData1 = titleList[indexPath.row] as String
                //dvc.sentData2 = descriptionList[indexPath.row] as String
                dvc.sentData3 = imageList[indexPath.row] as String
            }
            
        }
    }
    

}
