//
//  matrixObj.swift
//  MatrixAlgebra
//
//  Created by Michael Karr on 2/18/17.
//  Tree Hacks 2017 Team Norcliffe
//  Copyright © 2017 Michael Karr. All rights reserved.
//

import Foundation

class Matrix {
    var name: String = ""
    var row: Int = 0
    var col: Int = 0
    var arr = Array<Array<Float>>()
    
    init (row: Int, col: Int) {
        self.row = row
        self.col = col
        for _ in 0..<col {
            arr.append(Array(repeating:Float(), count:row))
        }
        print("array \(arr)")
    }
    
    //use guard for correcting inputs
    
    func getSize() -> (row: Int, col: Int) {
        return (row, col)
    }
    
    func setSpot(rowSpot: Int, colSpot: Int, val: Float) {
        
        guard inBounds(rowSpot: rowSpot, colSpot: colSpot) else {
            return
        }

        arr[rowSpot][colSpot] = val

    }
    
    func getSpot(rowSpot: Int, colSpot: Int) -> Float {
        guard inBounds(rowSpot: rowSpot, colSpot: colSpot) else {
            return Float.leastNormalMagnitude
        }
        
        return arr[rowSpot][colSpot]
    }
    
    func inBounds(rowSpot: Int, colSpot: Int) -> Bool {
        if (rowSpot >= 0 && rowSpot < row && colSpot >= 0 && colSpot < col) {
            return true
        } else {
            return false
        }
    }
}
