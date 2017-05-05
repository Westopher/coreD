//
//  ViewController.swift
//  coreD
//
//  Created by West Kraemer on 5/5/17.
//  Copyright © 2017 West Kraemer. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //to use the appDelegate methods in the file above view controller
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        //like a data manager, this allows you to work with the data in core data
        let context = appDelegate.persistentContainer.viewContext
        
        //adding a user
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        
        newUser.setValue("Sky", forKey: "username")
        newUser.setValue("mypass", forKey: "password")
        newUser.setValue(31, forKey: "age")
        
        do {
            
            try context.save()
            
            print("It works, you're a genius!")
            
            
        } catch {
            
            print("You did something wrong on your save, dumbass.")
            
        }
        
        //gets the information from coredata with a request
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        request.returnsObjectsAsFaults = false
        
        do {
            
            let results = try context.fetch(request)
            
            if results.count > 0 {
                
                for result in results as! [NSManagedObject] {
                    
                    if let username = result.value(forKey: "username") as? String {
                        
                        print(username)
                        
                    }
                    
                }
            }
            
            
        } catch {
            
           print("You did something wrong on your fetch request, dumbass.")
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

