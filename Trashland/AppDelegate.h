//
//  AppDelegate.h
//  Trashland
//
//  Created by Thiago Borges Jordani on 10/06/15.
//  Copyright (c) 2015 Thiago Borges Jordani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic) Player* player;

@end

