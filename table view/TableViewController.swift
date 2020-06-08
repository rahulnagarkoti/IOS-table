import UIKit


class TablesViewController: UIViewController
{

    @IBOutlet weak var tableView: UITableView!
    let fixtureList = ["16:00 Chelsea vs Liverpool" , "16:00 Arsenal vs Hull"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

//handle interations
extension TablesViewController : UITableViewDelegate
{
    //tapped cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped")
    }
    
}

extension TablesViewController : UITableViewDataSource
{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //change it later
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fixtureList.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //check if cell exists and reuse the template
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = fixtureList[indexPath.row]
        return cell
    }
}
