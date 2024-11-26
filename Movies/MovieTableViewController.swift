//
//  MovieTableViewController.swift
//  Movies
//
//  Created by Karina Kinzhigaliyeva on 23.11.2024.
//

import UIKit
import Alamofire
import SwiftyJSON
import SVProgressHUD

class MovieTableViewController: UITableViewController, UISearchBarDelegate {
    
    var arrayMovie: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let search = UISearchController()
        
        search.searchBar.delegate = self
        
        search.searchBar.placeholder = "default search text"
        
        navigationItem.searchController = search
        
        searchMovie(s: "Love")
    }
    
    func searchMovie(s: String) {
        
        SVProgressHUD.show()
        print("show")
        
        let parameters = ["s": s] as [String : Any]
        
        AF.request("https://www.omdbapi.com/?apikey=dcf61e40", method: .get, parameters: parameters).responseData { response in
            SVProgressHUD.dismiss()
            
            if response.response?.statusCode == 200 {
                
                let json = JSON(response.data!)
                
                if let array = json["Search"].array{
                    for item in array {
                        let movie = Movie(json: item)
                        
                        self.arrayMovie.append(movie)
                    }
                    print(json)
                }
                
                self.tableView.reloadData()
            } else {
                print("error")
            }
            
        }
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        arrayMovie.removeAll()
        tableView.reloadData()
        searchMovie(s: searchBar.text!)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayMovie.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MovieTableViewCell
        
        // Configure the cell...
        cell.setdata(movie: arrayMovie[indexPath.row])
        
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 167
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "DetailViewController") as! ViewController
        
        vc.getModel(model2: arrayMovie[indexPath.row])
        
        
        navigationController?.show(vc, sender: self)
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
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
