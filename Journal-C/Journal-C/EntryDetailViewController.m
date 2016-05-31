//
//  EntryDetailViewController.m
//  Journal-C
//
//  Created by Emily Mearns on 5/31/16.
//  Copyright © 2016 Emily Mearns. All rights reserved.
//

#import "EntryDetailViewController.h"
#import "EntryController.h"
#import "Entry.h"

@interface EntryDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *entryTitleTextField;
@property (weak, nonatomic) IBOutlet UITextView *entryBodyTextView;


@end

@implementation EntryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateWith:self.entry];
}

- (void)updateWith:(Entry *)entry {
    self.entryTitleTextField.text = entry.title;
    self.entryBodyTextView.text = entry.bodyText;
}

- (IBAction)saveButtonPressed:(id)sender {
    if (self.entry) {
        self.entry.title = self.entryTitleTextField.text;
        self.entry.bodyText = self.entryBodyTextView.text;
    } else {
        Entry *entry = [[Entry alloc]initWithTitle:self.entryTitleTextField.text andBodyText:self.entryBodyTextView.text andTimestamp:[[NSDate alloc] init]];
        [[EntryController sharedInstance] addEntry:entry];
    }
    [self.navigationController popViewControllerAnimated:true];
}

- (IBAction)clearButtonPressed:(id)sender {
    self.entryBodyTextView.text = @"";
}

- (BOOL)textFieldShouldReturn:(UITextField *)entryTitleTextField {
    [entryTitleTextField resignFirstResponder];
    return true;
}

@end
