//
//  TerceiraViewController.swift
//  Cronos teste 1
//
//  Created by student on 25/07/18.
//  Copyright © 2018 Jester. All rights reserved.
//

import UIKit

class TerceiraViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tarefas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celDaTarefa")
        cell?.textLabel?.text = tarefas[indexPath.row].nome
        
        
        
        
        return cell!
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
  
    
}
