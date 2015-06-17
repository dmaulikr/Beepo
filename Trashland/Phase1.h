//
//  firstPhaseViewController.h
//  Trashland
//
//  Created by Thiago Borges Jordani on 10/06/15.
//  Copyright (c) 2015 Thiago Borges Jordani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DraggableImageView.h"
#import "Player.h"

@interface Phase1 : UIViewController
@property (nonatomic) IBOutlet UIView* viewFantasminha;

@property (nonatomic) IBOutlet UIImageView* phase1;
@property (nonatomic) IBOutlet UIImageView* luz3;
@property (nonatomic) IBOutlet UIImageView* luz4;


@property (weak, nonatomic) IBOutlet UIImageView *charImgView;

@property (nonatomic)  DraggableImageView* books;
@property (nonatomic)  DraggableImageView* flower;
@property (nonatomic)  DraggableImageView* vase;
@property (nonatomic)  DraggableImageView* plate;
@property (nonatomic)  DraggableImageView* vase2;
//@property (nonatomic)  DraggableImageView* vaseFlower;


@property (nonatomic) IBOutlet UIImageView* medalha1fase1;
@property (nonatomic) IBOutlet UIImageView* medalha2fase1;

@property (nonatomic) IBOutlet UIButton* bird;
@property (nonatomic) IBOutlet UIButton* botaoVoltar;
@property (nonatomic) IBOutlet UIButton* botaoPlay;

@property (nonatomic) IBOutlet UILabel* contador;

@property (nonatomic) Player* player;

@property (nonatomic) NSString* gasperEscolhido;


- (void)dealWithMovement;
@end
