//
//  ContentView.swift
//  api-learning
//
//  Created by Isaac Hansen on 3/5/20.
//  Copyright © 2020 Isaac Hansen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var getData = datas()
    
    var body: some View {
        NavigationView{
            List(getData.jsonData) {i in
                
                NavigationLink(destination: SwiftUIView(album: i)) {
                    ListRow(url: i.thumbnailUrl, name: i.title)
                }
            }.navigationBarTitle("Isaac Learns Swift")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class datas : ObservableObject {
    @Published var jsonData = [Album]()
    
    init() {
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: "https://jsonplaceholder.typicode.com/photos")!) { (data, _, _) in
            
            do {
                let fetch = try JSONDecoder().decode([Album].self, from: data!)
                
                DispatchQueue.main.async {
                    self.jsonData = fetch
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

struct Album : Identifiable, Decodable {
    var albumId: Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
}

struct ListRow : View {
    
    var url :  String
    var name : String
    
    var body : some View {
        HStack {
            Spacer()
                HStack {
                    Rectangle().fill(Color.blue).frame(width: 40, height: 40);
                    Spacer()
                    Text(name).fontWeight(.heavy).padding(.leading)
                    }
                .padding()
                       .frame(width: 290)
                               .foregroundColor(.white)
                               .background(Color.gray)
                               .cornerRadius(8)
            Spacer()
        }
    }
}
 
