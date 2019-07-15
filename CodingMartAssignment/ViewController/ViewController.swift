//
//  ViewController.swift
//  CodingMartAssignment
//
//  Created by iWizards XI on 13/07/19.
//  Copyright © 2019 iWizards XI. All rights reserved.
//

import UIKit


var isCollapsed = [Bool]()
var selectedCell = Int()


class ViewController: UIViewController{
    @IBOutlet var tblJsonData: UITableView!
    
    var arr = [JsonData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arr = parseJson()
        isCollapsed.removeAll()
        
        for _ in arr{
            isCollapsed.append(false)
        }
    }
    
}


extension ViewController : UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        var frame = CGRect()
        frame = tableView.frame
        
        let buttonExpand = UIButton()
        buttonExpand.setTitle(arr[section].name, for: .normal)
        buttonExpand.setTitleColor(#colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1), for: .normal)
        buttonExpand.addTarget(self, action: #selector(expand(button:)), for: .touchUpInside)
        buttonExpand.tag = section
        buttonExpand.frame = CGRect(x: 10, y: 5, width: frame.size.width, height: 50)
        buttonExpand.contentHorizontalAlignment = .left
        buttonExpand.titleLabel?.font =  UIFont(name: "Helvetica Neue", size: 18)
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        headerView.addSubview(buttonExpand)
        return headerView
        
    }
    
    @objc func expand(button: UIButton) {
        var collapsed = isCollapsed[selectedCell]
        let section = button.tag
        selectedCell = section
        collapsed = isCollapsed[selectedCell]
        if collapsed {
            isCollapsed[section] = false
        }
        else {
            isCollapsed[section] = true
        }
        self.tblJsonData.reloadData()
        print("Button Expand Pressed")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let collapse = isCollapsed[section]
        if collapse{
            return arr[section].sub_category!.count
        }else{
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! SubCategoryTableViewCell
        
        cell.lblName.text = arr[indexPath.section].sub_category?[indexPath.row].name
        cell.lblDisplayName.text = arr[indexPath.section].sub_category?[indexPath.row].display_name
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }else{
            cell.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        }
        
        return cell
    }
    
}

