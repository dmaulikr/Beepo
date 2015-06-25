//
//  Player.m
//  Trashland
//
//  Created by Bruno Muniz Azevedo Filho on 6/16/15.
//  Copyright (c) 2015 Thiago Borges Jordani. All rights reserved.
//

#import "Player.h"

@implementation Player

- (void)dismissToPhaseSelect{
    [self.telaEscolha dismissViewControllerAnimated:YES completion:nil];
}
@end
