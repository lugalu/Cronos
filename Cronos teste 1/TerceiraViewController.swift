//
//  TerceiraViewController.swift
//  Cronos teste 1
//
//  Created by student on 25/07/18.
//  Copyright © 2018 Jester. All rights reserved.
//

import UIKit

var meuIndexTarefa = 0

class TerceiraViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var tarefas = [Tarefa]()
    @IBOutlet weak var tableViewTerceira: UITableView!
    
    @IBAction func atualizar(_ sender: Any) {
        tarefas = getData()
        tableViewTerceira.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        meuIndexTarefa = 0
        // Do any additional setup after loading the view, typically from a nib.
        tarefas = getData()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tarefas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celDaTarefa")
        cell?.textLabel?.text = tarefas[indexPath.row].nome
        cell?.detailTextLabel?.text = tarefas[indexPath.row].descricao
        let label = UILabel.init(frame: CGRect(x:0,y:0,width:100,height:20))
        label.text = tarefas[indexPath.row].date
        cell?.accessoryView = label
        return cell!
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            deleteData(id: tarefas[indexPath.row].id, rev: tarefas[indexPath.row].rev)
            tarefas = getData()
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        meuIndexTarefa = indexPath.row
        performSegue(withIdentifier: "verTarefaSegue", sender: self)
    }

  
    
}
