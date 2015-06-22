//
//  Puzzle4.m
//  Trashland
//
//  Created by Bruno Muniz Azevedo Filho on 6/21/15.
//  Copyright (c) 2015 Thiago Borges Jordani. All rights reserved.
//

#import "Puzzle4.h"

@interface Puzzle4 (){
    BOOL ponto1;
    BOOL ponto2;
    BOOL ponto3;
    BOOL ponto4;
}

@end

@implementation Puzzle4

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ponto1 = false;
    ponto2 = false;
    ponto3 = false;
    ponto4 = false;
    
    [self checkToys];
}

-(void)checkToys{
    if (self.brinquedo1.center.x < 1 && self.brinquedo1.center.x > 2) {
        if (self.brinquedo1.center.y > 1 && self.brinquedo1.center.y > 2) {
            ponto1 = true;
            if (self.brinquedo2.center.x < 1 && self.brinquedo2.center.x > 2) {
                if (self.brinquedo2.center.y > 1 && self.brinquedo2.center.y > 2) {
                    ponto2 = true;
                    if (self.brinquedo3.center.x < 1 && self.brinquedo3.center.x > 2) {
                        if (self.brinquedo3.center.y > 1 && self.brinquedo3.center.y > 2) {
                            ponto3 = true;
                            if (self.brinquedo4.center.x < 1 && self.brinquedo4.center.x > 2) {
                                if (self.brinquedo4.center.y > 1 && self.brinquedo4.center.y > 2) {
                                    ponto4 = true;
                                    self.player.medalha1fase4 = true;
                                }else{
                                    [NSTimer scheduledTimerWithTimeInterval:0.3f target:self selector:@selector(checkToys) userInfo:nil repeats:NO];

                                }
                            }else{
                                [NSTimer scheduledTimerWithTimeInterval:0.3f target:self selector:@selector(checkToys) userInfo:nil repeats:NO];

                            }
                        }else{
                            [NSTimer scheduledTimerWithTimeInterval:0.3f target:self selector:@selector(checkToys) userInfo:nil repeats:NO];

                        }
                    }else{
                        [NSTimer scheduledTimerWithTimeInterval:0.3f target:self selector:@selector(checkToys) userInfo:nil repeats:NO];

                    }
                }else{
                    [NSTimer scheduledTimerWithTimeInterval:0.3f target:self selector:@selector(checkToys) userInfo:nil repeats:NO];

                }
            }
        }else{
            [NSTimer scheduledTimerWithTimeInterval:0.3f target:self selector:@selector(checkToys) userInfo:nil repeats:NO];

        }
    }
    else{
        [NSTimer scheduledTimerWithTimeInterval:0.3f target:self selector:@selector(checkToys) userInfo:nil repeats:NO];
    }
}



@end
