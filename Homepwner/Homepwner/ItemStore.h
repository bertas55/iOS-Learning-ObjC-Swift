//
//  ItemStore.h
//  Homepwner
//
//  Created by Hubert on 07.03.2016.
//  Copyright © 2016 Hubert. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Item;

@interface ItemStore : NSObject

@property (nonatomic, readonly) NSArray *allItems;

+ (instancetype)sharedStore;
- (Item *)createItem;
- (void)removeItem:(Item *)item;
- (void)moveItemAtIndex:(NSUInteger)fromIndex
                toIndex:(NSUInteger)toIndex;

@end
