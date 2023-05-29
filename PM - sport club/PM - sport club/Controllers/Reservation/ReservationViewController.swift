//
//  ReservationViewController.swift
//  PM - sport club
//
//  Created by Арсентий Халимовский on 16.04.2023.
//

import UIKit

final class ReservationViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var phoneTextField: UITextField!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var reserveButtonView: UIButton!
    
    // MARK: - Private Properties
    
    private var areTextFieldsAreEmpty: Bool {
        nameTextField.text?.isEmpty == true ||
        phoneTextField.text?.isEmpty == true ||
        emailTextField.text?.isEmpty == true
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - IBActions
    
    @IBAction private func reserveButtonAction(_ sender: UIButton) {
        if areTextFieldsAreEmpty {
            showAlert(title: "Ошибка", message: "Заполните пустые поля")
        } else if isValidEmail(emailTextField.text!) == false {
            showAlert(title: "Ошибка", message: "Проверьте корректность ввода почты")
        } else {
            showAlert(title: "Успешно", message: "Ваша заявка будет рассмотрена, мы с вами свяжемся") {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        setupNavigationBar()
        setupNameTextField()
        setupPhoneTextField()
        setupEmailTextField()
        setupReserveButtonView()
    }
    
    private func setupNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.navigationBar.backItem?.title = ""
        self.navigationController?.navigationBar.topItem?.title = "Бронирование"
    }
    
    private func setupNameTextField() {
        nameTextField.clipsToBounds = true
        nameTextField.layer.borderColor = UIColor.white.cgColor
        nameTextField.layer.borderWidth = 0.5
        nameTextField.layer.cornerRadius = 10
        nameTextField.setLeftPaddingPoints(10)
    }
    
    private func setupPhoneTextField() {
        phoneTextField.clipsToBounds = true
        phoneTextField.layer.borderColor = UIColor.white.cgColor
        phoneTextField.layer.borderWidth = 0.5
        phoneTextField.layer.cornerRadius = 10
        phoneTextField.setLeftPaddingPoints(10)
    }
    
    private func setupEmailTextField() {
        emailTextField.clipsToBounds = true
        emailTextField.layer.borderColor = UIColor.white.cgColor
        emailTextField.layer.borderWidth = 0.5
        emailTextField.layer.cornerRadius = 10
        emailTextField.setLeftPaddingPoints(10)
    }
    
    private func setupReserveButtonView() {
        reserveButtonView.layer.cornerRadius = 14
    }
    
}
