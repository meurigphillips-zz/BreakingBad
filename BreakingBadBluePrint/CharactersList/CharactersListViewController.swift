//
//  ViewController.swift
//  BreakingBadBluePrint
//
//  Created by Meurig Phillips on 09/09/2020.
//  Copyright © 2020 Meurig Phillips. All rights reserved.
//

import UIKit
import Reachability

class CharacterListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var connectivityImageView: UIImageView!
    
    private let reachability = try! Reachability()
    private let searchController = UISearchController(searchResultsController: nil)
    private let viewModel = CharacterListViewModel()
    
    private var isSearchBarEmpty: Bool { searchController.searchBar.text?.isEmpty ?? true }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "CharacterTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        configureSearchController()
        
        connectivityImageView.image = UIImage(systemName: "wifi.exclamationmark")
        
        viewModel.filteredCharacters.bind { [weak self] _ in
            self?.tableView.reloadData()
        }
        
        reachability.whenReachable = { _ in
            self.connectivityImageView.isHidden = true
            self.viewModel.fetchCharacters()
        }
        
        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            segue.identifier == "ShowDetailSegue",
            let indexPathRow = tableView.indexPathForSelectedRow?.row,
            let detailViewController = segue.destination as? CharacterDetailViewController
            else {
                return
        }
        detailViewController.character = viewModel.filteredCharacters.value[indexPathRow]
    }
    
    private func configureSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Characters"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        searchController.searchBar.scopeButtonTitles = ["All","1","2","3","4","5"]
        searchController.searchBar.delegate = self
        
    }
}

// TableView
extension CharacterListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.filteredCharacters.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? CharacterTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.setup(character: viewModel.filteredCharacters.value[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "ShowDetailSegue", sender: nil)
    }
}

// Searchbar
extension CharacterListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        viewModel.filterContentForSearchText(searchBar.text!, season: searchBar.selectedScopeButtonIndex, isSearchBarEmpty: isSearchBarEmpty)
    }
}

extension CharacterListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        viewModel.filterContentForSearchText(searchBar.text!, season: searchBar.selectedScopeButtonIndex, isSearchBarEmpty: isSearchBarEmpty)
    }
}
