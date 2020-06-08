//
//  ViewController.swift
//  table view
//
//  Created by ARBAAZ on 05/06/20.
//  Copyright © 2020 Rahul Nagarkoti. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet weak var selectField: UITextField!
    var selectFieldValue = 0
    let dropDownArray = ["English Premier League", "Italian Serie - A", "French Ligue Un", "German Bundesliga"]
    var pickerView = UIPickerView()
    
    @IBOutlet weak var tableView: UITableView!

    //english league
    var eplFixtureList =
    [
        "9 July 2020": ["15:00 Liverpool v Norwich City",
        "15:00 A.F.C. Bournemouth v Sheffield United",
        "15:00 Burnley v Southampton",
        "15:00 Crystal Palace v Everton",
        "15:00 Leicester City v Wolverhampton",
        "17:30 Tottenham Hotspur v Aston Villa",
        "15:00 Watford v Brighton",
        "12:30 West Ham United v Manchester City",
        "16:30 Manchester United v Chelsea",
        "14:00 Newcastle United v Arsenal"
    ],
    
    "15 July 2020" : ["15:00 A.F.C. Bournemouth v Manchester City",
    "15:00 Aston Villa v Everton",
    "15:00 Brighton v Southampton",
    "15:00 Liverpool v Arsenal",
    "15:00 Manchester United v Crystal Palace",
    "15:00 Norwich City v Chelsea",
    "15:00 Sheffield United v Leicester City",
    "15:00 Tottenham Hotspur v Newcastle United",
    "15:00 Watford v West Ham United",
    "15:00 Wolverhampton v Burnley",
    ],
    
    "21 July 2020" : ["15:00 Arsenal v Tottenham Hotspur",
    "15:00 Burnley v Liverpool",
    "15:00 Chelsea v Sheffield United",
    "15:00 Crystal Palace v Aston Villa",
    "15:00 Everton v Wolverhampton",
    "15:00 Leicester City v A.F.C. Bournemouth",
    "15:00 Manchester City v Brighton",
    "15:00 Newcastle United v Watford",
    "15:00 Southampton v Manchester United",
    "15:00 West Ham United v Norwich City"
    ],
    
    "28 July 2020":[ "15:00 A.F.C. Bournemouth v Everton",
    "15:00 Aston Villa v West Ham United",
    "15:00 Brighton v Burnley",
    "15:00 Liverpool v Newcastle United",
    "15:00 Manchester United v Leicester City",
    "15:00 Norwich City v Manchester City",
    "15:00 Sheffield United v Southampton",
    "15:00 Tottenham Hotspur v Crystal Palace",
    "15:00 Watford v Arsenal",
    "15:00 Wolverhampton v Chelsea",
    ]
    ]
    
    //bundesliga
    var bundesligaFixtureList = [ "9 July 2020": ["15:00 Dortmund v Bayern Munich",
    "15:00 A.F.C. Bournemouth v Sheffield United",
    "15:00 Burnley v Southampton",
    "15:00 Crystal Palace v Everton",
    "15:00 Leicester City v Wolverhampton",
    "17:30 Tottenham Hotspur v Aston Villa",
    "15:00 Watford v Brighton",
    "12:30 West Ham United v Manchester City",
    "16:30 Manchester United v Chelsea",
    "14:00 Newcastle United v Arsenal"
    ],
    ]
    
    var selectedFixtureList = ["9 July 2020": ["15:00 Liverpool v Norwich City",
        "15:00 A.F.C. Bournemouth v Sheffield United",
        "15:00 Burnley v Southampton",
        "15:00 Crystal Palace v Everton",
        "15:00 Leicester City v Wolverhampton",
        "17:30 Tottenham Hotspur v Aston Villa",
        "15:00 Watford v Brighton",
        "12:30 West Ham United v Manchester City",
        "16:30 Manchester United v Chelsea",
        "14:00 Newcastle United v Arsenal"
    ]]
    
    @IBOutlet weak var searchButton: UIImageView!
    override func viewDidLoad()
    {
            super.viewDidLoad()
            tableView.delegate = self
            tableView.dataSource = self
            pickerView.delegate = self
            pickerView.dataSource = self
            selectField.inputView = pickerView
            selectField.textAlignment = .center
            selectField.placeholder = "Select League.."
            //selectField.isUserInteractionEnabled = false
    }
    
    
    //picker view components
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //picker view options count
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return dropDownArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dropDownArray[row]
    }
    
    //on select
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectFieldValue = row
        selectField.text = dropDownArray[row]
        selectField.resignFirstResponder()
        updateTable(selectedOption: row)
        tableView.reloadData()

    }
    
    func updateTable(selectedOption: Int)
    {
        switch(selectedOption)
        {
        case 0:
            selectedFixtureList =  eplFixtureList
        case 1:
            selectedFixtureList = bundesligaFixtureList
            
        default:
            selectedFixtureList =  eplFixtureList
        }
        tableView.reloadData()
    }
    
    }


    extension ViewController : UITableViewDataSource
    {
        
        //header of each section
        func tableView(_ tableView: UITableView, titleForHeaderInSection
                                    section: Int) -> String? {
            let header = Array(selectedFixtureList.keys)[section]
                           return header
            /*
            switch (selectFieldValue)
            {
            case 0:
                let header = Array(eplFixtureList.keys)[section]
                return header


            case 1:
                let header = Array(bundesligaFixtureList.keys)[section]
                return header
                
            default:
                let header = Array(eplFixtureList.keys)[section]
                return header
            }
             */
            
        }
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return selectedFixtureList.count

            /*
            switch (selectFieldValue)
            {
            case 0:
                return eplFixtureList.count
                
            case 1:
                return bundesligaFixtureList.count
                
            default:
                return eplFixtureList.count
                
            }
 */
        }
        
        //number of rows
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            let keyName = Array(selectedFixtureList.keys)[section]
            return selectedFixtureList[keyName]?.count ?? 0
            //return number of rows
/*
            switch (selectFieldValue)
            {
            case 0:
                let keyName = Array(eplFixtureList.keys)[section]
                return eplFixtureList[keyName]?.count ?? 0
                
            case 1:
                let keyName = Array(bundesligaFixtureList.keys)[section]
                return bundesligaFixtureList[keyName]?.count ?? 0
                
            default:
                let keyName = Array(eplFixtureList.keys)[section]
                return eplFixtureList[keyName]?.count ?? 0
                
            }
        */
        }
        
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            //check if cell exists and reuse the template
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            
            let sectionNumber = indexPath.section
            let rowNumber = indexPath.row
            let keyName = Array(selectedFixtureList.keys)[sectionNumber]
            cell.textLabel?.text = selectedFixtureList[keyName]?[rowNumber]
            
            /*
            switch (selectFieldValue)
            {
            case 0:
                let keyName = Array(eplFixtureList.keys)[sectionNumber]
                cell.textLabel?.text = eplFixtureList[keyName]?[rowNumber]
                
            case 1 :
                let keyName = Array(bundesligaFixtureList.keys)[sectionNumber]
                cell.textLabel?.text = bundesligaFixtureList[keyName]?[rowNumber]
                
            default :
                let keyName = Array(eplFixtureList.keys)[sectionNumber]
                cell.textLabel?.text = eplFixtureList[keyName]?[rowNumber]
            }
             */
            return cell
        }
        
    }
        //handle interations
    extension ViewController : UITableViewDelegate
    {
        //tapped cell
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print(indexPath)
        }
    }




