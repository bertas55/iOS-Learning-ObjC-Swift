//
//  QuizViewController.m
//  HypnoNerd
//
//  Created by Hubert on 01.03.2016.
//  Copyright © 2016 Hubert. All rights reserved.
//

#import "QuizViewController.h"

@interface QuizViewController ()

@property (nonatomic) int number;

@property (nonatomic, weak) IBOutlet UILabel *numberLabel;

@end

@implementation QuizViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

  if (self) {
    UITabBarItem *tbi = self.tabBarItem;

    tbi.title = @"Quiz";

    self.number = 0;
    self.numberLabel.text = [NSString stringWithFormat:@"%d", self.number];
  }

  return self;
}

- (IBAction)incrementLabel:(id)sender
{
  self.number++;

  self.numberLabel.text = [NSString stringWithFormat:@"%d", self.number];
}

- (IBAction)decrementLabel:(id)sender
{
  self.number--;

  self.numberLabel.text = [NSString stringWithFormat:@"%d", self.number];
}



@end
