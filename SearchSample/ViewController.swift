//
//  ViewController.swift
//  SearchSample
//
//  Created by Masuhara on 2017/06/18.
//  Copyright © 2017年 net.masuhara. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    var animals = ["Dog", "Cat", "Fish"]
    
    var searchData = [String]()
    
    @IBOutlet var animalTableView: UITableView!
    
    @IBOutlet var animalSearchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animalTableView.dataSource = self
        animalSearchBar.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 検索結果が1件以上あれば検索結果の数だけセルを作る
        if searchData.count > 0 {
            return searchData.count
        } else {
            return animals.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        if searchData.count > 0 {
            cell?.textLabel?.text = searchData[indexPath.row]
        } else {
            cell?.textLabel?.text = animals[indexPath.row]
        }
        
        return cell!
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // サーチ後の配列を一旦初期化
        searchData = [String]()
        
        // animals配列を1つ1つ取り出して、サーチした文字が含まれているか検索
        for animal in animals {
            if animal.contains(searchText) {
                // サーチした文字が含まれていた場合はsearchData配列に追加
                searchData.append(animal)
            }
        }
        animalTableView.reloadData()
    }
    
}

