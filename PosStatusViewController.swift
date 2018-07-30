//
//  PosStatusViewController.swift
//  Cronos teste 1
//
//  Created by student on 26/07/18.
//  Copyright © 2018 Jester. All rights reserved.
//

import UIKit

class PosStatusViewController: UIViewController {
    
    @IBOutlet weak var tituloNavigation: UINavigationItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        tituloNavigation.title = celDoStatus[meuIndexStatus]
        // Do any additional setup after loading the view.
    }
    
    
}
