//
//  Peripheral.h
//  Conti-Bluetooth
//
//  Created by Walter Gonzalez Domenzain on 12/05/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import "Declarations.h"

@interface Peripheral : UIViewController<CBPeripheralDelegate, CBPeripheralManagerDelegate>

//BT properties
@property (strong, nonatomic)       CBPeripheralManager       *peripheralManager;
@property (strong, nonatomic)       CBMutableCharacteristic   *transferCharacteristic;
@property (strong, nonatomic)       NSData                    *dataToSend;
@property (nonatomic, readwrite)    NSInteger                 sendDataIndex;

//Texts
@property (strong, nonatomic) IBOutlet UITextField *txtBT;

//Actions
- (IBAction)btnBackPressed:(id)sender;
- (IBAction)btnSendBTPressed:(id)sender;

@end
