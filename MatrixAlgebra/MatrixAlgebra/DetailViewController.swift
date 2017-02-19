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
    
    @IBOutlet var tableView: UITableView!
    var inputLabels  = [UILabel]()
    var outputLabels = [UILabel]()
    
    var matrixVector = [Matrix]()
    var matrixSelected1 : Int = -1
    var matrixSelected2 : Int = -1
    var operatorString : String = ""
    var savedMatrix = Matrix(row: 1, col: 1)
    
    
    @IBOutlet weak var saveObj: UIButton!
    
    @IBAction func plusButton(_ sender: Any) {
        if matrixSelected1 == -1 || matrixVector.count < 2 {
            return
        }
        operatorString = "Add"
    }
    func calculateAdd () {
        savedMatrix = sum(a: matrixVector[matrixSelected1], b: matrixVector[matrixSelected2])
        print(savedMatrix.description)
        setOutput(mat : savedMatrix)
        operatorString = ""
    }
    @IBAction func minusBUtton(_ sender: Any) {
        if matrixSelected1 == -1 || matrixVector.count < 2 {
            return
        }
        operatorString = "Subtract"
    }
    func calculateSubtract () {
        savedMatrix = sub(a: matrixVector[matrixSelected1], b: matrixVector[matrixSelected2])
        setOutput(mat : savedMatrix)
        operatorString = ""
    }
    @IBAction func multiplyButton(_ sender: Any) {
        if matrixSelected1 == -1 || matrixVector.count < 2 {
            return
        }
        operatorString = "Multiply"
    }
    func calculateMultiply () {
        savedMatrix = mult(a: matrixVector[matrixSelected1], b: matrixVector[matrixSelected2])
        setOutput(mat : savedMatrix)
        operatorString = ""
    }
    
    
    
    @IBAction func inverseButton(_ sender: Any) {
        if matrixSelected1 == -1 {
            return
        }
        let tempMat : Matrix = matrixVector[matrixSelected1]
        savedMatrix = inverse(a: tempMat)
        
        setOutput(mat: savedMatrix)
    }
    @IBAction func transposeButton(_ sender: Any) {
        if matrixSelected1 == -1 {
            return
        }
        let tempMat : Matrix = matrixVector[matrixSelected1]
        savedMatrix = transpose(a: tempMat)
        
        setOutput(mat: savedMatrix)
    }
    @IBAction func determinantButton(_ sender: Any) {
        if matrixSelected1 == -1 {
            return
        }
        let tempMat : Matrix = matrixVector[matrixSelected1]
        let tempFloat : Float = det(a: tempMat)
        savedMatrix = Matrix(row: 1, col: 1)
        savedMatrix.setSpot(rowSpot: 0, colSpot: 0, val: tempFloat)
        
        setOutput(mat: savedMatrix)
    }

    

    @IBAction func saveAction(_ sender: Any) {
        if savedMatrix.getSpot(rowSpot: 0, colSpot: 0) == Float.leastNormalMagnitude {
            return
        }
        saveObj.isHidden = true
        
        
        
        //Popup
        let alert = UIAlertController(title: "Matrix name: ", message: "", preferredStyle: .alert)
        
        
        
        alert.addTextField { (Name) in
            Name.keyboardType = UIKeyboardType.asciiCapable
            Name.placeholder = "Name"
        }
        
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { [weak alert] (_) in
            
            let name = alert?.textFields![0]
            
            self.savedMatrix.name = (name?.text!)!
            
            self.matrixVector.append(self.savedMatrix)
            
            self.tableView.reloadData()
            
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { [weak alert] (_) in}))
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)

        
    }
    
    

    
    
    @IBAction func RemoveSelected(_ sender: Any) {
        if self.matrixSelected1 != -1 {
            self.matrixVector.remove(at: self.matrixSelected1)
            self.matrixSelected1 = -1
            self.tableView.reloadData()
        }
        
        clearInput()
        clearOutput()
    }
    @IBAction func clearScreen(_ sender: Any) {
        clearOutput()
        clearInput()
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
            self.setMatrix(matrixToSet : matrixAux, index1: 0)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { [weak alert] (_) in}))
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
    
    func setMatrix(matrixToSet : Matrix, index1: Int) {
        
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Col: \(index1 + 1)", message: "", preferredStyle: .alert)
        
        for i in 0..<matrixToSet.row {
            
            //2. Open add text fields repeteadly in the pop-up. elem is got.
            alert.addTextField { (elementRow) in
                elementRow.placeholder = "Row: \(i + 1)"
                elementRow.keyboardType = UIKeyboardType.asciiCapable
            }
        }
        
            //3. Popping up and getting values
        alert.addAction(UIAlertAction(title: "Set Value", style: .default, handler: { [weak alert] (_) in
                
            for i in 0..<matrixToSet.row {
                let elementRowString = alert?.textFields![i]
                let elementRow = Float((elementRowString?.text)!)
                
                if let x = elementRow {
                    matrixToSet.setSpot(rowSpot: i, colSpot: index1, val: x)
                }
            }
            
            if index1 != matrixToSet.col-1 {
                self.setMatrix(matrixToSet : matrixToSet, index1: index1 + 1)
            }
            
        }))
        
            
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
        
    }
 
    // Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        saveObj.isHidden = true
        saveObj.addTarget(self, action: "saveAction:", for: UIControlEvents.touchUpInside)
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "matrixCell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.matrixVector.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: nil)
        let temp: Matrix = self.matrixVector[indexPath.row]
        let str1 = String(temp.row)
        let str2 = String(temp.col)
        
        cell.textLabel?.text = temp.name
        cell.detailTextLabel?.text = (str1 + " x " + str2)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(operatorString)
        
        switch operatorString {
        case "Add":
            matrixSelected2 = indexPath.row
            calculateAdd()
        case "Subtract":
            matrixSelected2 = indexPath.row
            calculateSubtract()
        case "Multiply":
            matrixSelected2 = indexPath.row
            calculateMultiply()
        default:
            matrixSelected1 = indexPath.row
            clearOutput()
        }
        
        matrixSelected1 = indexPath.row
        setInput(mat: matrixVector[matrixSelected1])
    }
    
    func setInput(mat : Matrix) {
        clearInput()
        
        let r : Int = mat.row + 1
        let c : Int = mat.col
        
        for i in 0..<c {
            inputLabels.append(UILabel(frame: CGRect(x: 300-35*c+70*i, y: 150-10*r, width: 70, height: 20*r)))
            
            inputLabels[i].layer.borderColor = UIColor.blue.cgColor;
            inputLabels[i].layer.borderWidth = 1.0;
            inputLabels[i].textAlignment = .center
            
            inputLabels[i].numberOfLines = r;
            
            inputLabels[i].text = mat.getCol(j: i)
            self.view.addSubview(inputLabels[i])
        }
    }
    
    func clearInput() {
        let val = inputLabels.count
        for _ in 0..<val {
            inputLabels[0].frame = CGRect(x: 250, y: 150, width: 0, height: 0)
            inputLabels.remove(at: 0)
        }
    }
    
    func setOutput(mat : Matrix) {
        clearOutput()
        
        let r : Int = mat.row + 1
        let c : Int = mat.col
        
        for i in 0..<c {
            outputLabels.append(UILabel(frame: CGRect(x: 550-35*c+70*i, y: 150-10*r, width: 70, height: 20*r)))
            
            outputLabels[i].layer.borderColor = UIColor.red.cgColor;
            outputLabels[i].layer.borderWidth = 1.0;
            outputLabels[i].textAlignment = .center
            
            outputLabels[i].numberOfLines = r;
            
            outputLabels[i].text = mat.getCol(j: i)
            self.view.addSubview(outputLabels[i])
        }
        saveObj.isHidden = false
    }
    
    func clearOutput() {
        
        let val = outputLabels.count
        for _ in 0..<val {
            outputLabels[0].frame = CGRect(x: 550, y: 150, width: 0, height: 0)
            outputLabels.remove(at: 0)
        }
        saveObj.isHidden = true
    }
}

extension Float {
    var cleanValue: Float {
        return self.truncatingRemainder(dividingBy: 1)
    }
}

