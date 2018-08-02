//
//  Globais.swift
//  Cronos teste 1
//
//  Created by student on 31/07/18.
//  Copyright © 2018 Jester. All rights reserved.
//

import Foundation

class Tarefa {
    var id = String()
    var rev = String()
    var nome = String()
    var descricao = String()
    var date = String()
    var feito = String()
}

var tarefasFeitas = [Tarefa]()
var tarefasAFazer = [Tarefa]()

extension URLSession {
    func synchronousDataTask(with url: URL) -> (Data?, URLResponse?, Error?) {
        var data: Data?
        var response: URLResponse?
        var error: Error?
        
        let semaphore = DispatchSemaphore(value: 0)
        
        let dataTask = self.dataTask(with: url) {
            data = $0
            response = $1
            error = $2
            
            semaphore.signal()
        }
        dataTask.resume()
        
        _ = semaphore.wait(timeout: .distantFuture)
        
        return (data, response, error)
    }
}

func sendData (nome: String, descricao: String, date: String) {
    
    let endpoint: String = "https://cronosapp.mybluemix.net/post"
    
    guard let url = URL(string: endpoint) else {
        print("Erroooo: Cannot create URL")
        return
    }
    
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "POST"
    urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    let tarefaDict : [String:Any] = [
        "nome":nome,
        "descricao":descricao,
        "data":String(describing: date),
        "feito":"no"
        ]
    
    do {
        let data = try JSONSerialization.data(withJSONObject: tarefaDict)
        urlRequest.httpBody = data
        let task = URLSession.shared.dataTask(with: urlRequest)
        task.resume()
    } catch let error as NSError {
        print("Error = \(error.localizedDescription)")
    }
}

func putData (id: String, rev: String, nome: String, descricao: String, date: String, feito: String) {
    
    let endpoint: String = "https://cronosapp.mybluemix.net/put"
    
    guard let url = URL(string: endpoint) else {
        print("Erroooo: Cannot create URL")
        return
    }
    
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "PUT"
    urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    let tarefaDict : [String:Any] = [
        "_id": id,
        "_rev": rev,
        "nome":nome,
        "descricao":descricao,
        "data":String(describing: date),
        "feito":feito
    ]
    
    do {
        let data = try JSONSerialization.data(withJSONObject: tarefaDict)
        urlRequest.httpBody = data
        let task = URLSession.shared.dataTask(with: urlRequest)
        task.resume()
    } catch let error as NSError {
        print("Error = \(error.localizedDescription)")
    }
}

func deleteData (id: String, rev: String) {
    
    let endpoint: String = "https://cronosapp.mybluemix.net/delete"
    
    guard let url = URL(string: endpoint) else {
        print("Erroooo: Cannot create URL")
        return
    }
    
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "DELETE"
    urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    let tarefaDict : [String:Any] = [
        "_id": id,
        "_rev": rev
    ]
    
    do {
        let data = try JSONSerialization.data(withJSONObject: tarefaDict)
        urlRequest.httpBody = data
        let task = URLSession.shared.dataTask(with: urlRequest)
        task.resume()
    } catch let error as NSError {
        print("Error = \(error.localizedDescription)")
    }
}

func getData () -> [Tarefa] {
    
    var tarefas = [Tarefa]()
    tarefasAFazer = []
    tarefasFeitas = []
    
    let url = URL(string:"https://cronosapp.mybluemix.net/get")
    
    let (data, _, error) = URLSession.shared.synchronousDataTask(with: url!)
        
        if error != nil {
            return[]
        } else {
            let json = try! JSONSerialization.jsonObject(with: data!, options: []) as! [[String: AnyObject]]
                
                for jsonDados in json {
                    let tarefa = Tarefa()
                    tarefa.id = jsonDados["_id"] as! String
                    tarefa.rev = jsonDados["_rev"] as! String
                    tarefa.nome = jsonDados["nome"] as! String
                    tarefa.descricao = jsonDados["descricao"] as! String
                    tarefa.date = jsonDados["data"] as! String
                    tarefa.feito = jsonDados["feito"] as! String
                    tarefas.append(tarefa)
            }
        }
    return tarefas
}
