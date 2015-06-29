//
//  Phase4.h
//  Trashland
//
//  Created by Thiago Borges Jordani on 25/06/15.
//  Copyright (c) 2015 Thiago Borges Jordani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"

@interface Phase4 : UIViewController

@property (nonatomic) Player* player;

@property (nonatomic) IBOutlet UIButton* botaoDoacao;

@property (nonatomic) IBOutlet UIButton* botaoEleicao;
@property (weak, nonatomic) IBOutlet UIImageView *badgeDoacaoImgView;
@property (weak, nonatomic) IBOutlet UIImageView *badgeEleicaoImgView;

@end
