// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let movie = try? newJSONDecoder().decode(Movie.self, from: jsonData)

import Foundation

struct MoviePai {
    var page: Int
    var total_results: Int
    var total_pages: Int
    var results: [Movie]
}



// MARK: - Movie
class Movie: Codable {
    
    let voteCount, id: Int
    let video: Bool
    let voteAverage: Double
    let title: String
    let popularity: Double
    let posterPath, originalLanguage, originalTitle: String
    let genreIDS: [Int]
    let backdropPath: String
    let adult: Bool
    let overview, releaseDate: String

    init(dic: [String:Any]) {
        self.voteCount = dic["vote_count"] as! Int
        self.id = dic["id"] as! Int
        self.video = dic["video"] as! Bool
        self.voteAverage = dic["vote_average"] as! Double
        self.title = dic["title"] as! String
        self.popularity = dic["popularity"] as! Double
        self.posterPath = dic["poster_path"] as! String
        self.originalLanguage = dic["original_language"] as! String
        self.originalTitle = dic["original_title"] as! String
        self.genreIDS = dic["genre_ids"] as! [Int]
        self.backdropPath = dic["backdrop_path"] as! String
        self.adult = dic["adult"] as! Bool
        self.overview = dic["overview"] as! String
        self.releaseDate = dic["release_date"] as! String
        
    }
}
