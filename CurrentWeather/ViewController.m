//
//  ViewController.m
//  CurrentWeather
//
//  Created by Yuri Balashkevych on 30.04.15.
//  Copyright (c) 2015 George. All rights reserved.
//

#import <AFNetworking/UIImageView+AFNetworking.h>
#import "WeatherDescriptionTableViewCell.h"
#import "CityListPopoverViewController.h"
#import "MapTableViewCell.h"
#import "ViewController.h"
#import "ServerManager.h"
#import "Weather.h"

typedef enum {
    
    TableRowMap,
    TableRowWeather
    
}TableRow;


@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) ServerManager *serverManager;
@property (strong, nonatomic) Weather       *weather;

@end

#pragma mark - View Cycle

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self refreshData];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}








#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = nil;
    
    switch (indexPath.row) {
        case TableRowMap:
            cell = [self cellForRowMap];
            break;
            
        case TableRowWeather:
            cell = [self cellForRowWeather];
            break;
            
        default:
            break;
    }
    return cell;
    
}







#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        return 200;
    
    } else if (indexPath.row == 1) {
        return 300;
    }
    
    return 0;
}








#pragma mark - Cells for Table

- (UITableViewCell*)cellForRowMap {
    
    MapTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"mapCell"];
    
    MKCoordinateSpan span = MKCoordinateSpanMake(1, 1);
    MKCoordinateRegion region = MKCoordinateRegionMake(self.weather.coords, span);
    
    [cell.mapView setRegion:region animated:YES];
        
    return cell;
    
}

- (UITableViewCell*)cellForRowWeather {
    
    WeatherDescriptionTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"weatherCell"];
    cell.cityNameLabel.text = self.weather.cityName;
    cell.desciptionInfoLabel.text = self.weather.descriptionInfo;
    cell.mainInfoLabel.text = self.weather.mainInfo;
    cell.humidityLabel.text = [NSString stringWithFormat:@"%ld%%",self.weather.humidity];
    cell.windSpeedLabel.text = [NSString stringWithFormat:@"%.2f m/s", self.weather.windSpeed];
    cell.cloudinessLabel.text = [NSString stringWithFormat:@"%ld%%", self.weather.cloudsLevel];
    
    UIImage *placeholder = nil;
    NSString* imageStr = [NSString stringWithFormat:@"http://api.openweathermap.org/img/w/%@.png",self.weather.icon];
    NSURL *urlImage = [NSURL URLWithString:imageStr];
    [cell.iconImageView setImageWithURL:urlImage placeholderImage:placeholder];
    
    return cell;
}







#pragma mark - Actions

- (IBAction)actionShowPopover:(UIBarButtonItem *)sender {
    
    CityListPopoverViewController *vc = [[CityListPopoverViewController alloc] initWithStyle:UITableViewStylePlain];
    vc.delegate = self;
    self.popover = [[WYPopoverController alloc] initWithContentViewController:vc];
    [self.popover presentPopoverFromBarButtonItem:sender permittedArrowDirections:WYPopoverArrowDirectionAny animated:YES options:WYPopoverAnimationOptionFadeWithScale completion:nil];

}







#pragma mark - Private Methods

- (void)refreshData {
    
    NSDictionary *params = @{@"q":self.city};
    
    [self.serverManager getWeatherWithParams:params onSuccess:^(id weather) {
        
        self.weather = weather;
        [self.tableView reloadData];
        
    } andFailure:nil];
    
}








#pragma mark - Getters and Setters

- (ServerManager*)serverManager {

    if (!_serverManager) {
        
        _serverManager = [ServerManager sharedManager];
        
    }
    return _serverManager;
}

- (NSString*)city {
    
    if (!_city) {
        _city = @"Kiev";
    }
    return _city;
    
}


@end
