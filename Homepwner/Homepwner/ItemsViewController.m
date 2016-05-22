//
//  ItemsViewController.m
//  Homepwner
//
//  Created by Hubert on 07.03.2016.
//  Copyright © 2016 Hubert. All rights reserved.
//

#import "ItemsViewController.h"
#import "DetailViewController.h"
#import "ItemStore.h"
#import "Item.h"

@implementation ItemsViewController

- (instancetype)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
      UINavigationItem *navigationItem = self.navigationItem;
      navigationItem.title = @"Homepwner";

      // Create a new bar button item that will send addNewItem
      UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self
                                                                         action:@selector(addNewItem:)];

      navigationItem.rightBarButtonItem = bbi;
      navigationItem.leftBarButtonItem = self.editButtonItem;
    }

    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *detailViewController = [[DetailViewController alloc] init];

    NSArray *items = [[ItemStore sharedStore] allItems];
    Item *selectedItem = items[indexPath.row];

    detailViewController.item = selectedItem;

    // Push it onto the top of the navigation controller's stack
    [self.navigationController pushViewController:detailViewController animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[ItemStore sharedStore] allItems] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    NSUInteger itemsCount = [[[ItemStore sharedStore] allItems] count];
    NSString *label;

    NSArray *items = [[ItemStore sharedStore] allItems];
    Item *item = items[indexPath.row];

    label = [item description];


    cell.textLabel.text = label;

    return cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

// Adds new row
- (IBAction)addNewItem:(id)sender
{
    Item *newItem = [[ItemStore sharedStore] createItem];

    NSInteger lastRow = [[[ItemStore sharedStore] allItems] indexOfObject:newItem];

    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:lastRow inSection:0];

    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
}

// Deletes row
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {

        NSArray *items = [[ItemStore sharedStore] allItems];
        Item *item = items[indexPath.row];

        [[ItemStore sharedStore] removeItem:item];

        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

// Renames "Delete" button
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"Remove";
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [[ItemStore sharedStore] moveItemAtIndex:sourceIndexPath.row toIndex:destinationIndexPath.row];
}

// Editing cells
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

@end








