//
//  MapAnnotationView.swift
//  MapSwiftUI
//
//  Created by Mohamed Makhlouf Ahmed on 13/02/2023.
//

import SwiftUI

struct MapAnnotationView: View {
    var body: some View {
        VStack(spacing: 0){
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 35 , height: 35)
                .foregroundColor(.white)
                .padding(6)
                .background(Color.accentColor)
                .cornerRadius(41)
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(.accentColor)
                .frame(width: 10 , height: 10)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -2.5)
            //to be on the actual location in map
                .padding(.bottom , 40)
            
        }
    }
}

struct MapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        MapAnnotationView()
    }
}
