//
//  EntryListTableViewController.m
//  Journal-C
//
//  Created by Emily Mearns on 5/31/16.
//  Copyright © 2016 Emily Mearns. All rights reserved.
//

#import "EntryListTableViewController.h"
#import "EntryDetailViewController.h"
#import "EntryController.h"
#import "Entry.h"

@interface EntryListTableViewController ()

@end

@implementation EntryListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:true];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [EntryController sharedInstance].entries.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell" forIndexPath:indexPath];
    
    Entry *entry = [EntryController sharedInstance].entries[indexPath.row];
    cell.textLabel.text = entry.title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        Entry *entry = [EntryController sharedInstance].entries[indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toViewEntry"]) {
        EntryDetailViewController *entryDetailVC = (EntryDetailViewController *) [segue destinationViewController];
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        Entry *entry = [EntryController sharedInstance].entries[indexPath.row];
        entryDetailVC.entry = entry;
    }
    
    
    
}


@end
