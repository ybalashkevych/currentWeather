//
//  ViewController.h
//  CurrentWeather
//
//  Created by Yuri Balashkevych on 30.04.15.
//  Copyright (c) 2015 George. All rights reserved.
//

#import <WYPopoverController/WYPopoverController.h>
#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak ,nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSString      *city;
@property (strong, nonatomic) WYPopoverController *popover;


- (void)refreshData;
- (IBAction)actionShowPopover:(UIBarButtonItem*)sender;

@end

