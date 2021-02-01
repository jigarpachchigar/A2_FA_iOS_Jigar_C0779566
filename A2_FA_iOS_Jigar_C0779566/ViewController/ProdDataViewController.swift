//
//  ProdDataControllerTableViewController.swift
//  A2_FA_iOS_Jigar_C0779566
//
//  Created by Jigar Pachchigar on 31/01/21.
//

import UIKit
import CoreData

class ProdDataTableViewController: UIViewController {
    
    
    //MARK:- Defining Outlets
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet var tableView: UITableView!
    
    // MARK:- Variable Declaration
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var prodList: [Product] = []
    
    var searchedData = NSArray()
    var isSearching = false
    
    
    //MARK:- LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setData()
        
        self.title = "Camera Products"
        searchBar.delegate = self
        tableView.dataSource = self
        
    }
    
    // MARK: - Navigation Usig Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ProdDisplayViewController
        if let indexPath = tableView.indexPathForSelectedRow {
            destination.product = prodList[indexPath.row]
        }
    }
    
    
    //MARK:- Function To Get Data NSPredicate
    
    func getData(with request: NSFetchRequest<Product> = Product.fetchRequest(), predicates: [NSPredicate]){
        
        request.predicate = NSCompoundPredicate(orPredicateWithSubpredicates: predicates)
        request.sortDescriptors = [NSSortDescriptor(key: "pid", ascending: true)]
        do {
            prodList = try context.fetch(request)
        } catch {
            print("Sorry!Couldn't Load Prodcuts \(error.localizedDescription)")
        }
        
        tableView.reloadData()
        
    }
    
    
    // MARK: - Set Data
    
    func setData(){
                

        let pro1 = Provider(context: context)
        pro1.proname = "Canon"
        
        let pro2 = Provider(context: context)
        pro2.proname = "Nikon"
        
        let pro3 = Provider(context: context)
        pro3.proname = "Sony"
        
        let pro4 = Provider(context: context)
        pro4.proname = "Olympus"
        
        let pro5 = Provider(context: context)
        pro5.proname = "Fujifilm"
        
        var product = Product(context: context)
        product.pid = 1
        product.pname = "EOS RP RF 24"
        product.pdesc = "Stepping up to a full-frame camera has never been easier.The mirrorless EOS RP-includes a 26.2 MP CMOS sensor"
        product.pprice = 850.00
        product.provider = pro1
        prodList.append(product)
        
        product = Product(context: context)
        product.pid = 2
        product.pname = "EOS Rebel T7"
        product.pdesc = "the image quality and near-instant autofocus of the EOS Rebel T7i camera. AFast and accurate Dual Pixel CMOS AF with phase-detection locks focus quickly"
        product.pprice = 670.00
        product.provider = pro1
        prodList.append(product)
        
        product = Product(context: context)
        product.pid = 3
        product.pname = "D7500"
        product.pdesc = "Nikon D7500 supports 4K UHD movie image format is an area that provides a 1.5x increase in the effective focal length of the lens in use and is reserved for 4K 3840 x 2160 recording"
        product.pprice = 780.90
        product.provider = pro2
        prodList.append(product)
        
        product = Product(context: context)
        product.pid = 4
        product.pname = "CoolPix B500"
        product.pdesc = "The CollPix B500 feels great in your hands, whether you're zooming in with its super telephoto NIKKOR glass lens or recording 1080p Full HD video using the flip-up LCD."
        product.pprice = 900.50
        product.provider = pro2
        prodList.append(product)
        
        product = Product(context: context)
        product.pid = 5
        product.pname = "DSC Rx100"
        product.pdesc = "Compared to the average point and shoot 1/2.3 Exmor CMOS sensor to capture more light from your scene and reproduce every stunning detail with greater fidelity"
        product.pprice = 555.75
        product.provider = pro3
        prodList.append(product)
        
        product = Product(context: context)
        product.pid = 6
        product.pname = "Alpha A7"
        product.pdesc = "Astonishingly fast, Sony’s sophisticated BIONZ X image processing engine reproduces textures and details in real time as seen by the naked eye."
        product.pprice = 850.99
        product.provider = pro3
        prodList.append(product)
        
        product = Product(context: context)
        product.pid = 7
        product.pname = "Tough TG6 "
        product.pdesc = "the Olympus Tough TG-6 digital camera is up for the challenge. It's waterproof, shockproof, and freeze-proof to withstand rugged conditions"
        product.pprice = 799.50
        product.provider = pro4
        prodList.append(product)
        
        product = Product(context: context)
        product.pid = 8
        product.pname = "EM5 Mark III"
        product.pdesc = "Seeking adventure is in your DNA. You're passionate about photographing all the far-flung places you visit. The E-M5 Mark III is just what you're looking for."
        product.pprice = 825.75
        product.provider = pro4
        prodList.append(product)
        
        product = Product(context: context)
        product.pid = 9
        product.pname = "X-S10"
        product.pdesc = "x-s10 has been designed to provide on-the-go photographers with maximum control.x-s10 still enjoys fujifilm’s renowned image-making technology "
        product.pprice = 460.30
        product.provider = pro5
        prodList.append(product)
        
        product = Product(context: context)
        product.pid = 10
        product.pname = "XT30"
        product.pdesc = "The 26.1MP BSI APS-C X-Trans CMOS 4 image sensor uses a unique color filter array to produce its stunning skin tones and colors and extremely low moire. "
        product.pprice = 685.50
        product.provider = pro5
        prodList.append(product)
        
        do {
            try context.save()
            tableView.reloadData()
        } catch {
            print("Sorry!Couldn't Save Data \(error.localizedDescription)")
        }
    }
   

}

//MARK: - SearchBar Clicked

extension ProdDataTableViewController: UISearchBarDelegate {
    
    //MARK: - Serachbar
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let prdname = NSPredicate(format: "pname contains[cd] %@", searchBar.text!)
        let prddesc = NSPredicate(format: "pdesc contains[cd] %@", searchBar.text!)
        getData(predicates: [prdname, prddesc])
    }
    
    // MARK: - search bar delegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            self.isSearching = false
            self.tableView.reloadData()
        }else {
            self.isSearching = true
            filterTableView(ind: searchBar.selectedScopeButtonIndex, text: searchText)
        }
    }
    
    // MARK: - Filter Table

    func filterTableView(ind:Int,text:String) {
        self.searchedData = prodList.filter({ (model) -> Bool in
            return (model.pname?.contains(text))! || (model.pdesc?.contains(text))!
        }) as NSArray
        print(self.searchedData)
        self.tableView.reloadData()
    }
    
}

//MARK:- UITableView Delegate,Datasource

extension ProdDataTableViewController : UITableViewDelegate,UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProdTableViewCell", for: indexPath) as! ProdTableViewCell
        let product = prodList[indexPath.row]
        cell.prodcell(product)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isSearching {
            return searchedData.count
        } else {
            return prodList.count
        }
    }
}

