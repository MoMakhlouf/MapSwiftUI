//
//  LocationView.swift
//  MapSwiftUI
//
//  Created by Mohamed Makhlouf Ahmed on 12/02/2023.
//
import Foundation
import SwiftUI
import MapKit
import WebKit

struct LocationView: View {
    @EnvironmentObject private var vm : LocationViewModel
    // @State var showList : Bool = false
    @State var maxWidth : CGFloat = 700
    var body: some View {
        
        ZStack{
             mapLayer
             .ignoresSafeArea()
            VStack{
              headerList
                .frame(maxWidth: maxWidth)
                .padding()
              Spacer()
              mapPreviewView
            }
        }
        .sheet(item: $vm.detailSheet) { location in
            LocationDetailsView(location: location)
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
            .environmentObject(LocationViewModel())
    }
}


extension LocationView {
    var headerList : some View {
        VStack{
            Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName )
                .font(.title)
                .foregroundColor(.primary)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
                .frame(minHeight: 50)
                .overlay(alignment: .leading) {
                    Image(systemName:  vm.showList ?  "arrow.down" : "arrow.right" )
                        .fontWeight(.bold)
                        .padding()
                }
                .onTapGesture {
                    withAnimation {
                        animation(.easeInOut(duration: 3))
                        vm.toggleShowList()
                    }
                    
                }
            
            if vm.showList{
                LocationListView()
                
            }
        }
        .background(.thinMaterial)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
    
    
    private var mapLayer : some View {
        Map(coordinateRegion: $vm.mapRegion, interactionModes: .zoom, showsUserLocation: true, annotationItems: vm.locations) { location in
            MapAnnotation(coordinate: location.coordinates) {
                MapAnnotationView()
                    .scaleEffect(vm.mapLocation == location ? 1 : 0.6)
                    .onTapGesture {
                        vm.showNextLocation(location: location)
                    }
            }
        }
    }
    
    private var mapPreviewView : some View {
        ZStack{
            ForEach(vm.locations) { location in
                if vm.mapLocation == location {
                    LocationPreviewView(location:location)
                        .shadow(color: .black.opacity(0.3), radius: 20)
                        .frame(maxWidth: 700)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .animation(.easeInOut(duration: 0.5))
                        .transition(.asymmetric(
                            insertion: .move(edge: .trailing),
                            removal: .move(edge: .leading)))
                }
            }
        }
        
    }
}



