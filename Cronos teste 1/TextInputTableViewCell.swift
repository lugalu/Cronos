//
//  TextInputTableViewCell.swift
//  Cronos teste 1
//
//  Created by Jester Bahia on 28/07/18.
//  Copyright © 2018 Jester. All rights reserved.
//

import UIKit
var texto = "jose"
class TextInputTableViewCell: UITableViewCell {
    @IBOutlet weak var textFieldDaCel: UITextField!
    
    public func configure(text: String?, placeholder: String) {
        textFieldDaCel.text = text
        textFieldDaCel.placeholder = placeholder
        
        textFieldDaCel.accessibilityValue = text
        textFieldDaCel.accessibilityLabel = placeholder
        
        texto = textFieldDaCel.text!
    }
}

class DatePickerTableViewCell: UITableViewCell {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func datePickerMudou(_ sender: Any) {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.short
        let strDate = dateFormatter.string(from: datePicker.date)
        dateLabel.text = strDate
    }
    
}
