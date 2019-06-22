//
//  DetailViewController.swift
//  HabitTracker
//
//  Created by SWUCOMPUTER on 15/06/2019.
//  Copyright © 2019 SWUCOMPUTER. All rights reserved.
//

import UIKit
import CoreData
class DetailViewController: UIViewController {

    @IBOutlet var textTitle: UITextField!
    @IBOutlet var btnMon: UIButton!
    @IBOutlet var btnTue: UIButton!
    @IBOutlet var btnWed: UIButton!
    @IBOutlet var btnThu: UIButton!
    @IBOutlet var btnFri: UIButton!
    @IBOutlet var btnSat: UIButton!
    @IBOutlet var btnSun: UIButton!
    
    var mon:Bool!
    var tue:Bool!
    var wed:Bool!
    var thu:Bool!
    var fri:Bool!
    var sat:Bool!
    var sun:Bool!
    
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
            btnMon.backgroundColor = UIColor.green
        }
        if tue {
            btnTue.backgroundColor = UIColor.green
        }
        if wed {
            btnWed.backgroundColor = UIColor.green
        }
        if thu {
            btnThu.backgroundColor = UIColor.green
        }
        if fri {
            btnFri.backgroundColor = UIColor.green
        }
        if sat {
            btnSat.backgroundColor = UIColor.green
        }
        if sun {
            btnSun.backgroundColor = UIColor.green
        }
    }
    

   /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toEditView" {
            if let destination = segue.destination as? InsertViewController {
                destination.detailWeek = self.detailWeek
            }
        }
    }*/
    

}
