//
//  ViewController.swift
//  ios-dca-calculator
//
//  Created by Kelvin Fok on 16/9/20.
//

import UIKit
import Combine


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
    
    
    private let apiService = APIService()
    private var cancellables = Set<AnyCancellable>()
    private var searchResults: SearchResults?
    @Published private var searchQuery: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitle()
        setupNavigationBar()
        observeForm()
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
        guard let searchQuery = searchController.searchBar.text,
        !searchQuery.isEmpty else { return }
        self.searchQuery = searchQuery
    }
}


// MARK: - UISearchControllerDelegate


extension SearchTableViewController: UISearchControllerDelegate {
    
}


// MARK: - UITableViewDataSource


extension SearchTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults?.items.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! SearchTableViewCell
        if let searchResults {
            let result = searchResults.items[indexPath.row]
            cell.config(with: result)
        }
        return cell
    }
}


// MARK: - Private Helpers


private extension SearchTableViewController {
    
    func performSearch(_ keywords: String) {
        
        apiService.fetchSymbolsPublisher(keywords: keywords)
            .sink { _ in
                
            } receiveValue: { [weak self] results in
                self?.searchResults = results
                self?.tableView.reloadData()
            }
            .store(in: &cancellables)
    }
    
    func observeForm() {
        
        $searchQuery
            .debounce(for: 0.85, scheduler: RunLoop.main)
            .sink { [weak self] searchQuery in
                self?.performSearch(searchQuery)
            }
            .store(in: &cancellables)
    }
}
