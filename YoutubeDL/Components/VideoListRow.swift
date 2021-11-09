//
//  VideoListRow.swift
//  YoutubeDL
//
//  Created by Mars on 2021/11/9.
//

import SwiftUI

struct VideoListRow: View {
  @Binding var info: VideoInfo
  
  var body: some View {
    HStack {
      Image(systemName: "play.rectangle.fill").padding(.trailing, 10)
      Text(info.title)
      Spacer()
    }
    .foregroundColor(.primary)
    .font(.title)
    .padding([.top, .bottom])
  }
}

struct VideoListRow_Previews: PreviewProvider {
  static var previews: some View {
    VideoListRow(info: .constant(VideoInfo(title: "Demo Video")))
  }
}
