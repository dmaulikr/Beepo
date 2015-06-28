//
//  Fim.h
//  Trashland
//
//  Created by Bruno Muniz Azevedo Filho on 6/22/15.
//  Copyright (c) 2015 Thiago Borges Jordani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"


@interface Fim : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *flagImageView;
@property (weak, nonatomic) IBOutlet UIImageView *cityNameLabel;

@property (nonatomic) IBOutlet UIImageView* fundo;

@property (nonatomic) Player* player;

@end
