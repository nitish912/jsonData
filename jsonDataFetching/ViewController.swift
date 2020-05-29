//
//  ViewController.swift
//  jsonDataFetching
//
//  Created by Xelpmoc Mac on 27/05/20.
//  Copyright © 2020 Xelpmoc Mac. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import  SDWebImage



class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
  
    
    
    @IBOutlet weak var userDetailTable: UITableView!
    
   let user = User()
    
    var numberOfItems : Int = 0
   
    
    let url = URL(string: "https://demo8716682.mockable.io/cardData")
       
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        callJsonData()
        
        userDetailTable.rowHeight = 200.0
        userDetailTable.register(UINib(nibName: "UserDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "UserDetailTableViewCell")
    }
        
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(user.name.count)
        return user.name.count
      }
      
     
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        let cell = userDetailTable.dequeueReusableCell(withIdentifier: "UserDetailTableViewCell", for: indexPath) as! UserDetailTableViewCell
       
        
        cell.userimg?.sd_setImage(with: URL( string: user.useringurl[indexPath.row] ), completed: nil)
        
        cell.username.text = user.name[indexPath.row]
        cell.userage.text = user.age[indexPath.row]
        cell.userlocation.text = user.location[indexPath.row]
       
      return cell
      }
      
    
    
    
    
    func callJsonData(){
                Alamofire.request(url!, method: .get, parameters: nil, encoding: URLEncoding.default).responseJSON { (response) in
                    if response.result.isSuccess {
                     
                        print(response)
                          
                       // self.responseJSON = JSON(response.result.value!)
                        
                        let fetchData : JSON = JSON(response.result.value!)
                        
                         self.numberOfItems = fetchData.count
                     
                        for i in 0..<self.numberOfItems {
                                                 
                            self.user.useringurl.append(fetchData[i]["url"].stringValue)
                            self.user.name.append(fetchData[i]["name"].stringValue)
                            self.user.age.append(fetchData[i]["age"].stringValue)
                            self.user.location.append(fetchData[i]["location"].stringValue)
                                              }
                        self.userDetailTable.reloadData()
                        print("check")
                        print(self.user.useringurl)
                       
                }
                    else{
                        print("Error\(String(describing: response.result.error))")
                        }

            }
            
        }


}
