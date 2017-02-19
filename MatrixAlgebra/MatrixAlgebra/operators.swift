//
//  operators.swift
//  MatrixAlgebra
//
//  Created by Michael Karr on 2/18/17.
//  Copyright © 2017 Michael Karr. All rights reserved.
//

import Foundation

func sum(a: Matrix, b: Matrix) -> Matrix {
    if (validate2DimSum(a: a, b: b)) {
        let matrixC = Matrix(row: a.row, col: a.col)
        for m in 0..<a.row {
            for n in 0 ..< a.col {
                matrixC.setSpot(rowSpot: m, colSpot: n, val: a.getSpot(rowSpot: m, colSpot: n) + b.getSpot(rowSpot: m, colSpot: n))
            }
        }
        return matrixC
    } else {
        let matrixC = Matrix(row: 1, col: 1)
        matrixC.setSpot(rowSpot: 0, colSpot: 0, val: Float.leastNormalMagnitude)
        return matrixC
    }
}

func mult(a: Matrix, b: Matrix) -> Matrix {
    if (validate2DimMult(a: a, b: b)) {
        let matrixC = Matrix(row: a.row, col: b.col)
        for m in 0..<a.row {
            for p in 0..<b.col {
                var sum: Float = 0
                for n in 0..<a.col {
                    sum += a.getSpot(rowSpot: m, colSpot: n) + b.getSpot(rowSpot: p, colSpot: n)
                }
                matrixC.setSpot(rowSpot: m, colSpot: p, val: sum)
            }
        }
        return matrixC
    } else {
        let matrixC = Matrix(row: 1, col: 1)
        matrixC.setSpot(rowSpot: 0, colSpot: 0, val: Float.leastNormalMagnitude)
        return matrixC
    }
}

func validate2DimSum(a: Matrix, b: Matrix) -> Bool {
    return a.col == b.col && a.row == b.row ? true : false
}

func validate2DimMult(a: Matrix, b: Matrix) -> Bool {
    return a.col == b.row ? true : false
}

func validate1Dim(a: Matrix) -> Bool {
    return a.row == a.col ? true : false
}
