//
//  DetailViewController.swift
//  MatrixAlgebra
//
//  Created by Michael Karr on 2/18/17.
//  Tree Hacks 2017 Team Norcliffe
//  Copyright © 2017 Michael Karr. All rights reserved.
//

import UIKit

//MVC:
//Models: what holds your data
//Views: everything you see and interact with
//Controllers: code, intermediate between model and view

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet
    var tableView: UITableView!
    
    var matrixVector = [Matrix]()
    
    @IBAction func determinantButton(_ sender: Any) {
        print(matrixVector.count)
    }
    @IBAction func cofactorButton(_ sender: Any) {
    }
    @IBAction func transposeButton(_ sender: Any) {
    }
    @IBAction func inverseButton(_ sender: Any) {
    }
    @IBAction func multiplyButton(_ sender: Any) {
    }
    @IBAction func minusBUtton(_ sender: Any) {
    }
    @IBAction func removeLastButton(_ sender: Any) {
        if self.matrixVector.count > 0 {
            self.matrixVector.remove(at: 0)
            self.tableView.reloadData()
        }
    }
    @IBAction func plusButton(_ sender: Any) {
        let matrixTemp = Matrix(row: 1, col: 1)
        matrixTemp.name = "name"
        self.matrixVector.append(matrixTemp)
        self.tableView.reloadData()
    }
    @IBAction func clearScreen(_ sender: Any) {
    }
    @IBAction func clearTable(_ sender: Any) {
        matrixVector.removeAll()
        self.tableView.reloadData()
    }
    @IBAction func createMatrixButton(_ sender: Any) {
        
         //1. Create the alert controller.
         let alert = UIAlertController(title: "New Matrix", message: "", preferredStyle: .alert)
        
         //2. Add the text fields. Name, Rows and Columns.
         alert.addTextField { (Name) in
         Name.keyboardType = UIKeyboardType.asciiCapable
         Name.placeholder = "Name"
         }
         
         alert.addTextField { (Rows) in
         Rows.keyboardType = UIKeyboardType.asciiCapable
         Rows.placeholder = "Rows"
         }
         
         alert.addTextField { (Columns) in
         Columns.keyboardType = UIKeyboardType.asciiCapable
         Columns.placeholder = "Columns"
         }
        
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "Create", style: .default, handler: { [weak alert] (_) in
            
            let name = alert?.textFields![0]
            
            let rowsString = alert?.textFields![1]
            let rows = Int((rowsString?.text)!)
            
            let columnsString = alert?.textFields![2]
            let columns = Int((columnsString?.text)!)
            
            let matrixAux = Matrix(row: rows!, col: columns!)
            matrixAux.name = (name?.text!)!
            
            self.matrixVector.append(matrixAux)
            self.tableView.reloadData()
        }))
 
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
 
    // Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "matrixCell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Table functions
    func addMatrix(toAdd: Matrix) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.matrixVector.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "matrixCell")! as UITableViewCell
        let temp: Matrix = self.matrixVector[indexPath.row]
        let str1 = String(temp.row)
        let str2 = String(temp.col)
        
        cell.textLabel?.text = temp.name
        cell.detailTextLabel?.text = (str1 + " x " + str2)
        
        print(str1 + " x " + str2)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected matrix \(matrixVector[indexPath.row].name)!")
    }
}

extension Float {
    var cleanValue: Float {
        return self.truncatingRemainder(dividingBy: 1)
    }
}

