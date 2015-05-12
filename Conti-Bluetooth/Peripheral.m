//
//  Peripheral.m
//  Conti-Bluetooth
//
//  Created by Walter Gonzalez Domenzain on 12/05/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import "Peripheral.h"

@interface Peripheral ()

@end

@implementation Peripheral
/**********************************************************************************************/
#pragma mark - Initialization
/**********************************************************************************************/
- (void)viewDidLoad {
    [super viewDidLoad];
    // Start up the CBPeripheralManager
    self.peripheralManager  = [[CBPeripheralManager alloc] initWithDelegate:self queue:nil];
}
//-------------------------------------------------------------------------------
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-------------------------------------------------------------------------------
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    // Don't keep it going while we're not showing.
    [self.peripheralManager stopAdvertising];
}

/**********************************************************************************************/
#pragma mark - Buttons functions
/**********************************************************************************************/
- (IBAction)btnBackPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btnSendBTPressed:(id)sender {
}

/**********************************************************************************************/
#pragma mark - Peripheral Methods
/**********************************************************************************************/
/** Required protocol method.  A full app should take care of all the possible states,
 *  but we're just waiting for  to know when the CBPeripheralManager is ready
 */
- (void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral
{
    // Opt out from any other state
    if (peripheral.state != CBPeripheralManagerStatePoweredOn)
    {
        return;
    }
    
    // We're in CBPeripheralManagerStatePoweredOn state...
    NSLog(@"self.peripheralManager powered on.");
    
    // Start with the CBMutableCharacteristic
    self.transferCharacteristic = [[CBMutableCharacteristic alloc] initWithType:[CBUUID UUIDWithString:TRANSFER_CHARACTERISTIC_UUID]
                                                                     properties:CBCharacteristicPropertyNotify
                                                                          value:nil
                                                                    permissions:CBAttributePermissionsReadable];
    
    // Then the service
    CBMutableService *transferService = [[CBMutableService alloc] initWithType:[CBUUID UUIDWithString:TRANSFER_SERVICE_UUID]
                                                                       primary:YES];
    
    // Add the characteristic to the service
    transferService.characteristics = @[self.transferCharacteristic];
    
    // And add it to the peripheral manager
    [self.peripheralManager addService:transferService];
}
//-------------------------------------------------------------------------------
/** Catch when someone subscribes to our characteristic, then start sending them data */
- (void)peripheralManager:(CBPeripheralManager *)peripheral central:(CBCentral *)central didSubscribeToCharacteristic:(CBCharacteristic *)characteristic
{
    NSLog(@"Central subscribed to characteristic");
    
    // Get the data
    self.dataToSend         = [self.txtBT.text dataUsingEncoding:NSUTF8StringEncoding];
    
    // Reset the index
    self.sendDataIndex      = 0;
    
    // Start sending
    [self sendData];
}

- (void)sendData
{
    
}



































@end
