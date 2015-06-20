//
//  Phase3Parte2.m
//  Trashland
//
//  Created by Bruno Muniz Azevedo Filho on 6/18/15.
//  Copyright (c) 2015 Thiago Borges Jordani. All rights reserved.
//

#import "Phase3Parte2.h"
#import "DraggableView.h"
#import "PhasesChoose.h"

@interface Phase3Parte2 ()

@end

@implementation Phase3Parte2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _viewCarro1.podeY = YES;
    _viewCarro2.podeY = YES;
    [self checkWayFree];
}

-(void)checkWayFree{
    if (true) {
      //ANIMACAO DA PASSAGEM DA AMBULANCIA
        //and then...
        
        PhasesChoose *game = [self.storyboard instantiateViewControllerWithIdentifier:@"PhasesChooseVC"];
        [game setModalPresentationStyle:UIModalPresentationFullScreen];
        self.player.medalha2fase3 = true;
        game.player = self.player;
        [self presentViewController:game animated:NO completion:nil];
    }
    else{
        [NSTimer scheduledTimerWithTimeInterval:0.3f target:self selector:@selector(checkWayFree) userInfo:nil repeats:NO];
    }
}

@end
