//
//  ConvertController.swift
//  Convertisseur
//
//  Created by Kevin Trebossen on 22/09/18.
//  Copyright © 2018 KTD. All rights reserved.
//

import UIKit

class ConvertController: UIViewController {
    // Title Label
    @IBOutlet weak var titleLable: UILabel!
    // ViewIN
    @IBOutlet weak var entryView: UIView!
    @IBOutlet weak var toDoLabel: UILabel!
    @IBOutlet weak var dataTextField: UITextField!
    // ViewOUT
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var resultLabel: UILabel!
    
    // Variables
    var type: String?
    var views: [UIView] = []
    var isReverse = false
    
    // Constantes
    let euros = "euros"
    let dollar = "dollars"
    let km = "kilomètres"
    let mi = "miles"
    let celsius = "celsuis"
    let fahrenheit = "fahrenheit"
    let format = "%.2f"
    
                                        // ---------- OVERRIDE METHODES UIVIEWCONTROLLER ---------- //
    override func viewDidLoad() {
        super.viewDidLoad()
        if let choix = type {                                   // on vérifie que le choix est bien de type "Type"
            views.append(contentsOf: [resultLabel, entryView])
            arrondirLesAngles()
            typeChoisi(choix)
        } else {
            dismiss(animated: true, completion: nil)
        }
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)) // rentrer le clavier
        view.addGestureRecognizer(tap)
    }
    
    
    
    
    // FONCTIONS
    @objc func hideKeyboard() {     // fonction pour rentrer le clavier
        view.endEditing(true)
    }
    
    func typeChoisi(_ choix: String){
        switch choix {
        case DEVISE: setup(euros, dollar)
        case DISTANCE: setup(km, mi)
        case TEMPERATURE: setup(celsius, fahrenheit)
        default : break
        }
    }
    
    func setup(_ primary: String, _ secondary: String) {
        if !isReverse {     // on vérifie que l'on est pas en mode reverse => on est dans le bon sens
            titleLable.text = "Convertir " + primary + " en " + secondary
            toDoLabel.text = "Entrez le nombre de " + primary
        } else {
            titleLable.text = "Convertir " + secondary + " en " + primary
            toDoLabel.text = "Entrez le nombre de " + secondary
        }
    }
    
    func arrondirLesAngles() {
        for v in views {
            v.layer.cornerRadius = 10
        }
    }
    
    
    // LOGIQUE DU CALCUL
    func calculate() {
        if let monType = type, let texte = dataTextField.text, let double = Double(texte) {
            switch monType {
            case DEVISE:
                resultLabel.text = isReverse ? euros(double) : dollar(double)
            case TEMPERATURE:
                resultLabel.text = isReverse ? celsius(double) : fahrenheit(double)
            case DISTANCE:
                resultLabel.text = isReverse ? km(double) : miles(double)
            default: break
            }
        }
    }
    
    func dollar(_ euros: Double) -> String {
        return String(format: format, (euros / 0.81 )) + " $"
    }
    
    func euros(_ dollars: Double) -> String {
        return String(format: format, (dollars * 0.81 )) + " €"
    }
    
    func miles(_ km: Double) -> String {
        return String(format: format, (km * 0.621 )) + " mi"
    }
    
    func km(_ miles: Double) -> String {
        return String(format: format, (miles / 0.621 )) + " km"
    }
    
    func celsius(_ fahrenheit: Double) -> String {
        return String(format: format, ((fahrenheit - 32) / 1.8 )) + " °C"
    }
    
    func fahrenheit(_ celsius: Double) -> String {
        return String(format: format, ((celsius * 1.8) + 32 )) + " °F"
    }
    
    
    // ACTIONS
                                                        // ---------- changer le sens du convertisseur ---------- //
    @IBAction func changeButton(_ sender: Any) {
        guard type != nil else { return }
        isReverse = !isReverse  // on inverse le booléen
        typeChoisi(type!)
        calculate()
    }
    
    // Bouton retour
    @IBAction func backAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)    // DISMISS permet de revenir en arrière
    }
    
    // Action lors du changement de texte
    @IBAction func textChanged(_ sender: UITextField) {
        calculate()
    }
    
    
}
