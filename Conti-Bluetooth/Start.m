//
//  ViewController.m
//  Conti-Bluetooth
//
//  Created by Walter Gonzalez Domenzain on 12/05/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import "Start.h"
#import "Central.h"
#import "Peripheral.h"

@interface Start ()

@end

@implementation Start
/**********************************************************************************************/
#pragma mark - Initialization
/**********************************************************************************************/
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**********************************************************************************************/
#pragma mark - Buttons functions
/**********************************************************************************************/
- (IBAction)btnCentralPressed:(id)sender
{
    Central *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"Central"];
    [self presentViewController:viewController animated:YES completion:nil];
}
//-------------------------------------------------------------------------------
- (IBAction)btnPeripheralPressed:(id)sender
{
    Peripheral *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"Peripheral"];
    [self presentViewController:viewController animated:YES completion:nil];
}
@end
