//
//  Story2.h
//  Trashland
//
//  Created by Bruno Muniz Azevedo Filho on 6/15/15.
//  Copyright (c) 2015 Thiago Borges Jordani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"

@interface Story2 : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imgFantasminha;

@property (weak, nonatomic) IBOutlet UIImageView *imgSombra;

@property (weak, nonatomic) IBOutlet UIView *moveBeepoView;

@property (retain,nonatomic) Player* player;

@end
