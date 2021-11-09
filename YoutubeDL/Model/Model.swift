//
//  Model.swift
//  YoutubeDL
//
//  Created by Mars on 2021/11/9.
//

import Foundation

struct VideoInfo: Hashable {
  var title: String
  
  init(title: String = "") {
    self.title = title
  }
}

class Model: ObservableObject {
  @Published var keyword: String = ""
  @Published var videos: [VideoInfo] = []
  
  init(keyword: String = "", videos: [VideoInfo] = []) {
    self.keyword = keyword
    self.videos = videos
  }
  
  func fetchFromYoutube() async {
    let url = buildQueryUrl()
    
    do {
      let (data, response) = try await URLSession.shared.data(from: url)
      
      guard (response as? HTTPURLResponse)?.statusCode == 200 else {
        // TODO: Actually we shoudl throw an exception here, omit for simplicity
        return
      }
      
      let html = String(decoding: data, as: UTF8.self)
      
      #if DEBUG
        print("Phase 2: Get Youtube response successfully.")
      #endif
      
      parseYoutubeResponse(html: html)
    }
    catch {
      print(error.localizedDescription)
    }
  }
}

extension Model {
  // Helpers
  func buildQueryUrl() -> URL {
    let str = "https://www.youtube.com/results?search_query=\(keyword)"
    #if DEBUG
      print("Phase 1: Requesting: \(str)")
    #endif
    
    return URL(string: str)!
  }
  
  func parseYoutubeResponse(html: String) {
    /// It seems that we can match the target information from
    /// the JSON-like strings in the HTML.
    /// But I don't know the exact part of it.
    
    /// - TODO: Update `videos` after parsing the html
  }
}
