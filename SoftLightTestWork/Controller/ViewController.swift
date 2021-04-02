//
//  ViewController.swift
//  SoftLightTestWork
//
//  Created by Дмитрий Жучков on 30.03.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var contributorsTable : UITableView!
    var selectedCellImageView: UIImage?
    var selectedCell: ContributorsCell?
    var data: JSONDecode?
    override func viewDidLoad() {
        super.viewDidLoad()
        contributorsTable = UITableView(frame: .zero, style: .grouped)
                 guard let contributorsTable = contributorsTable else {
                     return
                 }
        contributorsTable.register(ContributorsCell.self, forCellReuseIdentifier: "ServiceCell")
        contributorsTable.dataSource = self
        contributorsTable.delegate = self
        contributorsTable.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contributorsTable)
        contributorsTable.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        contributorsTable.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        contributorsTable.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        contributorsTable.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
        DataLoad.service.getData { result in
            self.data = result
            DispatchQueue.main.async {
             self.contributorsTable?.reloadData()
            }
        }
        contributorsTable.refreshControl = UIRefreshControl()
        contributorsTable.refreshControl?.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
    }
    @objc func pullToRefresh() {
        DataLoad.service.getData { result in
            self.data = result
            DispatchQueue.main.async {
             self.contributorsTable?.reloadData()
            }
        }
        DispatchQueue.main.async {
            self.contributorsTable.refreshControl?.endRefreshing()
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceCell", for: indexPath) as? ContributorsCell
        if data != nil  {
            let urlString = data![indexPath.row].avatarURL
            let url = URL(string: urlString)!
                   DataProvider.Cache.downloadImage(url: url) { image in
                    cell?.AvatarImage.image = image
        }
            cell?.idLabel.text = String(data![indexPath.row].id)
            cell?.loginLabel.text = data![indexPath.row].login
            
        }
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let vc = storyboard?.instantiateViewController(identifier: "ContributorsDetail") as? ContributorsDetail else { return }
        if data != nil  {
        let urlString = data![indexPath.row].avatarURL
        let url = URL(string: urlString)!
        DataProvider.Cache.downloadImage(url: url) { image in
         vc.AvatarImage.image = image
        }
        vc.loginLabel.text = data![indexPath.row].login
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

