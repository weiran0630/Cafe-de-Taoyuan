//
//  DetailViewController.swift
//  FoodPin
//
//  Created by 朝凪汐 on 2021/1/5.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DetailPhoneAddrCell.self), for: indexPath) as! DetailPhoneAddrCell
            cell.icon.image = UIImage(systemName: "teletype")?.withTintColor(.systemBlue, renderingMode: .alwaysOriginal)
            cell.shortText.text = "電話號碼 : " + phoneNo
            cell.selectionStyle = .none
            
            return cell
        
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DetailPhoneAddrCell.self), for: indexPath) as! DetailPhoneAddrCell
            cell.icon.image = UIImage(systemName: "safari")?.withTintColor(.systemBlue, renderingMode: .alwaysOriginal)
            cell.shortText.text = "品牌專頁 : " + url
            cell.selectionStyle = .none
            
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DetailPhoneAddrCell.self), for: indexPath) as! DetailPhoneAddrCell
            cell.icon.image = UIImage(systemName: "map")?.withTintColor(.systemBlue, renderingMode: .alwaysOriginal)
            cell.shortText.text = "地址 : " + address
            cell.selectionStyle = .none
            
            return cell
            
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DetailDescriptionCell.self), for: indexPath) as! DetailDescriptionCell
            cell.descriptionText.text = descript
            cell.selectionStyle = .none
            
            return cell
        
        default:
            fatalError("Failed to instantiate the table view cell for detail view controller")
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
            
        case 1:
            if let url = URL(string: url) {
                let safariController = SFSafariViewController(url: url)
                present(safariController, animated: true, completion: nil)
            }
            
        default:
            break
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    var imageId = ""; var name = ""
    var type = ""; var address = ""
    var url = ""; var phoneNo = ""
    var descript = ""
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var headerView: DetailHeaderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        // Do any additional setup after loading the view.
        headerView.headerImageView.image = UIImage(named: imageId)
        headerView.nameLabel.text = name
        headerView.typeLabel.text = type
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
