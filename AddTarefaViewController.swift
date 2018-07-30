//
//  AddTarefaViewController.swift
//  Cronos teste 1
//
//  Created by student on 27/07/18.
//  Copyright © 2018 Jester. All rights reserved.
//

import UIKit

let secoesTarefas = ["Titulo","Descricao","Data inicial","Notificações"]
let secaoTarefa1 = ["Titulo"]
let secaoTarefa2 = ["Descricao"]
let secaoTarefa3 = ["Data Final"]
let secaoTarefa4 = ["Notificações"]

class AddTarefaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet weak var tableViewVar: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewVar.estimatedRowHeight = 44
        tableViewVar.rowHeight = UITableViewAutomaticDimension
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return secoesTarefas.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return secoesTarefas[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch (section) {
        case 0:
            return secaoTarefa1.count
        case 1:
            return secaoTarefa2.count
        case 2:
            return secaoTarefa3.count
        case 3:
            return secaoTarefa4.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TextInputCell") as! TextInputTableViewCell
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "DatePickerCell") as! DatePickerTableViewCell
        cell2.textLabel?.numberOfLines = 0
        switch (indexPath.section) {
        case 0:
            cell.configure(text: "", placeholder: "Titulo da tarefa")
        case 1:
            cell.configure(text: "", placeholder: "Descrição da tarefa")
        case 2:
            cell2.datePickerMudou((Any).self)
            return cell2
        case 3:
            cell.textLabel?.text = secaoTarefa4[indexPath.row]
            cell.imageView?.image = imagensDoStatus[1]
        default:
            cell.textLabel?.text = "erro"
        }
        return cell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
