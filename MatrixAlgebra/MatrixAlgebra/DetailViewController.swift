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
    
    // Testing
    let matrixData = [
        MatrixButton(name: "Matrix A", matrixParam: Matrix(row: 2, col: 2)),
        MatrixButton(name: "Matrix B", matrixParam: Matrix(row: 2, col: 3)),
        MatrixButton(name: "Matrix C", matrixParam: Matrix(row: 3, col: 3))
    ]
    
    @IBAction func determinantButton(_ sender: Any) {
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
    }
    @IBAction func newMatrixButton(_ sender: Any) {
    }
    
    
    // Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let matrix1 = Matrix(row: 5, col: 2)
        
        print("Row: \(matrix1.row) Col: \(matrix1.col)")

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Table functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

