//
//  matrixObj.swift
//  MatrixAlgebra
//
//  Created by Michael Karr on 2/18/17.
//  Tree Hacks 2017 Team Norcliffe
//  Copyright © 2017 Michael Karr. All rights reserved.
//

import Foundation

class matrix {
    var row: Int = 0
    var col: Int = 0
    var arr = Array<Array<Int>>()
    
    init (row: Int, col: Int) {
        self.row = row
        self.col = col
        for _ in 0..<col {
            arr.append(Array(repeating:Int(), count:row - 1))
        }
        print("array \(arr)")
    }
    
    //use guard for correcting inputs
    
    func setSpot(rowSpot: Int, colSpot: Int, val: Int) -> String {
        
        if (inBounds(rowSpot: rowSpot, colSpot: colSpot)) {
            arr[rowSpot][colSpot] = val
            return ""
        } else {
            return "Index not in bounds"
        }
    }
    
    func getSpot(rowSpot: Int, colSpot: Int) -> Int {
        if (inBounds(rowSpot: rowSpot, colSpot: colSpot)) {
            return arr[rowSpot][colSpot]
        } else {
            //return nil
        }
    }
    
    func inBounds(rowSpot: Int, colSpot: Int) -> Bool {
        if (rowSpot >= 0 && rowSpot < row && colSpot >= 0 && colSpot < col) {
            return true
        } else {
            return false
        }
    }
}
