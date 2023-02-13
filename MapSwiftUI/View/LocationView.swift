//
//  LocationView.swift
//  MapSwiftUI
//
//  Created by Mohamed Makhlouf Ahmed on 12/02/2023.
//

import SwiftUI
import MapKit

struct LocationView: View {
    @EnvironmentObject private var vm : LocationViewModel
   // @State var showList : Bool = false
    var body: some View {
        
        ZStack{
            Map(coordinateRegion: $vm.mapRegion)
                .ignoresSafeArea()
            VStack{
                header
                 .padding()
                Spacer()
            }
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
    var header : some View {
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
}
