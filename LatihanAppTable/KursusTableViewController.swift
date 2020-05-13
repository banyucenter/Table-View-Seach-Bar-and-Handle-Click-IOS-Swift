//
//  KursusTableViewController.swift
//  LatihanAppTable
//
//  Created by Ipung Dev Center on 4/27/20.
//  Copyright © 2020 Banyu Center. All rights reserved.
//

import UIKit

//struct Banner {
//    var nama: String
//    var kode: String
//    var gambar: String
//}

class KursusTableViewController: UITableViewController, UISearchResultsUpdating {
    

    let banner = [
        (nama: "Kursus PHP MySQL", kode: "PHPM", gambar: "1"),
        (nama: "Kursus Node.Js", kode: "NJS", gambar: "2"),
        (nama: "Kursus Golang", kode: "GLG", gambar: "3"),
        (nama: "Kursus Ruby", kode: "RBR", gambar: "4"),
        (nama: "Kursus Python", kode: "PYT", gambar: "5")
    
    ]
    
    //tambahkan search bar
    let searchController = UISearchController(searchResultsController: nil)
    
    //membuat tuple untuk filter data banner
    var searchResults : [(nama:String, kode:String, gambar:String)] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        self.definesPresentationContext = true
        
        //tempatkan search bar pada header
        self.tableView.tableHeaderView = searchController.searchBar
        
        //offset header table search dan hidden
        self.tableView.contentOffset = CGPoint(x:0, y: searchController.searchBar.frame.height)

    }
    
    func filterContent(for searchText:String){
        searchResults = banner.filter({(nama:String, kode:String, gambar:String)->Bool in
            let match = nama.range(of:searchText, options: .caseInsensitive)
            return match != nil
        })
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            filterContent(for: searchText)
            
            searchController.obscuresBackgroundDuringPresentation = false
            
            tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return searchController.isActive ? searchResults.count : banner.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let banners = searchController.isActive ? searchResults[indexPath.row] : banner[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LogoCell", for: indexPath)

        cell.textLabel?.text = banners.nama
        cell.detailTextLabel?.text = banners.kode
        cell.imageView?.image = UIImage(named: banners.gambar)

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       let banners = searchController.isActive ? searchResults[indexPath.row] : banner[indexPath.row]
        //print(banners.nama)
        
        let Vcku = storyboard?.instantiateViewController(withIdentifier: "Detail") as! DetailViewController
        
        Vcku.stringNama = banners.nama
        Vcku.stringKode = banners.kode
        Vcku.stringGambar = banners.gambar
        
        navigationController?.pushViewController(Vcku, animated: true)
    }

    


}
