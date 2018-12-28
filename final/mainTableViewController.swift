//
//  mainTableViewController.swift
//  final
//
//  Created by User01 on 2018/12/26.
//  Copyright © 2018 chen. All rights reserved.
//

import UIKit
struct PositionType:Codable {
    var location:String
    var position:String
    var name:String
    var Longitude:String
    var Latitude:String
    
}
struct Dataresult:Codable{
    var total:Int
    var records:[PositionType]
}

class mainTableViewController: UITableViewController {
    
    var datas = [PositionType]()
    override func viewDidLoad() {
        super.viewDidLoad()

        if let urlStr = "https://api.myjson.com/bins/12dewk".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: urlStr){
            let task = URLSession.shared.dataTask(with: url) { (data, response , error)
                in
                let decoder = JSONDecoder()
                if let data = data, let content  = try? decoder.decode(Dataresult.self, from: data){
                self.datas = content.records
                    print(self.datas)
                DispatchQueue.main.async { self.tableView.reloadData()
                
                }
            }
                
            }
            task.resume()
            
        }
    }
    
    // MARK: - Table view data source
   /* override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }*/

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return datas.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! TableCell
       
        let data = datas[indexPath.row]
        
        cell.head.text=data.location
        cell.de.text=data.position
      

        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender:
        Any?) {
        let controller = segue.destination as! ViewController
        if let row=tableView.indexPathForSelectedRow?.row{
            controller.latitude=datas[row].Latitude;
            controller.longitude=datas[row].Longitude;
            controller.mapPosition=datas[row].position;
            controller.mapName=datas[row].name;
        }
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
