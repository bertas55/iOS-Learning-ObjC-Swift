//
//  HypnosisView.m
//  Hypnotiser
//
//  Created by Hubert on 21.02.2016.
//  Copyright © 2016 Hubert. All rights reserved.
//

#import "HypnosisView.h"

@implementation HypnosisView

- (instancetype)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:(CGRect)frame];
  if (self)
  {
    self.backgroundColor = [UIColor clearColor];
    self.circleColor = [UIColor lightGrayColor];
  }

  return self;
}


- (void)drawRect:(CGRect)rect {
  CGRect bounds = self.bounds;

  CGPoint center;
  center.x = bounds.origin.x + bounds.size.width / 2.0;
  center.y = bounds.origin.y + bounds.size.height / 2.0;

  float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;

  UIBezierPath *path = [[UIBezierPath alloc] init];

  for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20)
  {
    [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];

    [path addArcWithCenter: center radius:currentRadius startAngle:0 endAngle:M_PI * 2.0 clockwise:YES];
  }

  path.lineWidth = 10;
  [self.circleColor setStroke];

  [path stroke];
/*
  // Shadows

  CGContextRef context = UIGraphicsGetCurrentContext();

  // Saving graphics before drawing shadows
  CGContextSaveGState(context);
    CGContextSetShadow(context, CGSizeMake(10, 10), 10);

  UIImage *logoImage = [UIImage imageNamed:@"logo.png"];
  [logoImage drawInRect:rect];

  CGContextRestoreGState(context);
*/
}

// When a finger touches the screen
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
  NSLog(@"%@ was touched", self);

  // Get 3 random numbers between 0 and 1
  float red = (arc4random() % 100) / 100.0;
  float green = (arc4random() % 100) / 100.0;
  float blue = (arc4random() % 100) / 100.0;

  UIColor *randomColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];

  self.circleColor = randomColor;


}

- (void)setCircleColor:(UIColor *)circleColor
{
  _circleColor = circleColor;
  [self setNeedsDisplay];
  NSLog(@"KOLORRR");
}




@end
