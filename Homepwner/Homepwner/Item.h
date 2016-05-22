//
//  Item.h
//  RandomItems
//
//  Created by Hubert on 18.02.2016.
//  Copyright © 2016 Hubert. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

+ (instancetype)randomItem;

- (instancetype)initWithItemName:(NSString *)name valueInDollars:(int)value serialNumber:(NSString *)sNumber;

- (instancetype)initWithItemName:(NSString *)name;

@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, strong) NSDate *dateCreated;



@end
