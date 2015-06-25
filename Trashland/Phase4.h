//
//  Phase4.h
//  Trashland
//
//  Created by Thiago Borges Jordani on 25/06/15.
//  Copyright (c) 2015 Thiago Borges Jordani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"

@interface Phase4 : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *phase4ScrollView;
@property (weak, nonatomic) IBOutlet UIView *phase4ContentView;
@property (nonatomic) Player* player;
@end
