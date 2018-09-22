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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let choix = type else { return }      // on vérifie que le choix est bien de type "Type"
        titleLable.text = "Convertisseur de : " + choix
    }
    // changer le sens du convertisseur
    @IBAction func changeButton(_ sender: Any) {
    }
    
    // Bouton retour
    @IBAction func backAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)    // DISMISS permet de revenir en arrière
    }
    
    // Action lors du changement de texte
    @IBAction func textChanged(_ sender: UITextField) {
    }
    
    
}
