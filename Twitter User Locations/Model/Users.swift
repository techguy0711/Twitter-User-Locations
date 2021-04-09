//
//  Users.swift
//  Twitter User Locations
//
//  Created by Kristhian De Oliveira on 4/8/21.
//
import Foundation
import CoreLocation
import Combine

struct pin: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    let handle:String
    let isFollowing:Bool
}
class Users {
    var Handle:[String] = []
    var Lat:[Double] = []
    var Lon:[Double] = []
    var isFollowing:[Bool] = []
    init(handle:[String], lat:[Double], lon:[Double], isFollowing:[Bool]) {
        self.Handle = handle
        self.Lat = lat
        self.Lon = lon
        self.isFollowing = isFollowing
    }
    func pins() -> [pin] {
        var pins:[pin] = []
        for i in 0..<Lon.count {
            let lat = Lon[i]
            let lon = Lon[i]
            let handle = Handle[i]
            let follow = isFollowing[i]
            pins.append(
                pin(coordinate: .init(latitude: (lat) , longitude: (lon) ), handle: handle, isFollowing: follow)
            )
        }
        print(pins)
        return pins
    }
}
