//
//  ViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Alex Paul on 12/7/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userSearchBar: UISearchBar!
    @IBOutlet weak var userTableView: UITableView!
    var userInfo = [InfoWrapper]() {
        didSet {
            self.userTableView.reloadData()
        }
    }
    
    
    
  override func viewDidLoad() {
    super.viewDidLoad()
    loadData()
    userTableView.dataSource = self
    userSearchBar.delegate = self
    title = "UserInfo"
  }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = userTableView.indexPathForSelectedRow,
            let DetailUserInfoViewController = segue.destination as? DetailUserInfoViewController else { fatalError("missing indexPath, DetailUserInfoViewController") }
        let user = userInfo[indexPath.row]
        DetailUserInfoViewController.userInformation = user
    }

    
    
    
    func loadData() {
        if let path = Bundle.main.path(forResource: "userinfo", ofType: "json") {
            let userinfoUrl = URL.init(fileURLWithPath: path)
            if let userinfoData = try? Data.init(contentsOf: userinfoUrl)
            {
                do {
                    let userinfomation = try JSONDecoder().decode(Userinfo.self, from: userinfoData)
                    userInfo = userinfomation.results
                } catch {
                    print(error)
                }
                
            }
        }
    }

}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userTableView.dequeueReusableCell(withIdentifier: "userInfoCell", for: indexPath)
        let userinfoToSet = userInfo[indexPath.row]
        cell.textLabel?.text = userinfoToSet.name.first.capitalized.sorted() + " " + userinfoToSet.name.last.capitalized
        cell.detailTextLabel?.text = userinfoToSet.location.state.capitalized
        
        
        if let url = URL.init(String: userinfoToSet.picture?.medium) {
            do {
                let data = try Data.init(contentsOf: url)
                if let image = UIImage.init(data: data) {
                    cell.imageView?.image = image
                }
            }catch {
                print("Image error is \(error)")
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userInfo.count
    }
}

extension ViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        guard let searchText = searchBar.text else {return}
        userInfo = userInfo.filter{($0.name.first + " " + $0.name.last).contains(searchText.lowercased()) || $0.name.first.contains(searchText.lowercased()) || $0.name.last.contains(searchText.lowercased())}
    }
}
