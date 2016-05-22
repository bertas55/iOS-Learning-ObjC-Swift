//
//  ItemStore.m
//  Homepwner
//
//  Created by Hubert on 07.03.2016.
//  Copyright © 2016 Hubert. All rights reserved.
//

#import "ItemStore.h"
#import "Item.h"

@interface ItemStore ()

@property (nonatomic) NSMutableArray *privateItems;

@end

@implementation ItemStore

+ (instancetype)sharedStore
{
  static ItemStore *sharedStore = nil;

  if(!sharedStore)
  {
    sharedStore = [[self alloc] initPrivate];
  }

  return sharedStore;
}

- (instancetype)init
{
  @throw [NSException exceptionWithName:@"Singleton" reason:@"Use +[ItemStore sharedStore]" userInfo:nil];

  return nil;
}

- (instancetype)initPrivate
{
  self = [super init];

  if (self) {
    _privateItems = [[NSMutableArray alloc] init];
  }

  return self;
}

- (NSArray *)allItems
{
  return self.privateItems;
}

- (Item *)createItem
{
  Item *item = [Item randomItem];

  [self.privateItems addObject:item];

  return item;
}

- (void)removeItem:(Item *)item
{
  [self.privateItems removeObjectIdenticalTo:item];
}

- (void)moveItemAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex
{
  if (fromIndex == toIndex) {
    return;
  }

  // Get pointer to item being moved
  Item *item = self.privateItems[fromIndex];

  // Remove item from array
  [self.privateItems removeObjectAtIndex:fromIndex];

  // Insert item to array at specified index
  [self.privateItems insertObject:item atIndex:toIndex];

}

@end
