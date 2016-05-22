//
//  DetailViewController.m
//  Homepwner
//
//  Created by Hubert on 17.03.2016.
//  Copyright © 2016 Hubert. All rights reserved.
//

#import "DetailViewController.h"
#import "ChangeDateViewController.h"
#import "Item.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *serialNumberField;
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation DetailViewController

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];

  Item *item = self.item;

  self.nameField.text = item.itemName;
  self.serialNumberField.text = item.serialNumber;
  self.valueField.text = [NSString stringWithFormat:@"%d", item.valueInDollars];

  static NSDateFormatter *dateFormater = nil;
  if (!dateFormater) {
    dateFormater = [[NSDateFormatter alloc] init];
    dateFormater.dateStyle = NSDateIntervalFormatterMediumStyle;
    dateFormater.timeStyle = NSDateIntervalFormatterNoStyle;
  }

  self.dateLabel.text = [dateFormater stringFromDate:item.dateCreated];

}

- (void)viewWillDisappear:(BOOL)animated
{
  [super viewWillDisappear:animated];

  // Clear first responder
  [self.view endEditing:YES];

  Item *item = self.item;
  item.itemName = self.nameField.text;
  item.serialNumber = self.serialNumberField.text;
  item.valueInDollars = [self.valueField.text intValue];
}

- (void)setItem:(Item *)item
{
  _item = item;
  self.navigationItem.title = _item.itemName;
}

- (IBAction)changeDate:(id)sender
{
  ChangeDateViewController *changeDateVC = [[ChangeDateViewController alloc] init];

  changeDateVC.item = self.item;

  [self.navigationController pushViewController:changeDateVC animated:YES];
}

@end
