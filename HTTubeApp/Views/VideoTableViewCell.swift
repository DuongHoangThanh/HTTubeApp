//
//  VideoTableViewCell.swift
//  HTTubeApp
//
//  Created by Thạnh Dương Hoàng on 3/2/25.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var video: Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ v: Video) {
        self.video = v
        
        guard self.video != nil else {
            return
        }
        
        // Set the title
        self.titleLabel.text = video?.title
        
        // Set the date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        // Set the thumbnail
        guard self.video?.thumbnail != "" else {
            return
        }

        // Check cache before the downloading data
        if let cachedData = CacheManager.getCache(self.video!.thumbnail) {
            // Set the thumbnail image view
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return
        }
        
        // Download the thumbnail data - Break Point check reload
        let url = URL(string: self.video!.thumbnail)
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { data, response, error in
            
            if error == nil && data != nil {
                
                // Save data in the cache
                CacheManager.setCache(url!.absoluteString, data)
                
                // Check that downloaded url matches the video thumbnail url that this cell is currently set to display
                if url?.absoluteString != self.video?.thumbnail {
                    // Video cell has been recycled for another video and no longer matches the thumbnail that was downloaded
                    return
                }
                
                let image = UIImage(data: data!)
                
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
            }
        }
        
        dataTask.resume()
    }
}
