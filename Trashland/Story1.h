//
//  Story1.h
//  Trashland
//
//  Created by Bruno Muniz Azevedo Filho on 6/15/15.
//  Copyright (c) 2015 Thiago Borges Jordani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"

@interface Story1 : UIViewController

@property (weak, nonatomic) IBOutlet UIPageControl* controle;
@property (weak, nonatomic) IBOutlet UIImageView* background;
@property (weak, nonatomic) IBOutlet UIButton* botaoVoltar;
@property (weak, nonatomic) IBOutlet UIButton* botaoPlay;
@property (retain, nonatomic) Player* player;
@property (weak, nonatomic) IBOutlet UIImageView *gifDedo;

//Page 1
@property (weak, nonatomic) IBOutlet UIView* viewGasper;
@property (weak, nonatomic) IBOutlet UIImageView* sombra;
@property (weak, nonatomic) IBOutlet UIImageView* gasper;
@property (weak, nonatomic) IBOutlet UILabel* frase1;
@property (weak, nonatomic) IBOutlet UILabel* frase2;

//Page 2
@property (weak, nonatomic) IBOutlet UIImageView* interrogacao1;
@property (weak, nonatomic) IBOutlet UIImageView* interrogacao2;
@property (weak, nonatomic) IBOutlet UIImageView* interrogacao3;
@property (weak, nonatomic) IBOutlet UILabel* frase3;
@property (weak, nonatomic) IBOutlet UILabel* frase4;

//Page 3
@property (weak, nonatomic) IBOutlet UIView* viewGasperTriste;
@property (weak, nonatomic) IBOutlet UIImageView* gasperTriste;
@property (weak, nonatomic) IBOutlet UIImageView* gaspersombraTriste;

@end
