

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{
  
  
  @IBOutlet weak var snackTableView: UITableView!
  
  
  @IBOutlet weak var navbar: UIView!
  var stackView :UIStackView!
  var menuIsOpen = false
  var label :UILabel!
  
  var snacksToEat = [Snack]()
  @IBOutlet weak var navbarHeightConstraint: NSLayoutConstraint!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    snackTableView.dataSource = self
    snackTableView.delegate = self
    
    
    //snack label
    label = UILabel(frame: CGRect.zero)
    label.text = "Snack Attack"
    navbar.addSubview(label)
    
    label.translatesAutoresizingMaskIntoConstraints = false
    let centerConX = label.centerXAnchor.constraint(equalTo: navbar.centerXAnchor)
    let centerConY = label.centerYAnchor.constraint(equalTo: navbar.centerYAnchor)
    centerConY.identifier = "ycon"
    navbar.addConstraints([centerConX, centerConY])
    
    
    //stackview
    stackView = UIStackView(frame: CGRect.zero)
    navbar.addSubview(stackView)
    stackView.distribution = .fillEqually
    //create the stack view
    stackView.alpha = 0.0
    stackView.axis = NSLayoutConstraint.Axis.horizontal
    stackView.translatesAutoresizingMaskIntoConstraints = false
    let horizontalConstraint = stackView.leadingAnchor.constraint(equalTo: navbar.leadingAnchor)
    let verticalConstraint = stackView.trailingAnchor.constraint(equalTo: navbar.trailingAnchor)
    let widthConstraint = stackView.topAnchor.constraint(equalTo: navbar.topAnchor, constant: 40)
    let heightConstraint = stackView.bottomAnchor.constraint(equalTo: navbar.bottomAnchor)
    
    view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
    
    //add some buttons
    
    let buttonNames = ["oreos","pizza_pockets","pop_tarts","ramen","popsicle"]
    var i = 0
    for imageName in buttonNames{
      
      let button = UIButton(frame: CGRect.zero)
      button.setImage(UIImage(named: imageName), for: UIControl.State.normal)
      button.addTarget(self, action: #selector(self.pressedSnack(_:)), for: UIControl.Event.touchUpInside)
      stackView.addArrangedSubview(button)
      button.tag = i
      i += 1
    }
    
  }
  override func viewDidAppear(_ animated: Bool) {
    
  }
  
  @objc func pressedSnack(_ sender:UIButton){
    print("pressed snack \(sender.tag)")
    switch(sender.tag){
    case 0:
      let snack = Snack(name:"oreos")
      snacksToEat.append(snack)
    snackTableView.insertRows(at: [IndexPath(item: snacksToEat.count-1, section: 0)], with: UITableView.RowAnimation.fade)
    case 1:
      let snack = Snack(name:"pizza pockets")
      snacksToEat.append(snack)
      snackTableView.insertRows(at: [IndexPath(item: snacksToEat.count-1, section: 0)], with: UITableView.RowAnimation.fade)
    case 2:
      let snack = Snack(name:"pop tarts")
      snacksToEat.append(snack)
      snackTableView.insertRows(at: [IndexPath(item: snacksToEat.count-1, section: 0)], with: UITableView.RowAnimation.fade)
    case 3:
      let snack = Snack(name:"ramen")
      snacksToEat.append(snack)
      snackTableView.insertRows(at: [IndexPath(item: snacksToEat.count-1, section: 0)], with: UITableView.RowAnimation.fade)
    case 4:
      let snack = Snack(name:"popsicles")
      snacksToEat.append(snack)
      snackTableView.insertRows(at: [IndexPath(item: snacksToEat.count-1, section: 0)], with: UITableView.RowAnimation.fade)
    default:
      let snack = Snack(name:"oreos")
      snacksToEat.append(snack)
      snackTableView.insertRows(at: [IndexPath(item: snacksToEat.count-1, section: 0)], with: UITableView.RowAnimation.fade)
    }
    
    //snackTableView.reloadData()
  }
  @IBAction func menuPressed(_ sender: Any) {
    menuIsOpen = !menuIsOpen
    
    if(menuIsOpen){
      for con in navbar.constraints{
        if(con.identifier == "ycon"){
          print("found ycon")
          con.constant = -40
        }
      }
    //animate open menu
    UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.20, initialSpringVelocity: 1.5, options: [], animations: {
      self.navbarHeightConstraint.constant = 200
      
      self.view.layoutIfNeeded()
      self.stackView.alpha = 1.0
    })
      return
    }
    
    for con in navbar.constraints{
      if(con.identifier == "ycon"){
        print("found ycon")
        con.constant = 0
      }
    }
    //animate close menu
    UIView.animate(withDuration: 1.0, delay: 0,  animations: {
      self.navbarHeightConstraint.constant = 40
      self.view.layoutIfNeeded()
      self.stackView.alpha = 0.0
    })
  }
}

