//
//  LocationViewModel.swift
//  MapSwiftUI
//
//  Created by Mohamed Makhlouf Ahmed on 12/02/2023.
//

import Foundation
import MapKit
import SwiftUI
class LocationViewModel : ObservableObject{
    @Published var detailSheet : Location? = nil
    @Published var showList : Bool = false
    @Published var locations : [Location]
    @Published var mapLocation : Location {
        didSet{
            updateMapRegion(location: mapLocation)
        }
    }
    
    @Published  var mapRegion : MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        
        self.updateMapRegion(location: locations.first!)
    }
    
    
    private func updateMapRegion(location : Location){
        
        mapRegion = MKCoordinateRegion(center: location.coordinates, span: mapSpan)
        
    }
    func toggleShowList(){
        DispatchQueue.main.async {
            withAnimation(.easeInOut) {
                self.showList.toggle()
                
            }
        }
        
    }
    
    
    func showNextLocation(location : Location){
        withAnimation(Animation.easeInOut(duration: 0.5)){
            mapLocation = location
            showList = false
        }
       
    }
    
    //Next button int the preview card
    func nextButtonPressed(){
        
        guard let currentIndex = locations.firstIndex(where: {$0 == mapLocation}) else {
            return
        }
        let nextIndex  = currentIndex + 1
        
        guard locations.indices.contains(nextIndex) else{
            
            guard let firstLocation = locations.first else {return }
            showNextLocation(location: firstLocation)
            return
        }
        let nextLocation =  locations[nextIndex]
        showNextLocation(location: nextLocation)
    }
    
    
}
