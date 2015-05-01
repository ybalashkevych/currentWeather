//
//  CityListPopoverViewController.m
//  CurrentWeather
//
//  Created by Yuri Balashkevych on 01.05.15.
//  Copyright (c) 2015 George. All rights reserved.
//

#import "CityListPopoverViewController.h"
#import "ViewController.h"

@interface CityListPopoverViewController ()

@property (strong, nonatomic) NSArray *cities;

@end

@implementation CityListPopoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.cities count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"cityCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = [self.cities objectAtIndex:indexPath.row];
    
    return cell;
}







#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ViewController *vc = self.delegate;
    vc.city = [self.cities objectAtIndex:indexPath.row];
    [vc refreshData];
    [vc.popover dismissPopoverAnimated:YES];
    
}








#pragma mark - Setters and Getters

- (NSArray*)cities {
    
    if (!_cities) {
        
        _cities = [NSArray arrayWithObjects:@"Kiev", @"Paris", @"New York", @"Lviv", @"Milan", nil];
        
    }
    return _cities;
}





@end





























