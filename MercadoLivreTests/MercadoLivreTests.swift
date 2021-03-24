//
//  MercadoLivreTests.swift
//  MercadoLivreTests
//
//  Created by Cesar on 19/03/21.
//

import XCTest
@testable import MercadoLivre

class MercadoLivreTests: XCTestCase {
    
    /// Test currency Format
    func test_toCurrencyFormatIncludePrefix() throws {
        // given
        let floatValue: Float = 40.0
        
        // when
        let isValid = floatValue.toCurrencyFormat()
        
        // then
        XCTAssert(isValid.contains("R$"))
        XCTAssert(isValid.contains(","))
    }
    
    /// Test the new condition in the product
    func test_conditionProductNew() throws {
        // given
        let str = "new"
        let detailView = DetailView()
        
        // when
        let condition = detailView.getCondition(condition: str)
        
        // then
        XCTAssertFalse(condition != "Novo")
    }
    
    /// Test the used condition in the product
    func test_conditionProductUsed() throws {
        // given
        let str = "used"
        let detailView = DetailView()
        
        // when
        let condition = detailView.getCondition(condition: str)
        
        // then
        XCTAssertFalse(condition != "Usado")
    }
    
    /// Test the available quantity empty in the product
    func test_availableProductQuantityEmpty() throws {
        // given
        let quantity = 0
        let detailView = DetailView()
        
        // when
        let quantityStr = detailView.getAvailableQuantity(quantity: quantity)
        
        // then
        XCTAssert(quantityStr == "Nenhum disponível")
    }
    
    /// Test the available quantity for some quantity
    func test_availableProductQuantityMany() throws {
        // given
        let quantity = 4
        let detailView = DetailView()
        
        // when
        let quantityStr = detailView.getAvailableQuantity(quantity: quantity)
        
        // then
        XCTAssert(quantityStr == "4 disponíveis")
    }
    
    /// Test the available quantity for one quantity
    func test_availableProductQuantitySingle() throws {
        // given
        let quantity = 1
        let detailView = DetailView()
        
        // when
        let quantityStr = detailView.getAvailableQuantity(quantity: quantity)
        
        // then
        XCTAssert(quantityStr == "1 disponível")
    }
    
    /// Test the installments string
    func test_getInstallments() throws {
        // given
        let quantity = 4
        let amount: Float = 12.5*100
        let detailView = DetailView()
        
        // when
        let installmentsStr = detailView.getInstallments(quantity: quantity, amount: amount)
        
        // then
        XCTAssert(installmentsStr == "em 4x R$ 12,50")
    }
    
    /// Test string empty for nothing available
    func test_getSoldQuantity() throws {
        // given
        let soldQuantity = 0
        let detailView = DetailView()
        
        // when
        let soldQuantityStr = detailView.getSoldQuantity(quantity: soldQuantity)
        
        // then
        XCTAssert(soldQuantityStr == "")
    }
    
    /// Test string empty for one sold
    func test_getSoldQuantityOne() throws {
        // given
        let soldQuantity = 1
        let detailView = DetailView()
        
        // when
        let soldQuantityStr = detailView.getSoldQuantity(quantity: soldQuantity)
        
        // then
        XCTAssert(soldQuantityStr == "1 vendido")
    }
    
    func test_getSoldQuantityMany() throws {
        // given
        let soldQuantity = 4
        let detailView = DetailView()
        
        // when
        let soldQuantityStr = detailView.getSoldQuantity(quantity: soldQuantity)
        
        // then
        XCTAssert(soldQuantityStr == "4 vendidos")
    }
    
}
