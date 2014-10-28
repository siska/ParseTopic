//
//  DogViewController.m
//  parseTopic
//
//  Created by Kevin McQuown on 10/22/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "DogViewController.h"

@interface DogViewController () <UITableViewDelegate, UITableViewDataSource>

@property NSArray *dogs;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation DogViewController

- (void)addDogWithName:(NSString *)name
{

}

- (IBAction)addDogTapped:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"New Dog" message:nil preferredStyle:UIAlertControllerStyleAlert];

    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Name";
    }];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Add" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self addDogWithName:[alert.textFields[0] text]];
    }];

    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancelAction];
    [alert addAction:okAction];

    [self presentViewController:alert animated:YES completion:nil];
}

- (void) refreshDisplay
{

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dogs.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    return cell;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self refreshDisplay];
}


@end
