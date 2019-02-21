
import UIKit

extension ViewController{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return snacksToEat.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "snackCell")!
    cell.textLabel?.text = snacksToEat[indexPath.row].name
    return cell
  }
}
