//
//  MountainPass.swift
//  mountain-pass
//
//  Created by Vasily on 21.05.2022.
//

import Foundation
import RealmSwift

class MountainPass {
    @objc dynamic var title: String = ""
    @objc dynamic var addTime: String = ""
    @objc dynamic var user: User = User()
    @objc dynamic var latitude: String = ""
    @objc dynamic var longitude: String = ""
    @objc dynamic var height: String = ""
    @objc dynamic var levelWinter: String = ""
    @objc dynamic var levelSpring: String = ""
    @objc dynamic var levelSummer: String = ""
    @objc dynamic var levelAutumn: String = ""
    
    convenience init(title: String, addTime: String, user: User, latitude: String,longitude: String, height: String, levelWinter: String, levelSpring: String, levelSummer: String, levelAutumn: String) {
        self.init()
        self.title = title
        self.addTime = addTime
        self.user = user
        self.latitude = latitude
        self.longitude = longitude
        self.height = height
        self.levelWinter = levelWinter
        self.levelSpring = levelSpring
        self.levelSummer = levelSummer
        self.levelAutumn = levelAutumn
    }
}
