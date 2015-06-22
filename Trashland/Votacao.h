//
//  Votacao.h
//  Trashland
//
//  Created by Bruno Muniz Azevedo Filho on 6/22/15.
//  Copyright (c) 2015 Thiago Borges Jordani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"

@interface Votacao : UIViewController

@property (nonatomic) Player* player;

@property (nonatomic) IBOutlet UIView* viewFundo;
@property (nonatomic) IBOutlet UIImageView* fundo;

@property (nonatomic) IBOutlet UIButton* opcao1;
@property (nonatomic) IBOutlet UIButton* opcao2;
@property (nonatomic) IBOutlet UIButton* opcao3;

@property (nonatomic) IBOutlet UIButton* confirma;
@property (nonatomic) IBOutlet UIButton* cancela;

@property (nonatomic) IBOutlet UIImageView* badgeDoacao;
@property (nonatomic) IBOutlet UIImageView* badgeVoto;

@property (nonatomic) IBOutlet UIButton* botaoVoltar;
@property (nonatomic) IBOutlet UIButton* botaoSom;

@end
