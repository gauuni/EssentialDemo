//
//  ViewController.m
//  EssentialDemo
//
//  Created by Gau Uni on 11/25/14.
//  Copyright (c) 2014 iOS_Team_CO2. All rights reserved.
//

#import "ViewController.h"


#import "EssentialLib/Network.h"
#import "EssentialLib/Validator.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [Validator validateEmail:@""];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)willTransitionToTraitCollection:(UITraitCollection *)newCollection withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{

}
@end
