//
//  PosStatusViewController.swift
//  Cronos teste 1
//
//  Created by student on 26/07/18.
//  Copyright © 2018 Jester. All rights reserved.
//

import UIKit

class PosStatusViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tituloNavigation: UINavigationItem!
    var tarefas = [Tarefa] ()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        tarefas = getData()
        tituloNavigation.title = celDoStatus[meuIndexStatus]
        for tarefa in tarefas{
            if (tarefa.feito == "no") {
                tarefasAFazer.append(tarefa)
            } else {
                tarefasFeitas.append(tarefa)
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if meuIndexStatus == 0{
            return tarefasFeitas.count
        } else{
            return tarefasAFazer.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if meuIndexStatus == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellPosStatus")
            cell?.textLabel?.text = tarefasFeitas[indexPath.row].nome
            cell?.detailTextLabel?.text = tarefasFeitas[indexPath.row].descricao
            let label = UILabel.init(frame: CGRect(x:0,y:0,width:100,height:20))
            label.text = tarefasFeitas[indexPath.row].date
            cell?.accessoryView = label
            return cell!
        } else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellPosStatus")
            cell?.textLabel?.text = tarefasAFazer[indexPath.row].nome
            cell?.detailTextLabel?.text = tarefasAFazer[indexPath.row].descricao
            let label = UILabel.init(frame: CGRect(x:0,y:0,width:100,height:20))
            label.text = tarefasAFazer[indexPath.row].date
            cell?.accessoryView = label
            return cell!
        }
        
    }
    
    
}
