//
//  TestAutomatedPRReviews.swift
//  Weather
//
//  Created by RAGHAV SHARMA on 30/05/23.
//

class Master {
    lazy var detail: Detail = Detail(master: self)
    
    init() {
        print("Master init")
    }
    
    deinit {
        print("Master deinit")
    }
}

class Detail {
    var master: Master
    
    init(master: Master) {
        print("Detail init")
        self.master = master
    }
    
    deinit {
        print("Detail deinit")
    }
}

class TestCodeReviews {
    func createMaster() {
        var master: Master = Master()
        var detail = master.detail
    }
    
    
    init() {
        createMaster()
    }
}
