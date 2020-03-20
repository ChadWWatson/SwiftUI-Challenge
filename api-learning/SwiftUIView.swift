//
//  SwiftUIView.swift
//  api-learning
//
//  Created by Isaac Hansen on 3/6/20.
//  Copyright © 2020 Isaac Hansen. All rights reserved.
//

import SwiftUI


struct SwiftUIView: View {
    @State var zoomPhoto = true
    var album: Album
    var body: some View {
        VStack {
            HStack {
                Text(album.title).fontWeight(.heavy).font(.system(size: 16)).padding(.horizontal)
            }.frame(width: 400, height: 100)
            .foregroundColor(.white)
            .background(Color.gray)
            Spacer()
            Image("rec").frame(width: 300, height: 300).background(Color.blue).padding(.bottom, 100).onTapGesture {
                self.zoomPhoto.toggle()
            }
            Spacer()
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView(album: Album(albumId: 0, id: 0, title: "Test", url: "", thumbnailUrl: ""))
    }
}
