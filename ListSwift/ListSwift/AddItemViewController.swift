//
//  AddItemViewController.swift
//  ListSwift
//
//  Created by Hubert on 19.03.2016.
//  Copyright © 2016 Hubert. All rights reserved.
//

// TODO: pushMode as enum

import UIKit

class AddItemViewController: UIViewController, UITextFieldDelegate {

    var elem: Element?

    var pushMode: Int?

    @IBOutlet weak var saveButton: UIBarButtonItem!
  
    @IBOutlet weak var nameTextField: UITextField!

    @IBOutlet weak var pushModeControll: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.nameTextField.delegate = self

        checkValidItemName()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        if saveButton === sender {
            elem = Element(initObj: nameTextField.text!)
            pushMode = pushModeControll.selectedSegmentIndex
        }
    }

    func textFieldDidBeginEditing(textField: UITextField) {

        // Disable the Save button while editing
        saveButton.enabled = false
    }

    func textFieldDidEndEditing(textField: UITextField) {

        checkValidItemName()
        navigationItem.title = textField.text
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {

        textField.resignFirstResponder()
        return true
    }

    func checkValidItemName() {

        // Disable the Save button if the text field is empty
        let text = nameTextField.text ?? ""

        saveButton.enabled = !text.isEmpty
    }

    @IBAction func cancel(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
