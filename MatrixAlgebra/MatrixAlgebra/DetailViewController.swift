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

    // Testing
    var matrixData = [
        MatrixButton(name: "Matrix A", matrixParam: Matrix(row: 2, col: 2)),
        MatrixButton(name: "Matrix B", matrixParam: Matrix(row: 2, col: 3)),
        MatrixButton(name: "Matrix C", matrixParam: Matrix(row: 3, col: 3))
    ]
    
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
    @IBAction func minusButton(_ sender: Any) {
    }
    @IBAction func plusButton(_sender: Any) {
    }
    @IBAction func clearScreenButton(_ sender: Any) {
    }
    @IBAction func clearTableButton(_ sender: Any) {
        print("Clear Table")
    }
    @IBAction func newMatrixButton(_ sender: Any) {
        
        //1. Create the alert controller.
        let alert = UIAlertController(title: "New Matrix", message: "", preferredStyle: .alert)
        
        //2. Add the text fields. Name, Rows and Columns.
        alert.addTextField { (Name) in
            Name.text = "Name"
        }
        
        alert.addTextField { (Rows) in
            Rows.text = "Rows"
        }
        
        alert.addTextField { (Columns) in
            Columns.text = "Columns"
        }
        
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "Create", style: .default, handler: { [weak alert] (_) in
            let name = alert?.textFields![0]
            
            let rowsString = alert?.textFields![1]
            let rows = Int((rowsString?.text)!)
            
            let columnsString = alert?.textFields![2]
            let columns = Int((columnsString?.text)!)
            
            let matrixAux = Matrix(row: rows!, col: columns!)
            self.matrixVector.append(matrixAux)
            
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
        return self.matrixData.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "matrixCell")! as UITableViewCell
        let tempButton: MatrixButton = self.matrixData[indexPath.row]
        let str1 = String(tempButton.row)
        let str2 = String(tempButton.col)
        
        cell.textLabel?.text = tempButton.name
        cell.detailTextLabel?.text = (str1 + " x " + str2)
        
        print(str1 + " x " + str2)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected matrix \(matrixData[indexPath.row].name)!")
    }
}

extension Float {
    var cleanValue: Float {
        return self.truncatingRemainder(dividingBy: 1.0)
    }
}

