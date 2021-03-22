//
//  BaseView.swift
//  MercadoLivre
//
//  Created by Cesar on 19/03/21.
//

import UIKit
import SnapKit

class BaseView: UIView {
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        addConstraints()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Variables
    private lazy var wrapperView = makeWrapper()
    
    //MARK: - Function View's
    private func makeWrapper() -> UIView {
        let view = UIView()
        return view
    }
        
    //MARK: - Layout Functions
    func addViews() {
        addSubview(wrapperView)
    }
    
    func addConstraints() {
        
        wrapperView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
}
