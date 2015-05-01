//
//  WeatherDescriptionTableViewCell.h
//  CurrentWeather
//
//  Created by Yuri Balashkevych on 01.05.15.
//  Copyright (c) 2015 George. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherDescriptionTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *cityNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *mainInfoLabel;
@property (weak, nonatomic) IBOutlet UILabel *desciptionInfoLabel;
@property (weak, nonatomic) IBOutlet UILabel *humidityLabel;
@property (weak, nonatomic) IBOutlet UILabel *windSpeedLabel;
@property (weak, nonatomic) IBOutlet UILabel *cloudinessLabel;

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@end
