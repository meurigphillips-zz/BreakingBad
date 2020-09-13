//
//  ViewController.swift
//  BreakingBadBluePrint
//
//  Created by Meurig Phillips on 09/09/2020.
//  Copyright © 2020 Meurig Phillips. All rights reserved.
//

import UIKit

class CharacterListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchFooter: SearchFooter!
    
    private let viewModel = CharacterListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "CharacterTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        
        viewModel.displayedCharacters.bind { [weak self] characters in
            self?.tableView.reloadData()
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
        detailViewController.character = viewModel.displayedCharacters.value[indexPathRow]
    }
    
}

extension CharacterListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.displayedCharacters.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? CharacterTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.setup(character: viewModel.displayedCharacters.value[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "ShowDetailSegue", sender: nil)
    }
}

