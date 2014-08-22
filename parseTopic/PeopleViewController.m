//
//  ViewController.m
//  parseTopic
//
//  Created by Kevin McQuown on 8/18/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "PeopleViewController.h"
#import <Parse/Parse.h>

@interface PeopleViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *persons;

@end

@implementation PeopleViewController

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.persons.count;
}
- (IBAction)addButtonTapped:(id)sender {
    
    PFObject *person = [PFObject objectWithClassName:@"Person"];
    person[@"name"] = @"Kevin McQuown";
    person[@"age"] = @52;
    [person saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (error) {
            NSLog(@"%@",[error userInfo]);
        }
        else
        {
            [self refreshDisplay];
        }
    }];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PersonCell"];
    PFObject *person = self.persons[indexPath.row];
    cell.textLabel.text = person[@"name"];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PFObject *person = self.persons[indexPath.row];

    PFObject *dog = [PFObject objectWithClassName:@"Dog"];
    dog[@"name"] = @"Fido";
    dog[@"owner"] = person;
    [dog saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        [self refreshDisplay];
    }];
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    PFObject *person = self.persons[indexPath.row];

    PFQuery *query = [PFQuery queryWithClassName:@"Dog"];
    [query whereKey:@"owner" equalTo:person];

    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        for (PFObject *dog in objects)
        {
            NSLog(@"%@",dog);
        }
    }];
}

- (void) refreshDisplay
{
    PFQuery *personQuery = [PFQuery queryWithClassName:@"Person"];
    [personQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error)
        {

        }
        else
        {
            self.persons = objects;
            [self.tableView reloadData];
        }
    }];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];


}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self refreshDisplay];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
