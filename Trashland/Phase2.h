//
//  Phase2.h
//  Trashland
//
//  Created by Bruno Muniz Azevedo Filho on 6/15/15.
//  Copyright (c) 2015 Thiago Borges Jordani. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Player.h"

@interface Phase2 : UIViewController


@property (nonatomic) Player* player;
@property (weak, nonatomic) IBOutlet UIScrollView *phaseScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *phaseBG;

//Arvores
@property (weak, nonatomic) IBOutlet UIImageView *arvore1;
@property (weak, nonatomic) IBOutlet UIImageView *arvore2;
@property (weak, nonatomic) IBOutlet UIImageView *arvore3;
@property (weak, nonatomic) IBOutlet UIImageView *arvore4;
@property (weak, nonatomic) IBOutlet UIImageView *arvore5;

@end
