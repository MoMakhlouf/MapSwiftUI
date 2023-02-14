//
//  LocationDetailsView.swift
//  MapSwiftUI
//
//  Created by Mohamed Makhlouf Ahmed on 13/02/2023.
//

import SwiftUI

struct LocationDetailsView: View {
    let location : Location
    @State var wiki : Bool = false
    @EnvironmentObject var vm : LocationViewModel
    var body: some View {
        ScrollView{
            VStack{
               imagesTabView
                
                VStack(alignment: .leading){
                    Text(location.name)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    Text(location.cityName)
                        .font(.title)
                        .foregroundColor(.secondary)
                    
                }
                .frame(maxWidth: .infinity , alignment: .leading)
                .padding()
                
                VStack(alignment : .leading , spacing: 1){
                    Text(location.description)
                        .padding()
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                  //  if let url  = URL(string:  location.link) {
                    //    Link("", destination: url)
                     
                        Button {
                            wiki.toggle()
                        } label: {
                            Text("Read more on wikipedia")
                        }
                         .foregroundColor(.blue)
                         .padding(.leading)
                        // .padding(.bottom , 30)
                 

                        
                    //}
                }
                Spacer()
                //.padding(.bottom)
            }
        }
        .sheet(isPresented: $wiki, content: {
            WebView(url: location.link)
        })
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(alignment: .topLeading) {
            Button {
                vm.detailSheet = nil
            } label: {
                Image(systemName: "xmark")
                    .font(.headline)
                    .foregroundColor(.accentColor)
                    .frame(width: 40 , height: 40)
                    .background(Color.white.cornerRadius(10))
                    .padding()
            }

        }
    }
}

struct LocationDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailsView(location: LocationsDataService.locations.first!)
            .environmentObject(LocationViewModel())
            
    }
}


extension LocationDetailsView {
    
    private var imagesTabView : some View {
        TabView{
            ForEach(location.imageNames, id: \.self) {
                Image($0)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? nil :  UIScreen.main.bounds.width)
            }
        }
        .frame(height: 500)
        
        .tabViewStyle(.page)
    }
}
