//
//  ViewController.swift
//  CheckBox_TableView
//
//  Created by Santhosh Marripelli on 18/05/16.
//  Copyright © 2016 Santhosh Marripelli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var objTable: UITableView!
    
    var numberArray = NSMutableArray()
    var selectedArray=NSMutableArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for index in 1...200 {

        numberArray.add(index)
        
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return numberArray.count;
        
    }
     func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell
     {
        let contact = numberArray.object(at: indexPath.row)
        let cell:MyCustomClass = objTable.dequeueReusableCell(withIdentifier: "reuseCell") as! MyCustomClass
        
        cell.textLabel?.text = String("Number \(contact)")
        
        cell.tickButton.addTarget(self, action:#selector(ViewController.tickClicked(_:)), for: .touchUpInside)
        
        cell.tickButton.tag=indexPath.row

        if selectedArray .contains(numberArray.object(at: indexPath.row)) {
            cell.tickButton.setBackgroundImage(UIImage(named:"Select.png"), for: UIControlState())
        }
        else
        {
            cell.tickButton.setBackgroundImage(UIImage(named:"Diselect.png"), for: UIControlState())
        }
        return cell
    }
    
    func tickClicked(_ sender: UIButton!)
    {
        let value = sender.tag;
        
        if selectedArray.contains(numberArray.object(at: value))
        {
            selectedArray.remove(numberArray.object(at: value))
        }
        else
        {
            selectedArray.add(numberArray.object(at: value))
        }
        
        print("Selecetd Array \(selectedArray)")
        
    objTable.reloadData()
    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAtIndexPath indexPath: IndexPath) ->CGFloat
    {
        return 80.0
    }


}

