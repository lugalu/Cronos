//
//  FirstViewController.swift
//  Cronos teste 1
//
//  Created by student on 25/07/18.
//  Copyright © 2018 Jester. All rights reserved.
//

import UIKit

let celDoStatus = ["Tarefas realizadas","Tarefas a fazer"]
let imagensDoStatus: [UIImage] = [UIImage(named: "feito.pdf")!,UIImage(named: "naofeito.pdf")!]
var meuIndexStatus = 0
var secaoStatus = 0

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var imageDoStatus: UIImageView!
    @IBOutlet weak var labelDoStatus: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.automaticallyAdjustsScrollViewInsets = false
        
    }

    func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celDoStatus")
        cell?.textLabel?.text = celDoStatus[indexPath.row]
        cell?.imageView?.image = imagensDoStatus[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return celDoStatus.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        meuIndexStatus = indexPath.row
        if indexPath.section == 0{
            secaoStatus = 1
        }else{
            secaoStatus = 2
        }
        performSegue(withIdentifier: "segueStatus", sender: self)
    }
}

