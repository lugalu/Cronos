//
//  SecondViewController.swift
//  Cronos teste 1
//
//  Created by student on 25/07/18.
//  Copyright © 2018 Jester. All rights reserved.
//

import UIKit
import Charts


class SecondViewController: UIViewController {
    var tarefas = [Tarefa]()
    
    @IBOutlet weak var butaoAtualizar: UIButton!
    @IBOutlet weak var graficoView: LineChartView!
    var horas = [Int]()
    var curva = [Int]()
    var graficoLinha = [ChartDataEntry]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tarefas = getData()
        graficoView.sizeToFit()
        for tarefa in tarefas{
            if (tarefa.feito == "no") {
                tarefasAFazer.append(tarefa)
            } else {
                tarefasFeitas.append(tarefa)
            }
        }
        
        updateGraph()
    }
    
    @IBAction func atualizar(_ sender: Any) {
        tarefas = getData()
        for tarefa in tarefas{
            if (tarefa.feito == "no") {
                tarefasAFazer.append(tarefa)
            } else {
                tarefasFeitas.append(tarefa)
            }
        }
        updateGraph()
    }
    func updateGraph(){
        let tarefasCompletas = tarefasFeitas.count
        var rendimento = 0
        if tarefasCompletas != 0{
            rendimento = 14/tarefasCompletas
        }
        for i in 0..<2{
            if i==0{
                let value = ChartDataEntry(x: Double(0), y: Double(0))
                graficoLinha.append(value)
            }else{
                
                let value = ChartDataEntry(x: Double(tarefasCompletas), y: Double(rendimento))
                graficoLinha.append(value)
            }
        }
        
        
        let linha1 = LineChartDataSet(values: graficoLinha, label: "number")
        linha1.colors=[NSUIColor.blue]
        let dados = LineChartData()
        dados.addDataSet(linha1)
        graficoView.viewPortHandler.setMinimumScaleX(0.0)
        graficoView.viewPortHandler.setMinimumScaleY(0.0)
        graficoView.data = dados
        graficoView.chartDescription?.text = "Rendimento Diario hora/Quantidade de atividades"
        
    }
    
}

