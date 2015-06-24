//
//  Phase4.h
//  Trashland
//
//  Created by Bruno Muniz Azevedo Filho on 6/16/15.
//  Copyright (c) 2015 Thiago Borges Jordani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"

@interface Phase4 : UIViewController <UIScrollViewDelegate>

@property (nonatomic) IBOutlet UIScrollView* phase4ScrollView;

@property (nonatomic) Player* player;

@property (weak, nonatomic) IBOutlet UIView *contentView;


@property (nonatomic) IBOutlet UIImageView* badgeDoacao;

@property (nonatomic) IBOutlet UIImageView* badgeVoto;

@end
