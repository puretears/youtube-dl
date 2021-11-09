//
//  VideoList.swift
//  YoutubeDL
//
//  Created by Mars on 2021/11/9.
//

import SwiftUI

struct VideoList: View {
  @Binding var videos: [VideoInfo]
  
  var body: some View {
    List($videos, id: \.self) {
      video in
      VideoListRow(info: video)
    }
    .listStyle(GroupedListStyle())
  }
}

struct VideoList_Previews: PreviewProvider {
  static var previews: some View {
    VideoList(videos: .constant([
      VideoInfo(title: "Fake Ronaldo1"),
      VideoInfo(title: "Fake Ronaldo2"),
      VideoInfo(title: "Fake Ronaldo3"),
      VideoInfo(title: "Fake Ronaldo4"),
      VideoInfo(title: "Fake Ronaldo5")
    ]))
  }
}
