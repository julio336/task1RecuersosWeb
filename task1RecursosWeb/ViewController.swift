//
//  ViewController.swift
//  task1RecursosWeb
//
//  Created by Julio Ahuactzin on 10/04/16.
//  Copyright © 2016 Julio Ahuactzin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var isbnField: UITextField!
    
    @IBOutlet weak var textField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textField.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func clearAction() {
        isbnField.text = ""
    }
    
    
    @IBAction func searchAction() {
        textField.text = ""
        if isbnField.text != "" {
            
            let url = NSURL(string: "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:"+isbnField.text!)
            
            do {
                let respuesta = try String(contentsOfURL: url!, encoding: NSUTF8StringEncoding)
                
                if respuesta != "{}" {
                    textField.text = respuesta
                } else {
                    textField.text = "El ISBN no es correcto."
                }
                
            } catch {
                let alert = UIAlertController(title: "Error", message: "Hay problemas con la conexión a Internet. Inténtelo de nuevo más tarde.", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }
            
        }else{
            //adding a loading alert
            let alert = UIAlertController(title: "Atención", message: "Ingresa un numero ISBN", preferredStyle: .Alert)
            
            alert.view.tintColor = UIColor.blackColor()
            let accionOK = UIAlertAction(title: "OK", style: .Default, handler:{
                accion in
                })
            alert.addAction(accionOK)
            self.presentViewController(alert, animated: true, completion: nil)
            ///////////////////////

        }
    
    }



}

