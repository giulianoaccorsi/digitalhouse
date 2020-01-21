//
//  CarTests.swift
//  Tests
//
//  Created by Giuliano Accorsi on 10/08/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import XCTest
@testable import UnitTest

class CarTests: XCTestCase {
    
    var ferrari: Car!
    var jeep: Car!
    var honda: Car!
    
    
    // Como escrever um bom código de teste
    // O que eu estou testando _ Como estou testando _ Oq eu espero de retorno


    override func setUp() {
        
        ferrari = Car(type: .Sport, transmissionMode: .Drive)
        jeep = Car(type: .OffRoad, transmissionMode: .Drive)
        honda = Car(type: .Economy, transmissionMode: .Park)
    }

    override func tearDown() {
        ferrari = nil
        jeep = nil
        honda = nil
        
    }
    
    func testCarroMaisRapido_PassandoTempo_ferrariMaisRapidaQueJeep() {
        let minutes = 9999999
        ferrari.start(minutes: minutes)
        jeep.start(minutes: minutes)
        
        XCTAssertTrue(ferrari.miles > jeep.miles, "testCarroMaisRapido_PassandoTempo_ferrariMaisRapidaQueJeep()")
        
    }
    
    
    
    
    func testPerformanceExample() {
       
        self.measure {

        }
    }

}
