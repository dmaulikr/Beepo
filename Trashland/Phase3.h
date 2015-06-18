//
//  Phase3.h
//  Trashland
//
//  Created by Bruno Muniz Azevedo Filho on 6/15/15.
//  Copyright (c) 2015 Thiago Borges Jordani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"
#import "DraggableView.h"

@interface Phase3 : UIViewController


@property (nonatomic) Player* player;

@property (nonatomic) IBOutlet UIImageView* fundo;

@property (nonatomic) IBOutlet UIView* viewBeepo;
@property (nonatomic) IBOutlet UIImageView* imageBeepo;
@property (nonatomic) IBOutlet UIImageView* imageSombraBeepo;

@property (nonatomic) IBOutlet DraggableView* viewVelha;
@property (nonatomic) IBOutlet UIImageView* imageVelha;
@property (nonatomic) IBOutlet UIImageView* imageSombraVelha;

@property (nonatomic) IBOutlet UIView* carro1;
@property (nonatomic) IBOutlet UIView* carro2;

@property (nonatomic) UIView* barrier;

@end
