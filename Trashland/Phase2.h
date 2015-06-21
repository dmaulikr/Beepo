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
#import "DraggableView.h"

@interface Phase2 : UIViewController


@property (nonatomic) Player* player;
@property (weak, nonatomic) IBOutlet UIScrollView *phaseScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *phaseBG;

//gifs
@property (weak, nonatomic) IBOutlet UIImageView *balao;
@property (weak, nonatomic) IBOutlet UIImageView *bolinhaVermelha;
@property (weak, nonatomic) IBOutlet UIImageView *bolinhaVerde;

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
@property (weak, nonatomic) IBOutlet DraggableImageView *cascaBanana;

//outros
@property (weak, nonatomic) IBOutlet UIImageView *zzzImage;
@property (weak, nonatomic) IBOutlet UIImageView *charImageView;
@property (weak, nonatomic) IBOutlet UIImageView *shadowImageView;
@property (weak, nonatomic) IBOutlet DraggableView *fantasminhaView;
@property (nonatomic) NSString* gasperEscolhido;
@property (nonatomic) BOOL lookingBack;

@property (weak, nonatomic) IBOutlet UIButton *botaoProximo;

@property (weak, nonatomic) IBOutlet UIImageView *badgeLixo;
@property (weak, nonatomic) IBOutlet UIImageView *badgeNatureza;

@property (strong,nonatomic) UIViewController *popUpView;
@property (strong,nonatomic) NSMutableArray *lixos;
@end
