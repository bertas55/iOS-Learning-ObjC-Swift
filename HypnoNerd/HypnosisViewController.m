//
//  HypnosisViewController.m
//  HypnoNerd
//
//  Created by Hubert on 29.02.2016.
//  Copyright © 2016 Hubert. All rights reserved.
//

#import "HypnosisViewController.h"
#import "HypnosisView.h"

@interface HypnosisViewController ()

@property (nonatomic, strong) HypnosisView *backgroundView;

@end

@implementation HypnosisViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

  if (self)
  {
    self.tabBarItem.title = @"Hypnotize";

    UIImage *i = [UIImage imageNamed:@"Hypno.png"];

    self.tabBarItem.image = i;
  }

  return self;
}

- (void)loadView
{
  CGRect frame = [UIScreen mainScreen].bounds;
  self.backgroundView = [[HypnosisView alloc] initWithFrame:frame];

  self.view = self.backgroundView;

  UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"Red", @"Green", @"Blue"]];



  segmentedControl.frame = CGRectMake(35, 50, 250, 50);
  [segmentedControl addTarget:self action:@selector(MySegmentControlAction:) forControlEvents: UIControlEventValueChanged];
  segmentedControl.selectedSegmentIndex = 1;
  [self.view addSubview:segmentedControl];
}

- (void)MySegmentControlAction:(UISegmentedControl *)segment
{
  switch (segment.selectedSegmentIndex) {
    case 0:
      self.backgroundView.circleColor = [UIColor redColor];
      break;

    case 1:
      self.backgroundView.circleColor = [UIColor greenColor];
      break;

    case 2:
      self.backgroundView.circleColor = [UIColor blueColor];
      break;

    default:
      break;
  }
}

@end
