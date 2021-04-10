//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by 朝凪汐 on 2020/10/29.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    // MARK: - local data
    
    private var restaurantNames = ["東方伯爵 LE COMTE cafe", "Starscafe", "歐曼自家烘焙咖啡",
                                   "蠢咖啡 Dumb Coffee", "鹿點咖啡 Luna桃園店", "BUNA CAF'E 布納咖啡館 藝文店",
                                   "習作咖啡部", "只是光影 獨立咖啡廳", "風雨珈琲"]
    
    private var restaurantImages = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    private var restaurantLocations = ["龜山區", "龜山區", "龜山區", "龜山區", "桃園區", "桃園區", "桃園區", "桃園區", "桃園區"]
    
    private var resturantTypes = ["咖啡館", "咖啡館", "咖啡館", "咖啡館", "咖啡館", "咖啡館", "咖啡館", "咖啡館", "咖啡館"]
    
    private var restaurantAddr = ["33347桃園市龜山區德明路77巷20號", "333桃園市龜山區明德路336號", "333桃園市龜山區自強東路204號",
                                  "333桃園市龜山區振興路642號", "330桃園市桃園區成功路三段175號", "330桃園市桃園區中正路1061號",
                                  "330桃園市桃園區林森路6巷37號", "330桃園市桃園區新民街19號2樓", "330桃園市桃園區民權路25巷12號1樓"]
    
    private var restaurantPhoneNo = ["03 329 9301", "03 320 2733", "03 320 6825",
                                     "0903 871 155", "03 331 0156", "03 355 7749",
                                     "0909 122 321", "03 335 0368", "03 336 0750"]
    
    private var restaurantURL = ["https://www.facebook.com/東方伯爵-LE-COMTE-CAFE-133995037433574/",
                                 "https://www.facebook.com/Starscafe-1616728405260355/",
                                 "https://www.facebook.com/OhMyCoffee",
                                 "https://www.facebook.com/蠢咖啡-Dumb-Coffee-102559514435859/",
                                 "https://www.facebook.com/caffepromisedlandluna/",
                                 "https://www.facebook.com/bunacafe1061/",
                                 "https://www.facebook.com/習作咖啡部-578442535616943/",
                                 "https://www.facebook.com/riverdays/",
                                 "https://www.facebook.com/風雨珈琲-1740317382919530/"]
    
    private var restaurantDes = ["挑選優良咖啡莊園精品豆烘焙\n客製化烘豆保證最佳賞味期\n要喝好咖啡就到東方伯爵。",
                                 "鬧中取靜的 Stars Cafe 咖啡飲品不到百元價格，輕食選擇不多不見特色很一般，但滿適合午後來杯咖啡聊是非。",
                                 "最道地的黑咖啡，一股濃郁香氛的好味道，簡簡單單的小格局，卻是處處藏有溫馨的好氣味，我們歡迎真正懂咖啡的人士，更歡迎不懂咖啡的顧客，帶您進入咖啡的世界，一嚐永難忘的極致美味。",
                                 "在一個鳥不生蛋的地方，開一間咖啡店算不算蠢？看其受歡迎的程度，這個決定似乎不傻。位於市郊邊陲的「蠢咖啡」(Dumb Coffee)儘管離塵也離城，但打造出一棟極簡又單純的舒服空間，再搭上咖啡渣男的幽默感，在這兒品味的不單只有咖啡醇香，還有令人會心一笑的俏皮！怎能不去見識？",
                                 "鹿點咖啡桃園店這裡有著大大的月亮，可以讓你看月亮喝咖啡，就知道這是間吃裝潢的咖啡廳，整體氛圍，空間感設計的很好沒有壓迫感，但如果椅子可以在好坐些，一樓通風可以再好就更好了。另外發現店家雖然位置不多，但是服務人員只有兩位，所以等待時間需要比較長，而一樓的位置，由於店家有在烘豆還是烤pizza，所以會有油焦的味道。",
                                 "2015年桃園的藝文特區，設立了第一間布納創始店，我們秉持熱情好客的精神，提供舒適愉快的用餐環境，健康美味的無國界料理。",
                                 "位於桃園龜山工業區附近巷弄裡，有間老宅文青風格的咖啡館「習作咖啡部」。隱身在住宅區裡，稍不注意很容易就此錯過，因為是巷弄又是住宅區因此不好停車，但可以把車停在外圍再走進來也不遠（摩托車可停店門前）。日系+文青風搭配復古風的傢俱和木質餐桌椅，一整個很有質感，店內也很自然而然地營造出一種寧靜感，來到這裡也會不自覺地放低音量，提供的餐點很簡單，僅有飲品（咖啡/茶）和自家烘焙甜點，從接待、點餐、製作準備及出餐，均由老闆一人包辦，所以需稍候些許時間。習作咖啡部的咖啡好喝，也有販售咖啡豆，甜點有比較甜，但比斯吉好好吃，若也想找個地方可以悠閒寧靜地渡過一下午，可以選擇來這裡坐坐",
                                 "只是光影 indie cafe：The light dance with shadow ——— 走進新民街，找到地址19號後，注意旁邊小巷的側門，走上二樓階梯，只是光影就在裡頭。咖啡和自由並不有關，但是很具有想像力。輕食不想要太複雜。文字散落在空間裡的便是等待撿拾的理想。展覽來看，並且也徵。書集永遠是文明精神的去處。熱衷把所有閒置的文明變成寶貝。禮拜二公休，給自己，以及和我而生的親密關係一些美麗時光。(遇國定假期，照常營業)，展場空間歡迎租借發表作品。",
                                 "只有販售甜食與飲品的咖啡店，每日提供約10款限量手工蛋糕，歡迎大家來吃甜、在繁忙的市區中享受下午茶時光。"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "datacell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell
        
        // Configure the cell...
        cell.nameLabel.text = restaurantNames[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named: restaurantImages[indexPath.row])
        cell.locationLabel.text = restaurantLocations[indexPath.row]
        cell.typeLabel.text = resturantTypes[indexPath.row]
        return cell
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowDetail"{
            if let indexPath = tableView.indexPathForSelectedRow{
                let destinationController = segue.destination as! DetailViewController
                destinationController.imageId = restaurantImages[indexPath.row]
                destinationController.name = restaurantNames[indexPath.row]
                destinationController.type = resturantTypes[indexPath.row]
                destinationController.address = restaurantAddr[indexPath.row]
                destinationController.url = restaurantURL[indexPath.row]
                destinationController.phoneNo = restaurantPhoneNo[indexPath.row]
                destinationController.descript = restaurantDes[indexPath.row]
            }
        }
    }

}
