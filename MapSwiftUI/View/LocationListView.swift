//
//  LocationListView.swift
//  MapSwiftUI
//
//  Created by Mohamed Makhlouf Ahmed on 12/02/2023.
//

import SwiftUI

struct LocationListView: View {
    @EnvironmentObject var vm : LocationViewModel
    var body: some View {
        List{
            ForEach(vm.locations) { location in
                Button {
                    vm.showNextLocation(location: location)
                } label: {
                    listRowView(location: location)

                }

                
            }
            .listRowBackground(Color.clear)
        }
        .listStyle(.plain)
       
    }
}

struct LocationListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationListView()
            .environmentObject(LocationViewModel())
    }
}


extension LocationListView {
    private func listRowView(location : Location) -> some View {
        HStack{
            if let imageName = location.imageNames.first{
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 45 , height: 45)
            }
            VStack(alignment: .leading){
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            }
            .frame(maxWidth : .infinity , alignment: .leading)
        }
        .background(Color.clear)
        
    }
}
