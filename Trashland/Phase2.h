//
//  Phase2.h
//  Trashland
//
//  Created by Bruno Muniz Azevedo Filho on 6/15/15.
//  Copyright (c) 2015 Thiago Borges Jordani. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Player.h"
#import "DraggableImageView.h"

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


//lixo
@property (weak, nonatomic) IBOutlet DraggableImageView *garrafaPet1;
@property (weak, nonatomic) IBOutlet DraggableImageView *lata;
@property (weak, nonatomic) IBOutlet DraggableImageView *garrafaVidro;
@property (weak, nonatomic) IBOutlet DraggableImageView *papel;
@property (weak, nonatomic) IBOutlet DraggableImageView *garrafaPet2;
@property (weak, nonatomic) IBOutlet UIImageView *cascaBanana;


@end
