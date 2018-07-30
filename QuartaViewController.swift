//
//  QuartaViewController.swift
//  Cronos teste 1
//
//  Created by student on 25/07/18.
//  Copyright © 2018 Jester. All rights reserved.
//

import UIKit

let secoesAjuste = ["Perfil", "Preferências"]
let secaoAjuste1 = ["Nome"]
let secaoAjuste2 = ["Ajuda","Notificações","Sobre"]
var meuIndexAjustes = 0
var secaoAjustes = 0

class QuartaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        secaoAjustes = 0
        self.automaticallyAdjustsScrollViewInsets = false;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return secoesAjuste.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return secoesAjuste[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch (section) {
        case 0:
            return secaoAjuste1.count
        case 1:
            return secaoAjuste2.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        switch (indexPath.section) {
        case 0:
            cell?.textLabel?.text = secaoAjuste1[indexPath.row]
            cell?.imageView?.image = imagensDoStatus[0]
        case 1:
            cell?.textLabel?.text = secaoAjuste2[indexPath.row]
            cell?.imageView?.image = imagensDoStatus[1]
        default:
            cell?.textLabel?.text = "erro"
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        meuIndexAjustes = indexPath.row
        if indexPath.section == 0{
            secaoAjustes = 1
        }else{
            secaoAjustes = 2
        }
        performSegue(withIdentifier: "segueAjustes", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
