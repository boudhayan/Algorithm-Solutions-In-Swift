//
//  LowestCommonInteger.swift
//  Algorithm Solutions In Swift
//
//  Created by Boudhayan Biswas on 23/06/22.
//

import Foundation

class OrganizationalEntity {
  let name: String
  var directReports = [OrganizationalEntity]()

  init(name: String) {
    self.name = name
  }
}

func getLowestCommonManager(_ topManager: OrganizationalEntity, _ reportOne: OrganizationalEntity, _ reportTwo: OrganizationalEntity) -> OrganizationalEntity? {
    return organizationInfo(topManager, reportOne, reportTwo).0
}

func organizationInfo(_ manager: OrganizationalEntity, _ reportOne: OrganizationalEntity, _ reportTwo: OrganizationalEntity) -> (OrganizationalEntity?, Int) {
    var impReports = 0
    print("called for: \(manager.name)")
    for report in manager.directReports {
        let info = organizationInfo(report, reportOne, reportTwo)
        if info.0 != nil {
            return info
        }
        impReports += info.1
    }
    if manager === reportOne || manager === reportTwo {
        impReports += 1
    }
    let lcm = impReports == 2 ? manager : nil
    return (lcm, impReports)
    
}

//let h = OrganizationalEntity(name: "h")
//h.directReports = []
//let i = OrganizationalEntity(name: "i")
//i.directReports = []
//let f = OrganizationalEntity(name: "f")
//f.directReports = []
//let g = OrganizationalEntity(name: "g")
//h.directReports = []
//let d = OrganizationalEntity(name: "d")
//d.directReports = [h, i]
//let e = OrganizationalEntity(name: "e")
//e.directReports = []
//let b = OrganizationalEntity(name: "b")
//b.directReports = [d, e]
//let c = OrganizationalEntity(name: "c")
//c.directReports = [f, g]
//let a = OrganizationalEntity(name: "a")
//a.directReports = [b, c]
//
//
//print(getLowestCommonManager(a, h, e)?.name ?? "")
