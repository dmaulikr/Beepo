//
//  Player.h
//  Trashland
//
//  Created by Bruno Muniz Azevedo Filho on 6/16/15.
//  Copyright (c) 2015 Thiago Borges Jordani. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

@interface Player : NSObject

@property (nonatomic) BOOL fase1;
@property (nonatomic) BOOL medalha1fase1;
@property (nonatomic) BOOL medalha2fase1;

@property (nonatomic) BOOL fase2;
@property (nonatomic) BOOL medalha1fase2;
@property (nonatomic) BOOL medalha2fase2;

@property (nonatomic) BOOL fase3;
@property (nonatomic) BOOL medalha1fase3;
@property (nonatomic) BOOL medalha2fase3;

@property (nonatomic) BOOL fase4;
@property (nonatomic) BOOL medalha1fase4;
@property (nonatomic) BOOL medalha2fase4;

@property (nonatomic) UIImage* gasperEscolhido;

@end
