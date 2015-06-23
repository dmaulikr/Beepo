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

@property (nonatomic) IBOutlet UIScrollView* scrollView;
@property (nonatomic) IBOutlet UIImageView* fundo;
@property (nonatomic) Player* player;

@property (nonatomic) IBOutlet UIButton* botaoVoltar;
@property (nonatomic) IBOutlet UIButton* botaoSom;

@property (nonatomic) IBOutlet UIImageView* badgeDoacao;
@property (nonatomic) IBOutlet UIImageView* badgeVoto;

@property (nonatomic) IBOutlet UIButton* botaoDoacao;
@property (nonatomic) IBOutlet UIButton* botaoEleicao;

@property (nonatomic) IBOutlet UIImageView* madeiraDoacao;
@property (nonatomic) IBOutlet UIImageView* velhaDoacao;
@property (nonatomic) IBOutlet UIImageView* menino1;
@property (nonatomic) IBOutlet UIImageView* menino2;
@property (nonatomic) IBOutlet UIImageView* guarda;
@property (nonatomic) IBOutlet UIImageView* prefeito;
@property (nonatomic) IBOutlet UIImageView* nomeFaixa;
@property (nonatomic) IBOutlet UIImageView* bandeira;
@property (nonatomic) IBOutlet UIImageView* vagabundo;
@property (nonatomic) IBOutlet UIImageView* zzzVagabundo;

@end
