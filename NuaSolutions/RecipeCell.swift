//  Cell.swift
//  Nua Solutions
//  Created by Анастасия Набатова on 21/3/24.

import UIKit

final class RecipeCell: UITableViewCell {
    
    static let reuseId = Accesses.recipeCell
    private var recipe: RecipeDomainModel?
    private let recipeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.gray.cgColor
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = Titles.optionalText
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.numberOfLines = 0
        label.setContentHuggingPriority(.required, for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let detailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        let attributedString = NSAttributedString(string: Titles.detail, attributes: [
            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue
        ])
        label.attributedText = attributedString
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let width = UIScreen.main.bounds.width
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//  MARK: - Business Logic
extension RecipeCell {
    
    func update(with recipe: RecipeDomainModel, image: UIImage?) {
        titleLabel.text = recipe.label
        recipeImage.image = image ?? UIImage(named: Images.optionalImage)
        self.recipe = recipe
        setupGestures(for: recipe)
    }
    
    private func setupGestures(for recipe: RecipeDomainModel) {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(detailLabelTapped))
        detailLabel.addGestureRecognizer(tapGesture)
    }
    
    @objc private func detailLabelTapped() {
        guard let urlString = recipe?.url, let url = URL(string: urlString) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}

//  MARK: - Layout
private extension RecipeCell {
    
    func setupViews() {
        contentView.addSubview(recipeImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(detailLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            recipeImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            recipeImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            recipeImage.widthAnchor.constraint(equalToConstant: 0.30 * width),
            recipeImage.heightAnchor.constraint(equalToConstant: 0.30 * width),
            
            titleLabel.leadingAnchor.constraint(equalTo: recipeImage.trailingAnchor, constant: 12),
            titleLabel.topAnchor.constraint(equalTo: recipeImage.topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            detailLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            detailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            detailLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            detailLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
}
