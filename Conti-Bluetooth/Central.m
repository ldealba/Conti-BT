//
//  Central.m
//  Conti-Bluetooth
//
//  Created by Walter Gonzalez Domenzain on 12/05/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import "Central.h"

@interface Central ()

@end

@implementation Central
/**********************************************************************************************/
#pragma mark - Initialization
/**********************************************************************************************/
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**********************************************************************************************/
#pragma mark - Buttons functions
/**********************************************************************************************/
- (IBAction)btnBackPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
