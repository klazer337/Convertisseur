//
//  ViewController.swift
//  Convertisseur
//
//  Created by Kevin Trebossen on 22/09/18.
//  Copyright © 2018 KTD. All rights reserved.
//

import UIKit

// Constantes hors des classes -> EN MAJUSCULE
let DEVISE = "Devises"
let TEMPERATURE = "Température"
let DISTANCE = "Distance"



class ViewController: UIViewController {

    @IBOutlet weak var deviseView: UIView!
    @IBOutlet weak var distanceView: UIView!
    @IBOutlet weak var temperatureView: UIView!
    
    // Constante
    let segueID = "Convert"     // Nom de l'identifiant de la SEGUE
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Préparation de la SEGUE
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueID {                                            // vérification de l'identifiant de la SEGUE
            if let convertController = segue.destination as? ConvertController {    // On vérifie si la segue a bien comme destination le ConvertController
                convertController.type = sender as? String                          // On affecte une valeur à la variable type du ConvertController
                
            }
            
            
        }
    }
    
    
    @IBAction func buttonAction(_ sender: UIButton) {
        switch sender.tag {
        case 0: performSegue(withIdentifier: segueID, sender: DEVISE)
        case 1: performSegue(withIdentifier: segueID, sender: DISTANCE)
        case 2: performSegue(withIdentifier: segueID, sender: TEMPERATURE)
        default: break
        }
    }
    
    
    

}

