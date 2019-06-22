//
//  InsertViewController.swift
//  HabitTracker
//
//  Created by SWUCOMPUTER on 15/06/2019.
//  Copyright © 2019 SWUCOMPUTER. All rights reserved.
//

import UIKit
import CoreData
class InsertViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var buttonMon: UIButton!
    @IBOutlet var buttonTue: UIButton!
    @IBOutlet var buttonWen: UIButton!
    @IBOutlet var buttonThu: UIButton!
    @IBOutlet var buttonFri: UIButton!
    @IBOutlet var buttonSat: UIButton!
    @IBOutlet var buttonSun: UIButton!
    
    var mon:Bool! = false
    var tue:Bool! = false
    var wed:Bool! = false
    var thu:Bool! = false
    var fri:Bool! = false
    var sat:Bool! = false
    var sun:Bool! = false
    
    @IBOutlet var textTitle: UITextField!
    var detailWeek: NSManagedObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let week = detailWeek {
            textTitle.text = week.value(forKey: "title") as? String
            mon = week.value(forKey: "monday") as? Bool
            tue = week.value(forKey: "tuesday") as? Bool
            wed = week.value(forKey: "wednesday") as? Bool
            thu = week.value(forKey: "thursday") as? Bool
            fri = week.value(forKey: "friday") as? Bool
            sat = week.value(forKey: "saturday") as? Bool
            sun = week.value(forKey: "sunday") as? Bool
           
        }
        if mon {
            buttonMon.backgroundColor = UIColor.green
        }
        if tue {
            buttonTue.backgroundColor = UIColor.green
        }
        if wed {
            buttonWen.backgroundColor = UIColor.green
        }
        if thu {
            buttonThu.backgroundColor = UIColor.green
        }
        if fri {
            buttonFri.backgroundColor = UIColor.green
        }
        if sat {
            buttonSat.backgroundColor = UIColor.green
        }
        if sun {
            buttonSun.backgroundColor = UIColor.green
        }
    }
    
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { textField.resignFirstResponder()
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func pressedMon() {
        mon.toggle()
        if mon {
            self.buttonMon.backgroundColor = UIColor.green
        }
        else
        {
            self.buttonMon.backgroundColor = UIColor.orange
        }
        
    }
    
    @IBAction func pressedTue() {
        tue.toggle()
        if tue {
            self.buttonTue.backgroundColor = UIColor.green
        }
        else
        {
            self.buttonTue.backgroundColor = UIColor.orange
        }
    }
    @IBAction func pressedWed() {
        wed.toggle()
        if wed {
            self.buttonWen.backgroundColor = UIColor.green
        }
        else
        {
            self.buttonWen.backgroundColor = UIColor.orange
        }
    }
    
    @IBAction func pressedThu() {
        thu.toggle()
        if thu {
            self.buttonThu.backgroundColor = UIColor.green
        }
        else
        {
            self.buttonThu.backgroundColor = UIColor.orange
        }
    }
    @IBAction func pressedFri() {
        fri.toggle()
        if fri {
            self.buttonFri.backgroundColor = UIColor.green
        }
        else
        {
            self.buttonFri.backgroundColor = UIColor.orange
        }
    }
    @IBAction func pressedSat() {
        sat.toggle()
        if sat {
            self.buttonSat.backgroundColor = UIColor.green
        }
        else
        {
            self.buttonSat.backgroundColor = UIColor.orange
        }
    }
    @IBAction func pressedSun() {
        sun.toggle()
        if sun {
            self.buttonSun.backgroundColor = UIColor.green
        }
        else
        {
            self.buttonSun.backgroundColor = UIColor.orange
        }
    }
    
    @IBAction func savePressed(_ sender: UIBarButtonItem) {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Habit", in: context)
        
        let object = NSManagedObject(entity: entity!, insertInto: context)
        object.setValue(textTitle.text, forKey: "title")
        object.setValue(mon, forKey: "monday")
        object.setValue(tue, forKey: "tuesday")
        object.setValue(wed, forKey: "wednesday")
        object.setValue(thu, forKey: "thursday")
        object.setValue(fri, forKey: "friday")
        object.setValue(sat, forKey: "saturday")
        object.setValue(sun, forKey: "sunday")
        object.setValue(Date(), forKey: "saveDate")
        do {
            try context.save()
            print("saved!")
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
        // 현재의 View를 없애고 이전 화면으로 복귀
        self.navigationController?.popViewController(animated: true)
    }
}
