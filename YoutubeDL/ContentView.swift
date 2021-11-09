//
//  ContentView.swift
//  YoutubeDL
//
//  Created by Mars on 2021/11/9.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var model: Model = Model()
  
  var body: some View {
    VStack {
      SearchBox(keyword: $model.keyword) {
        await model.fetchFromYoutube()
      }
      .padding(.horizontal)
      
      VideoList(videos: $model.videos)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(model:
      Model(
        keyword: "Keyword",
        videos: [
          VideoInfo(title: "Fake Ronaldo1"),
          VideoInfo(title: "Fake Ronaldo2"),
          VideoInfo(title: "Fake Ronaldo3"),
          VideoInfo(title: "Fake Ronaldo4"),
          VideoInfo(title: "Fake Ronaldo5")
        ])
    )
  }
}
