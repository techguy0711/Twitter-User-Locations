//
//  userRow.swift
//  Twitter User Locations
//
//  Created by Kristhian De Oliveira on 4/8/21.
//

import SwiftUI

struct userRow: View {
    @State var isFollowing:Bool
    @State var handle:String
    var body: some View {
        HStack {
            Text(handle)
                .padding()
            Spacer()
            Button(action: {
                isFollowing.toggle()
            }) {
                Text(followButonLabel())
                    .foregroundColor(.white)
                    .font(.title)
                    .padding()
            }
            .background(followButtonColor())
            .cornerRadius(10)
        }
    }
    func followButonLabel() -> String {
        if isFollowing == true {
            return "Following"
        }
        return "Follow"
    }
    func followButtonColor() -> Color {
        if isFollowing == true {
            return .green
        }
        return .blue
    }
}

struct userRow_Previews: PreviewProvider {
    static var previews: some View {
        userRow(isFollowing: false, handle: "@MyTwitterHandle")
    }
}
