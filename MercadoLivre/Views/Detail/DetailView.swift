//
//  DetailView.swift
//  MercadoLivre
//
//  Created by Cesar on 22/03/21.
//

import UIKit

final class DetailView: BaseView {
    
    // MARK: - Views
    private lazy var scrollView = makeScrollView()
    private lazy var contentView = UIView()
    private lazy var thumbImageView = makeThumbImageView()
    private lazy var titleLabel = makeLabel(font: .systemFont(ofSize: 15))
    private lazy var priceLabel = makeLabel(font: .systemFont(ofSize: 24))
    private lazy var conditionView = makeConditionView()
    private lazy var conditionLabel = makeLabel(font: .systemFont(ofSize: 12), color: .white)
    private lazy var soldQuantityLabel = makeLabel(font: .systemFont(ofSize: 12))
    private lazy var installmentsLabel = makeLabel(font: .systemFont(ofSize: 18))
    private lazy var inventoryLabel = makeLabel(
        font: .systemFont(ofSize: 15, weight: .bold),
        text: "Estoque")
    private lazy var inventoryQuantityLabel = makeLabel(font: .systemFont(ofSize: 15))
    private lazy var separatorView = makeSeparatorView()
        
    // MARK: - LifeCycle
    override func addViews() {
        super.addViews()
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(thumbImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(conditionView)
        conditionView.addSubview(conditionLabel)
        contentView.addSubview(soldQuantityLabel)
        contentView.addSubview(installmentsLabel)
        contentView.addSubview(separatorView)
        contentView.addSubview(inventoryLabel)
        contentView.addSubview(inventoryQuantityLabel)
    }
    
    override func addConstraints() {
        super.addConstraints()
        
        scrollView.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { (make) in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
        }
        
        thumbImageView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalTo(contentView)
            make.height.equalTo(300)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(thumbImageView.snp.bottom).offset(32)
            make.trailing.equalTo(contentView).inset(16)
            make.leading.equalTo(contentView).offset(16)
        }
        
        priceLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
            make.leading.trailing.equalTo(titleLabel)
        }
        
        installmentsLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(priceLabel)
            make.top.equalTo(priceLabel.snp.bottom).offset(4)
            make.trailing.lessThanOrEqualTo(titleLabel)
        }
        
        conditionView.snp.makeConstraints { (make) in
            make.leading.equalTo(installmentsLabel)
            make.top.equalTo(installmentsLabel.snp.bottom).offset(16)
            make.trailing.lessThanOrEqualTo(titleLabel)
        }
        
        conditionLabel.snp.makeConstraints { (make) in
            make.edges.equalTo(conditionView).inset(8)
        }
        
        soldQuantityLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(conditionView.snp.trailing).offset(16)
            make.centerY.equalTo(conditionView)
        }
        
        separatorView.snp.makeConstraints { (make) in
            make.height.equalTo(1)
            make.leading.trailing.equalTo(titleLabel)
            make.top.equalTo(conditionView.snp.bottom).offset(16)
        }
        
        inventoryLabel.snp.makeConstraints { (make) in
            make.top.equalTo(separatorView.snp.bottom).offset(16)
            make.leading.trailing.equalTo(separatorView)
        }
        
        inventoryQuantityLabel.snp.makeConstraints { (make) in
            make.top.equalTo(inventoryLabel.snp.bottom).offset(8)
            make.leading.trailing.equalTo(titleLabel)
        }
        
    }
    
    // MARK: - Function View's
    private func makeScrollView() -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }
    
    private func makeLabel(
        font: UIFont,
        color: UIColor = .black,
        text: String = ""
    ) -> UILabel {
        let label = UILabel()
        label.font = font
        label.numberOfLines = 0
        label.textColor = color
        label.text = text
        return label
    }
    
    private func makeThumbImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
    
    private func makeConditionView() -> UIView {
        let view = UIView()
        view.backgroundColor = .appColor(.colorSecondary)
        return view
    }
    
    private func makeSeparatorView() -> UIView {
        let view = UIView()
        view.backgroundColor = .appColor(.colorSeparator)
        return view
    }
    
    
}

extension DetailView {
 
    // MARK: - Setup
    func setupData(product: Product) {
        thumbImageView.load(url: product.thumbnail)
        titleLabel.text = product.title
        priceLabel.text = product.price?.toCurrencyFormat()
        conditionLabel.text = getCondition(condition: product.condition)
        soldQuantityLabel.text = getSoldQuantity(quantity: product.sold_quantity)
        installmentsLabel.text = getInstallments(
            quantity: product.installments?.quantity,
            amount: product.installments?.amount)
        inventoryQuantityLabel.text = getAvailableQuantity(quantity: product.available_quantity)
        
    }
    
    // MARK: - Getters
    func getSoldQuantity(quantity: Int?) -> String {
        guard let quantity = quantity, quantity > 0 else {
            return ""
        }
        return quantity > 1 ? "\(quantity) vendidos" : "\(quantity) vendido"
    }
    
    func getInstallments(quantity: Int?, amount: Float?) -> String {
        guard let quantity = quantity,
              let amount = amount else {
            return ""
        }
        return "em \(quantity)x \(amount.toCurrencyFormat())"
    }
    
    func getAvailableQuantity(quantity: Int?) -> String {
        guard let quantity = quantity else {
            return ""
        }
        switch quantity {
        case 0:
            return "Nenhum disponível"
        case 1:
            return "1 disponível"
        default:
            return "\(quantity) disponíveis"
        }
    }
    
    func getCondition(condition: String?) -> String {
        
        guard let condition = condition else {
            return ""
        }
        
        switch condition {
        case "new":
            return "Novo"
        case "used":
            return "Usado"
        default:
            return condition
        }
    }
    
}
