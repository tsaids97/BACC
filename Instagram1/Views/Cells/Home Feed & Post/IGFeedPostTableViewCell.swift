//
//  IGFeedPostTableViewCell.swift
//  Instagram1
//
//  Created by Touri Said on 30/03/2022.
//

import UIKit

// Cell for primarypost content
class IGFeedPostTableViewCell: UITableViewCell {

    static let identifier = "IGFeedPostTableViewCell"

    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = nil
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(postImageView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func configure(with post: UserPost) {
        // configure the cell
        postImageView.image = UIImage(named: "test")

        switch post.postType {
        case .photo:
            //show image
        case .video:
            // load and play video
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        postImageView.frame = contentView.bounds

    }

    override func prepareForReuse() {
        super.prepareForReuse()
        postImageView.image = nil
    }

}
