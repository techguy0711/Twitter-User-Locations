//
//  ContentView.swift
//  Twitter User Locations
//
//  Created by Kristhian De Oliveira on 4/8/21.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @ObservedObject var locationManager = LocationManager()
    @State private var userTrackingMode: MapUserTrackingMode = MapUserTrackingMode.follow
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D (
            latitude: 00.0000,
            longitude: 00.0000
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 1,
            longitudeDelta: 1
        )
    )
    //This class instance is hard coded for demo purposes
    var locations = Users(handle: ["@SwiftLanguageResources", "@Blind_Power_YT", "@ProgrammingisFun"], lat: [40, 80, 20], lon: [13, 46, 33], isFollowing: [false,true, false])
    var body: some View {
        userList().frame(width: .none, height: UIScreen.main.bounds.height/3, alignment: .center)
        map()
    }
    func userList() -> AnyView {
        AnyView (
            List(locations.pins()) {user in
                userRow(isFollowing: user.isFollowing, handle: user.handle)
            }
        )
    }
    func map() -> AnyView {
        AnyView(
            Map(coordinateRegion: $region, annotationItems: locations.pins()) { p in
                MapAnnotation(
                    coordinate: p.coordinate,
                    anchorPoint: CGPoint(x: 0.0, y: 0.0)
                ) {
                    HStack {
                        Text(p.handle[1])
                            .font(.largeTitle)
                            .bold()
                            .padding()
                    }.background(Color.blue)
                    .cornerRadius(25)
                }
            }
//            .onAppear {
//                region.center.latitude = locationManager.lastLocation?.coordinate.latitude ?? 0.0
//                region.center.longitude = locationManager.lastLocation?.coordinate.longitude ?? 0.0
//                print("Lat: \(region.center.latitude)")
//                print("Lon: \(region.center.longitude)")
//            }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
}
extension String {
    subscript(i: Int) -> String {
        return String(self[index(startIndex, offsetBy: i)])
    }
}
