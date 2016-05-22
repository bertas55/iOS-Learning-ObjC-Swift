//
//  TableViewController.swift
//  ListSwift
//
//  Created by Hubert on 12.03.2016.
//  Copyright © 2016 Hubert. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

  var list = List()

  // MARK Properties:
  @IBOutlet weak var topTextField: UITextField!
  @IBOutlet weak var bottomTextField: UITextField!

  override func viewWillAppear(animated: Bool) {


  }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return list.size()
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ReuseIdentifier", forIndexPath: indexPath)

        cell.textLabel?.text = list.getAtIndex(indexPath.row)?.elem

        return cell
    }



    // MARK: - Navigation


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        if let cell = sender as? UITableViewCell {

            let detailsViewController = segue.destinationViewController as! DetailsViewController

            let indexPath = self.tableView.indexPathForCell(cell)!

            detailsViewController.elem = self.list.getAtIndex(indexPath.row)
        }

    }


    @IBAction func unwindToItemList(sender: UIStoryboardSegue) {

        if let sourceViewController = sender.sourceViewController as?
            AddItemViewController, elem = sourceViewController.elem,
            mode = sourceViewController.pushMode {

                if (mode == 0) {
                    list.pushFront(elem)
                } else {
                    list.pushBack(elem)
                }

            tableView.reloadData()

        }

    }

}




