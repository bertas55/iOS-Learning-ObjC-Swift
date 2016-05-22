//
//  ChangeDataViewController.m
//  Homepwner
//
//  Created by Hubert on 19.03.2016.
//  Copyright © 2016 Hubert. All rights reserved.
//

#import "ChangeDateViewController.h"
#import "Item.h"

@interface ChangeDateViewController ()

@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;

@end

@implementation ChangeDateViewController

- (instancetype)init
{
  self = [super init];
  if (self) {

  }

  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];

}

- (void)viewWillDisappear:(BOOL)animated
{
  [super viewWillDisappear:animated];

  [self.view endEditing:YES];

  self.item.dateCreated = [self.datePicker date];
}


@end
