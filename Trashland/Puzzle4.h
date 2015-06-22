//
//  Puzzle4.h
//  Trashland
//
//  Created by Bruno Muniz Azevedo Filho on 6/21/15.
//  Copyright (c) 2015 Thiago Borges Jordani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"
#import "DraggableView.h"


@interface Puzzle4 : UIViewController

@property (nonatomic) IBOutlet UIImageView* fundo;
@property (nonatomic) Player* player;

//Draggable!!!!
@property (nonatomic) IBOutlet UIImageView* brinquedo1;
@property (nonatomic) IBOutlet UIImageView* brinquedo2;
@property (nonatomic) IBOutlet UIImageView* brinquedo3;
@property (nonatomic) IBOutlet UIImageView* brinquedo4;

@property (nonatomic) IBOutlet UIButton* botaoVoltar;
@property (nonatomic) IBOutlet UIButton* botaoSom;

@property (nonatomic) IBOutlet UIImageView* badgeBrinquedo;
@property (nonatomic) IBOutlet UIImageView* badgeVoto;


@end
