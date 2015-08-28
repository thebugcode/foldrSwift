//
//  ViewController.swift
//  asdas
//
//  Created by Dan Ursu on 26/08/15.
//  Copyright (c) 2015 Dan Ursu. All rights reserved.
//

import UIKit
infix operator >>> { associativity left }
func >>> <A, B, C>(f: B -> C, g: A -> B) -> A -> C {
    return { x in f(g(x)) }
}

func foldr<U,T> (initial:U, function: (U,T) -> U, collection: Array<T> ) -> U {
    var combined = initial
    for object in collection {
        combined = function(combined, object)
    }
    
    return combined;
    
}


func count(array: Array<Int>) -> Int {
    return foldr(0,  { (value, currentObject) -> Int in
        return value + 1
        },  array)
}


func sum(array: Array<Int>) -> Int {
    return foldr(0,  { (x, y) -> Int in
        return x + y
        },  array)
}


func map(array: Array<Int>) -> Array<Int> {
    return foldr([], { (value, currentObject) -> Array<Int> in
        var mutableArray:Array = value
        mutableArray.append(currentObject  * 2)
        return mutableArray
        }, array)
}


class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let array = [1, 2, 3, 4, 5, 6, 7]
        
        let mappedArray = map(array)
        let numberOfObjects = count(array)
        let sumOfObjects = sum(array)
    }
}

