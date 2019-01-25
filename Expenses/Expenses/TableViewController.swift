//
//  TableViewController.swift
//  Expenses
//
//  Created by Melissa Hollingshed on 1/24/19.
//  Copyright © 2019 Melissa Hollingshed. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    @IBOutlet weak var ExpensesTableView: UITableView!
    
    
    let dateFormatter = DateFormatter()
    var expenses = [Expense]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ExpensesTableView.delegate = self
        ExpensesTableView.dataSource = self
        
        dateFormatter.dateFormat = "MMM dd,yyyy HH:mm"
        expenses.append(Expense(title: "Dinner", amount: 32.50, date: dateFormatter.date(from: "June 1, 2018 18:30")!))
        expenses.append(Expense(title: "Office Supplies", amount: 59.34, date: dateFormatter.date(from: "May 30, 2018 12:17")!))
        expenses.append(Expense(title: "Über", amount: 16.23, date: dateFormatter.date(from: "May 30, 2018 11:43")!))
        expenses.append(Expense(title: "Coffee", amount: 3.95, date: dateFormatter.date(from: "May 29, 2018 8:45")!))
        
        title = "Expenses"

        // Do any additional setup after loading the view.
    }
    

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "expensesCell", for: indexPath) as! TableViewCell
        
        let title = expenses[indexPath.row].title
        let amount = expenses[indexPath.row].amount
        let date = expenses[indexPath.row].date
        
        cell.titleLabel.text = title
        cell.amountLabel.text = "$\(amount)"
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd, yyyy HH:mm"
        if let dateForm = dateFormatterGet.date(from: "\(date)") {
            cell.DateLabel.text = dateFormatterPrint.string(from: dateForm)
        } else {
           // error
        }
    
        
        return cell
    }
   
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
