//
//  ReminderViewController.m
//  HypnoNerd
//
//  Created by Hubert on 29.02.2016.
//  Copyright © 2016 Hubert. All rights reserved.
//

#import "ReminderViewController.h"
#import <UIKit/UIKit.h>

@interface ReminderViewController ()

@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;

@end

@implementation ReminderViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

  if (self)
  {
    UITabBarItem *tbi = self.tabBarItem;

    tbi.title = @"Reminder";

    UIImage *i = [UIImage imageNamed:@"Time.png"];
    tbi.image = i;
  }

  return self;
}

- (IBAction)addReminder:(id)sender
{
  NSDate *date = self.datePicker.date;
  NSLog(@"Setting a reminder for %@", date);

  UILocalNotification *note = [[UILocalNotification alloc] init];
  note.alertBody = @"Hypnotize me";
  note.fireDate = date;

  [[UIApplication sharedApplication] scheduleLocalNotification:note];
}

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];

  self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}



@end
