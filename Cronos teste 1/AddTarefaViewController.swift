//
//  AddTarefaViewController.swift
//  Cronos teste 1
//
//  Created by student on 27/07/18.
//  Copyright © 2018 Jester. All rights reserved.
//

import UIKit


class AddTarefaViewController: UIViewController {
    
    
    private var datePicker: UIDatePicker?
    @IBOutlet weak var tituloTarefa: UITextField!
    @IBOutlet weak var descricaoTarefa: UITextField!
    @IBOutlet weak var textData: UITextField!

    override func viewDidLoad() {
        self.automaticallyAdjustsScrollViewInsets = false;
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .dateAndTime
        datePicker?.addTarget(self, action: #selector(AddTarefaViewController.datePickerChanged(datePicker:)), for: .valueChanged)
        
        _ = UITapGestureRecognizer(target: self, action: #selector(AddTarefaViewController.viewTapped(gestureRecognizer:)))
        
        textData.inputView = datePicker
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    @objc func datePickerChanged(datePicker:UIDatePicker) {
        textData.text = String(describing: datePicker.date)
        view.endEditing(true)
    }
    
    @IBAction func botaoSalvar(_ sender: Any) {
        if tituloTarefa.text != "" && descricaoTarefa.text != "" {
            performSegue(withIdentifier: "salva", sender: nil)
            let tarefa = Tarefa()
            tarefa.nome = tituloTarefa.text!
            tarefa.descricao = descricaoTarefa.text!
            tarefa.date = textData.text!
            sendData (nome: tarefa.nome, descricao: tarefa.descricao, date: tarefa.date)
        }
    }

}
