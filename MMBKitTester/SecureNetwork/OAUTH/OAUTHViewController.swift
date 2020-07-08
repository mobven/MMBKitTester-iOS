//
//  OAUTHViewController.swift
//  MMBKitTester
//
//  Created by Eren Bayrak on 21.05.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import MBSecureNetwork

class OAUTHViewController: UITableViewController {
    
    var tableHeader: OAUTHTableHeader!
    
    var items: [Track.Item]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableHeader = OAUTHTableHeader(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 200))
        self.tableView.tableHeaderView = tableHeader
        self.tokenize()
    }
    
    func tokenize() {
        SecureNetwork.shared().tokenize { (result, error) in
            if result {
                print("Tokenization successful: \(SecureNetwork.shared().accessToken ?? "")")
                self.getTracks()
                self.getAlbum()
            } else {
                print("Tokenization failed: \(error?.localizedDescription ?? "")")
            }
        }
    }
    
    func getTracks() {
        OAUTHService.tracks.fetch(AlbumsRoot.self) { (result) in
            switch result {
            case .success(let response):
                self.tableHeader.items = [response.album!]
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getAlbum() {
        OAUTHService.albums.fetch(TracksRoot.self) { (result) in
            switch result {
            case .success(let response):
                self.items = response.tracks?.items
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension OAUTHViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items?[indexPath.row].name
        cell.detailTextLabel?.text = items?[indexPath.row].artists?.first?.name
        return cell
    }
    
}
