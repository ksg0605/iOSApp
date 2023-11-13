//
//  DetailViewController.swift
//  Example-MemberList
//
//  Created by 김선규 on 11/13/23.
//

import UIKit
import PhotosUI

final class DetailViewController: UIViewController {

    // MARK: - Variables
    private let detailView = DetailView()
    
    var member: Member?
    
    override func loadView() {
        view = detailView
    }
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        setupData()
        setupButtonActtion()
        setupTapGestures()
    }
    
    private func setupData() {
        detailView.member = member
    }
    
    private func setupButtonActtion() {
        detailView.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    private func setupTapGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(touchUpImageView))
        detailView.mainImageView.addGestureRecognizer(tapGesture)
        detailView.mainImageView.isUserInteractionEnabled = true
    }

    @objc private func touchUpImageView() {
        setupImagePicker()
    }
    
    private func setupImagePicker() {
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 0
        configuration.filter = .any(of: [.images, .videos])
        
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }
    
    @objc private func saveButtonTapped() {
        if member == nil {
            let name = detailView.nameTextField.text ?? ""
            let age = Int(detailView.ageTextField.text ?? "")
            let phoneNumber = detailView.phoneNumberTextField.text ?? ""
            let address = detailView.addressTextField.text ?? ""
            
            var newMember = Member(name: name, age: age, phone: phoneNumber, address: address)
            newMember.memberImage = detailView.mainImageView.image
            
            let index = navigationController!.viewControllers.count - 2
            let vc = navigationController?.viewControllers[index] as! ViewController
            vc.membersListManager.makeNewMember(newMember)
        } else {
            member!.memberImage = detailView.mainImageView.image
            
            let memberId = Int(detailView.memberIdTextField.text!) ?? 0
            member!.name = detailView.nameTextField.text ?? ""
            member!.age = Int(detailView.ageTextField.text ?? "")
            member!.phone = detailView.phoneNumberTextField.text ?? ""
            member!.address = detailView.addressTextField.text ?? ""
            
            detailView.member = member
            
            let index = navigationController!.viewControllers.count - 2
            let vc = navigationController?.viewControllers[index] as! ViewController
            vc.membersListManager.updateMemberInfo(index: index, member!)
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
}

// MARK: - Extension: PHPickerViewControllerDelegate
extension DetailViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        
        let itemProvider = results.first?.itemProvider
        
        if let itemProvider = itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                DispatchQueue.main.async {
                    self.detailView.mainImageView.image = image as? UIImage
                }
            }
        } else {
            print("Image Error")
        }
    }
    
    
}
