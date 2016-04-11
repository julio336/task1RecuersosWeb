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
            let text = isbnField.text! as String
            let url = NSURL(string: "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:\(text)")
            let session = NSURLSession.sharedSession()
            let task = session.dataTaskWithURL(url!, completionHandler:{data, response, error -> Void in
            
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    let texto = NSString(data: data!, encoding: NSUTF8StringEncoding) as! String
                    self.textField.text = texto
                    print(texto)
                })
                if let error = error {
                    print(error.localizedDescription)
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
            })
            
            task.resume()
            
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

