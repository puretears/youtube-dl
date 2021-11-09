//
//  SearchBox.swift
//  YoutubeDL
//
//  Created by Mars on 2021/11/9.
//

import SwiftUI

struct SearchBox: View {
  @Binding var keyword: String
  var searcher: () async -> Void = {}
  
  var body: some View {
    HStack {
      TextField("Search", text: $keyword)
        .foregroundColor(Color.secondary)
      Button(action: {
        Task {
          await searcher()
        }
      }) {
        Image(systemName: "chevron.right").padding(.horizontal)
      }
      .accentColor(.orange)
    }
    .padding()
    .overlay(Capsule().stroke(Color.gray, lineWidth: 1))
  }
}

struct SearchBox_Previews: PreviewProvider {
  static var previews: some View {
    SearchBox(keyword: .constant("Ronaldo"))
  }
}
