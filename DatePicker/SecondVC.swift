//
//  SecondVC.swift
//  DatePicker
//
//  Created by Rodrigo Santos on 18/11/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {

    @IBOutlet weak var dateTextField: UITextField!
    
    private var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configDatePicker()
        self.dateTextField.textAlignment = .center
        // Do any additional setup after loading the view.
    }
    
    private func configDatePicker() {
        self.datePicker = UIDatePicker()
        
        self.datePicker.datePickerMode = .date
        self.datePicker.preferredDatePickerStyle = .wheels
        self.datePicker.addTarget(self, action: #selector(dateChanged(datePicker:)), for: .valueChanged)
        
        // TODO: Customizar o background do datePicker
        
        // Configuração da localização do device para o datePicker
        let localizacao = Locale(identifier: "pt_BR")
        self.datePicker.locale = localizacao
        
        self.dateTextField.inputView = self.datePicker
        
        // Configuração do toolbar
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.isTranslucent = true
        toolbar.tintColor = UIColor.black
        toolbar.sizeToFit()
        
        let cancelButton = UIBarButtonItem(title: "Cancelar", style: .plain, target: self, action: #selector(cancelClick))
        
        // TODO: Criar o botão de Pronto
        toolbar.setItems([cancelButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        
        self.dateTextField.inputAccessoryView = toolbar
    }
}

extension SecondVC {
    @objc func dateChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "dd/MM/yyyy"
        self.dateTextField.text = dateFormatter.string(from: datePicker.date)
    }
    
    @objc private func cancelClick() {
        self.dateTextField.resignFirstResponder()
    }
}
