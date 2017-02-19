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
        return errorReturn()
    }
}

func sub(a: Matrix, b: Matrix) -> Matrix {
    if (validate2DimSum(a: a, b: b)) {
        let matrixC = Matrix(row: a.row, col: a.col)
        for m in 0..<a.row {
            for n in 0 ..< a.col {
                matrixC.setSpot(rowSpot: m, colSpot: n, val: a.getSpot(rowSpot: m, colSpot: n) - b.getSpot(rowSpot: m, colSpot: n))
            }
        }
        return matrixC
    } else {
        return errorReturn()
    }
}

func mult(a: Matrix, b: Matrix) -> Matrix {
    if (validate2DimMult(a: a, b: b)) {
        let matrixC = Matrix(row: a.row, col: b.col)
        for m in 0..<a.row {
            for p in 0..<b.col {
                var sum: Float = 0
                for n in 0..<a.col {
                    sum += a.getSpot(rowSpot: m, colSpot: n) * b.getSpot(rowSpot: n, colSpot: p)
                }
                matrixC.setSpot(rowSpot: m, colSpot: p, val: sum)
            }
        }
        return matrixC
    } else {
        return errorReturn()
    }
}

func transpose(a: Matrix) -> Matrix {
    let matrixC = Matrix(row: a.col, col: a.row)
    for m in 0..<a.row {
        for n in 0..<a.col {
            matrixC.setSpot(rowSpot: n, colSpot: m, val: a.getSpot(rowSpot: m, colSpot: n))
        }
    }
    return matrixC
}

/*func cof(a: Matrix) -> Matrix {
    
}*/

func minor(a: Matrix, i: Int, j: Int) -> Matrix {
    let matrixC = Matrix(row: a.row-1, col: a.col-1)
    for m in 0..<a.row {
        if (m != i) {
            for n in 0..<a.col {
                if (n != j) {
                    matrixC.setSpot(rowSpot: (m < i) ? m : m-1, colSpot: (n < j) ? n : n-1, val: a.getSpot(rowSpot: m, colSpot: n))
                }
            }
        }
    }
    return matrixC
}

func cofactor(a: Matrix, i: Int, j: Int) -> Float {
    let matrixC = minor(a: a, i: i, j: j)
    return ((((i+j) % 2) == 0) ? 1 : -1) * det(a: matrixC)
}

func det(a: Matrix) -> Float {
    if (!validateSquare(a: a)) {
        return Float.leastNormalMagnitude
    }
    if a.row == 1 {
        return a.getSpot(rowSpot: 0, colSpot: 0)
    }
    var returnDet: Float = 0
        for m in 0..<a.row {
            returnDet += a.getSpot(rowSpot: 0, colSpot: m) * cofactor(a: a, i: 0, j: m)
    }
    return returnDet
}

func inverse(a: Matrix) -> Matrix {
    if (!validateSquare(a: a)) {
        return errorReturn()
    }
    
    let aDet: Float = det(a: a)
    if (aDet == 0) {
        let matrixC = Matrix(row: 1, col: 1)
        matrixC.setSpot(rowSpot: 0, colSpot: 0, val: Float.greatestFiniteMagnitude)
        return matrixC
    }
    
    let aInverse: Matrix = Matrix(row: a.row, col: a.col)
    for i in 0..<a.row {
        for j in 0..<a.col {
            aInverse.setSpot(rowSpot: i, colSpot: j, val: cofactor(a: a, i: i, j: j)/aDet)
        }
    }
    return transpose(a: aInverse)
}

/*func delCol(array: Array<Array<Float>>, arrCol: Int) -> Array<Array<Float>> {
    for i in 0..<array.capacity {
        array[i].remove(at: arrCol)
    }
    return array
}

func delRow(array: Array<Array<Float>>, arrRow: Int) -> Array<Array<Float>> {
    array.remove(at: arrRow)
    return array
}*/

func validate2DimSum(a: Matrix, b: Matrix) -> Bool {
    return a.col == b.col && a.row == b.row ? true : false
}

func validate2DimMult(a: Matrix, b: Matrix) -> Bool {
    return a.col == b.row ? true : false
}


func validateSquare(a: Matrix) -> Bool {
    return a.row == a.col ? true : false
}

func errorReturn() -> Matrix {
    let matrixC = Matrix(row: 1, col: 1)
    matrixC.setSpot(rowSpot: 0, colSpot: 0, val: Float.leastNormalMagnitude)
    return matrixC
}
