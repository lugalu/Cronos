//
//  AddTarefaViewController.swift
//  Cronos teste 1
//
//  Created by student on 27/07/18.
//  Copyright © 2018 Jester. All rights reserved.
//

import UIKit


class AddTarefaViewController: UIViewController {
    
  
    @IBOutlet weak var tituloTarefa: UITextField!
    @IBOutlet weak var descricaoTarefa: UITextField!

    @IBOutlet weak var dataTarefa: UIDatePicker!
    
    @IBAction func botaoSalvar(_ sender: Any) {
    if tituloTarefa.text != "" && descricaoTarefa.text != "" {
        performSegue(withIdentifier: "salva", sender: nil)
        var tarefa = Tarefa()
        tarefa.nome = tituloTarefa.text!
        tarefa.descricao = tituloTarefa.text!
        tarefa.date = dataTarefa.date
        tarefas.append(tarefa)
    
        }
    }

}
