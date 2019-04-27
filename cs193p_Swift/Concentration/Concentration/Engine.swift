//
//  Engine.swift
//  Concentration
//
//  Created by Ivan Kozlov on 25/04/2019.
//  Copyright © 2019 Ivan Kozlov. All rights reserved.
//

import Foundation

enum CardState{
    case hide
    case open
    case close
}

class Engine{
    private var state:[CardState]
    private(set) var identifer:[Int]
    private(set) var labels:[String]
    private(set) var score = 0
    
    init(count: Int, newlabels: [String]){
        assert(count == newlabels.count * 2)
        state = Array(repeating: .close, count: count)
        identifer = Array(repeating: 0, count: count)
        for i in stride(from: 0, to: count, by: 2) {
            identifer[i] = i / 2
            identifer[i+1] = i / 2
        }
        labels = newlabels
        identifer.shuffle()
    }
    
    func openCard(index: Int)->[CardState]{
        if (state[index] == .open || state[index] == .hide) {return state}
        var openCount = 0
        for tmp in state where tmp == .open{
            openCount += 1
        }
        if (openCount >= 2){
            for i in 0..<state.count where state[i] == .open{
                state[i] = .close
            }
            score -= 1
            if(score < 0) {score = 0}
            state[index] = .open
        } else if (openCount == 0){
            state[index] = .open
        } else{
            for i in 0..<state.count where (state[i] == .open) && (identifer[i] == identifer[index]){
                state[index] = .hide
                state[i] = .hide
                score += 2
                return state
            }
            state[index] = .open
        }
        return state
    }
    
    func getState()->[CardState]{
        return state
    }
}
