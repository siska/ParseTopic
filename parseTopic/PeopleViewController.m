//
//  ViewController.m
//  parseTopic
//
//  Created by Kevin McQuown on 8/18/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "PeopleViewController.h"
#import <Parse/Parse.h>
#import "DogViewController.h"

@interface PeopleViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *persons;

@end

@implementation PeopleViewController

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.persons.count;
}
- (void)addPersonWithName:(NSString *)name andAge:(NSNumber *)age
{

}
- (IBAction)onAddPersonButtonTapped:(id)sender {

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"New Owner" message:nil preferredStyle:UIAlertControllerStyleAlert];

    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Name";
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Age";
    }];

    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Add" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self addPersonWithName:[alert.textFields[0] text] andAge:[NSNumber numberWithInteger:[[alert.textFields[1] text] intValue]]];
    }];

    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancelAction];
    [alert addAction:okAction];

    [self presentViewController:alert animated:YES completion:nil];

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PersonCell"];

    return cell;
}

- (void) refreshDisplay
{
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DogViewController *vc = segue.destinationViewController;
    vc.person = self.persons[self.tableView.indexPathForSelectedRow.row];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self refreshDisplay];
}

@end
