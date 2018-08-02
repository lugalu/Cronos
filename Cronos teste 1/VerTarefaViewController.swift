//
//  VerTarefaViewController.swift
//  Cronos teste 1
//
//  Created by Jester Bahia on 01/08/18.
//  Copyright © 2018 Jester. All rights reserved.
//

import UIKit

let secoesTarefa = ["Titulo", "Descrição","Data final"]
let secaoTarefa1 = ["Titulo"]
let secaoTarefa2 = ["Descrição"]
let secaoTarefa3 = ["Data final"]

class VerTarefaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var botaoNao: UIButton!
    @IBOutlet weak var botaoSim: UIButton!
    
    var tarefas = [Tarefa]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        botaoSim.backgroundColor = UIColor.blue
        botaoNao.backgroundColor = UIColor.red
        tarefas = getData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch (section) {
        case 0:
            return secaoTarefa1.count
        case 1:
            return secaoTarefa2.count
        case 2:
            return secaoTarefa3.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celVerTarefa")
        switch (indexPath.section) {
        case 0:
            cell?.textLabel?.text = tarefas[meuIndexTarefa].nome
        case 1:
            cell?.textLabel?.text = tarefas[meuIndexTarefa].descricao
        case 2:
            cell?.textLabel?.text = tarefas[meuIndexTarefa].date
        default:
            cell?.textLabel?.text = "erro"
        }
        return cell!
    }
    @IBAction func apertarBotaoSim(_ sender: Any) {
        putData(id: tarefas[meuIndexTarefa].id, rev: tarefas[meuIndexTarefa].rev, nome: tarefas[meuIndexTarefa].nome, descricao: tarefas[meuIndexTarefa].descricao, date: tarefas[meuIndexTarefa].date,feito: "sim")
    }
    @IBAction func apertarBotaoNao(_ sender: Any) {
        putData(id: tarefas[meuIndexTarefa].id, rev: tarefas[meuIndexTarefa].rev, nome: tarefas[meuIndexTarefa].nome, descricao: tarefas[meuIndexTarefa].descricao, date: tarefas[meuIndexTarefa].date,feito: "no")
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return secoesTarefa.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return secoesTarefa[section]
    }
}
