//
//  PosAjustesViewController.swift
//  Cronos teste 1
//
//  Created by student on 27/07/18.
//  Copyright © 2018 Jester. All rights reserved.
//

import UIKit

class PosAjustesViewController: UIViewController {
    
    @IBOutlet weak var navigationItemAjustes: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if secaoAjustes == 1{
            navigationItemAjustes.title = secaoAjuste1[meuIndexAjustes]
        }else{
            navigationItemAjustes.title = secaoAjuste2[meuIndexAjustes]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
