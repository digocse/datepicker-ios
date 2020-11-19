//
//  ViewController.swift
//  DatePicker
//
//  Created by Rodrigo Santos on 18/11/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var dateText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configDatePicker()
        
        // Do any additional setup after loading the view.
    }
    
    private func configDatePicker() {
        self.datePicker.backgroundColor = UIColor.red
        
        self.datePicker.addTarget(self, action: #selector(dateChanged(datePicker:)), for: .valueChanged)
    }
}

extension ViewController {
    @objc private func dateChanged(datePicker: UIDatePicker) {
        print(datePicker.date)
        
        let dateFormatter = DateFormatter()
        
        // 18/11/2020 -> dd/MM/yyyy
        
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        print(dateFormatter.string(from: datePicker.date))
        
        self.dateText.text = dateFormatter.string(from: datePicker.date)
    }
}

