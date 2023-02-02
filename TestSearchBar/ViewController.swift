//
//  ViewController.swift
//  TestSearchBar
//
//  Created by franklin gaspar on 18/10/22.
//

import UIKit
import Foundation
import LinkPresentation

class ViewController: UIViewController, UISearchResultsUpdating, UISearchControllerDelegate, UISearchBarDelegate {

    var rigthButton =  UIButton()
    var leftButton = UIButton()
    var titleNaviBarLabel = UILabel()
    
    var searchBar: UISearchBar = UISearchBar()
    var leftanimation: NSLayoutConstraint?
    let navigation = UINavigationController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .link

       // searchBar.delegate = self
        configureLayoutLeftBtn()
        configureLayoutSearchBar()
        configureLayoutRigthBtn()
        configureLayoutTitleLabel()
    }
    
   
    
    @objc func rightBtnAction() {
        titleNaviBarLabel.isHidden = true
        self.rigthButton.alpha = 0
        leftanimation?.isActive = true
        self.leftanimation?.constant = 50

        UIView.animate(withDuration: 0.4) {
            self.leftButton.alpha = 6
            self.navigationController?.navigationBar.layoutIfNeeded()

        } completion: { (Bool) in
        }
    }
    
    @objc func leftBtnAction() {
        view.endEditing(true)
        self.leftanimation?.constant = searchBar.frame.size.width + 50

        UIView.animate(withDuration: 0.6) {
            self.leftButton.alpha = 0
            self.navigationController?.navigationBar.layoutIfNeeded()

        } completion: { (Bool) in
        UIView.animate(withDuration: 0.3) {

               self.titleNaviBarLabel.isHidden = false
               self.rigthButton.alpha = 6
            } completion: { (Bool) in
               self.leftanimation?.isActive = false

            }
        }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}

extension ViewController {
    func configureLayoutSearchBar() {
        navigationController?.navigationBar.addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        searchBar.bottomAnchor.constraint(
            equalTo:  navigationController?.navigationBar.bottomAnchor ?? NSLayoutYAxisAnchor() ,
            constant: 15
        ).isActive = true
        
        searchBar.heightAnchor.constraint(
            equalTo: navigationController?.navigationBar.heightAnchor ?? NSLayoutDimension(),
            constant: 35
        ).isActive = true
        
        searchBar.rightAnchor.constraint(
            equalTo: navigationController?.navigationBar.rightAnchor ?? NSLayoutXAxisAnchor() ,
            constant: -60
        ).isActive = true
        
        leftanimation = searchBar.leftAnchor.constraint(
            equalTo: navigationController?.navigationBar.leftAnchor ?? NSLayoutXAxisAnchor(),
            constant: 50
        )
        leftanimation?.isActive = false
    }
}

extension ViewController {
    func configureLayoutLeftBtn() {
        navigationController?.navigationBar.addSubview(leftButton)
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        leftButton.setImage(UIImage(named: "setaR"), for: .normal)
        leftButton.contentMode = .scaleAspectFit
        leftButton.alpha = 0
        leftButton.addTarget(self, action: #selector(leftBtnAction), for: .touchUpInside)
        
        leftButton.bottomAnchor.constraint(
            equalTo:  navigationController?.navigationBar.bottomAnchor ?? NSLayoutYAxisAnchor(),
            constant: -10
        ).isActive = true
        
        leftButton.rightAnchor.constraint(
            equalTo: navigationController?.navigationBar.leftAnchor ?? NSLayoutXAxisAnchor(),
            constant: 40
        ).isActive = true
        
        leftButton.leftAnchor.constraint(
            equalTo: navigationController?.navigationBar.leftAnchor ?? NSLayoutXAxisAnchor(),
            constant: 10
        ).isActive = true
        
        leftButton.topAnchor.constraint(
            equalTo: navigationController?.navigationBar.topAnchor ?? NSLayoutYAxisAnchor(),
            constant: 5
        ).isActive = true
    }
}

extension ViewController {
    func configureLayoutRigthBtn() {
        navigationController?.navigationBar.addSubview(rigthButton)
        rigthButton.translatesAutoresizingMaskIntoConstraints = false
        rigthButton.setImage(UIImage(named: "lupaP"), for: .normal)
        rigthButton.contentMode = .scaleAspectFit
        rigthButton.addTarget(self, action: #selector(rightBtnAction), for: .touchUpInside)
        
        rigthButton.bottomAnchor.constraint(
            equalTo:  navigationController?.navigationBar.bottomAnchor ?? NSLayoutYAxisAnchor(),
            constant: -10
        ).isActive = true
        
        rigthButton.rightAnchor.constraint(
            equalTo: navigationController?.navigationBar.rightAnchor ?? NSLayoutXAxisAnchor(),
            constant: -20
        ).isActive = true
        
        rigthButton.leftAnchor.constraint(
            equalTo: navigationController?.navigationBar.rightAnchor ?? NSLayoutXAxisAnchor(),
            constant: -50
        ).isActive = true
        
        rigthButton.topAnchor.constraint(
            equalTo: navigationController?.navigationBar.topAnchor ?? NSLayoutYAxisAnchor(),
            constant: 5
        ).isActive = true
    }
}

extension ViewController {
    func configureLayoutTitleLabel() {
        navigationController?.navigationBar.addSubview(titleNaviBarLabel)
        titleNaviBarLabel.translatesAutoresizingMaskIntoConstraints = false
        titleNaviBarLabel.text = "Title NavBar"
        titleNaviBarLabel.textAlignment = .center
        titleNaviBarLabel.font = .boldSystemFont(ofSize: 16)
        
        titleNaviBarLabel.bottomAnchor.constraint(
                  equalTo:  navigationController?.navigationBar.bottomAnchor ?? NSLayoutYAxisAnchor(),
                  constant: -10
              ).isActive = true
              
        titleNaviBarLabel.rightAnchor.constraint(
                  equalTo: navigationController?.navigationBar.rightAnchor ?? NSLayoutXAxisAnchor(),
                  constant: -100
              ).isActive = true
              
        titleNaviBarLabel.leftAnchor.constraint(
                  equalTo: navigationController?.navigationBar.leftAnchor ?? NSLayoutXAxisAnchor(),
                  constant: 100
              ).isActive = true
              
        titleNaviBarLabel.topAnchor.constraint(
                  equalTo: navigationController?.navigationBar.topAnchor ?? NSLayoutYAxisAnchor(),
                  constant: 5
              ).isActive = true
    }
}
