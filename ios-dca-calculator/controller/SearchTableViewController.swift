//
//  ViewController.swift
//  ios-dca-calculator
//
//  Created by Kelvin Fok on 16/9/20.
//

import UIKit


class SearchTableViewController: UITableViewController {
    
    // MARK: UI Properties
    private lazy var searchController: UISearchController = {
        let sc = UISearchController(searchResultsController: nil)
        sc.searchResultsUpdater = self
        sc.delegate = self
        sc.obscuresBackgroundDuringPresentation = false
        sc.searchBar.placeholder = "Enter a company name or symbol"
        sc.searchBar.autocapitalizationType = .allCharacters
        return sc
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitle()
        setupNavigationBar()
    }
}


// MARK: - UI Setups


extension SearchTableViewController {
    
    func setupTitle() {
        title = "DCA Calculator"
    }
    
    func setupNavigationBar() {
        navigationItem.searchController = searchController
    }
}


// MARK: - UISearchResultsUpdating


extension SearchTableViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}


// MARK: - UISearchControllerDelegate


extension SearchTableViewController: UISearchControllerDelegate {
    
}


// MARK: - UITableViewDataSource


extension SearchTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! SearchTableViewCell
        return cell
    }
}
