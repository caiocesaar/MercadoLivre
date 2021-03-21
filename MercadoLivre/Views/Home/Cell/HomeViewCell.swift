//
//  HomeViewCell.swift
//  MercadoLivre
//
//  Created by Cesar on 21/03/21.
//

import UIKit

final class HomeViewCell: UITableViewCell {
    
    // MARK: - Identifiers
    static let identifier = "HomeViewCell"
    
    // MARK: - LifeCycle
    override func prepareForReuse() {
        super.prepareForReuse()
        thumbImageView.image = nil
    }
    
    // MARK: - Views
    private lazy var thumbImageView = makeThumbImageView()
    private lazy var stackView = makeStackView()
    private lazy var productNameLabel = makeNameLabel()
    private lazy var productPriceLabel = makePriceLabel()
    
    // MARK: - Setup
    func setup(product: Product) {
        productNameLabel.text = product.title
        productPriceLabel.text = "R$ 100,00"
        thumbImageView.load(url: product.thumbnail)
    }
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        addConstraints()
        accessoryType  = .none
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Function Views
    private func makeThumbImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }
    
    private func makeNameLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }
    
    private func makePriceLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }
    
    private func makeStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.spacing = 8
        stackView.axis = .vertical
        return stackView
    }
    
    // MARK: - Functions
    func addViews() {
        addSubview(thumbImageView)
        addSubview(stackView)
        [productNameLabel,productPriceLabel].forEach { stackView.addArrangedSubview($0) }
    }
    
    func addConstraints() {
        
        thumbImageView.snp.makeConstraints { (make) in
            make.size.equalTo(80)
            make.top.leading.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().inset(16)
        }
        
        stackView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(16)
            make.leading.equalTo(thumbImageView.snp.trailing).offset(16)
            make.trailing.equalToSuperview().inset(16)
        }

        
        
    }
    
    
}
