//
//  ContentView.swift
//  WetherApp
//
//  Created by Martin Wainaina on 07/11/2023.
//

import SwiftUI

struct ContentView: View {
    /**
     @StateObject will enable the view to be notified everytime the @Published variables in LocationManager are updated
     */
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        VStack {
            /**
             if we dont have the location, we won't display the coordinates.
             */
            if let location = locationManager.location{
                Text("------> Your coordinates are: \(location.longitude), \(location.latitude)")
            }
            else{
                if locationManager.isLoading {
                   LoadingView()
                }
                else{
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
            
        }
        .background(Color(hue: 0.631, saturation: 0.992, brightness: 0.515))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
