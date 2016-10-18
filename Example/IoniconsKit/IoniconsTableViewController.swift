import UIKit
import IoniconsKit

class IoniconsTableViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet var searchBar: UISearchBar!

    private var searchText = ""
    private var searchResults = Ionicons.tuples

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IoniconTableViewCell", for: indexPath)
        if let cell = cell as? IoniconTableViewCell {
            let tuple = searchResults[indexPath.row]
            cell.codeLabel.text = tuple.0
            cell.ionicFontLabel.font = UIFont.ionicon(of: 18)
            cell.ionicFontLabel.text = String.ionicon(with: tuple.1)
            cell.ionicFontImageView.image = UIImage.ionicon(with: tuple.1, textColor: UIColor.orange, size: CGSize(width: 18, height: 18))
        }
        return cell
    }

    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            searchResults = Ionicons.tuples
        } else {
            searchResults.removeAll()
            for tuple in Ionicons.tuples {
                if tuple.0.lowercased().contains(searchText.lowercased()) {
                    searchResults.append(tuple)
                }
            }
        }
        self.tableView.reloadData()
    }
}
