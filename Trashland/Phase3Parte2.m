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
    if (self.viewCarro1.center.y < 260) {
        self.viewCarro1.podeY = false;
    }
    if (self.viewCarro2.center.y > 540) {
        self.viewCarro2.podeY = false;
    }
    if (self.viewCarro1.center.y < 260 && self.viewCarro2.center.y > 540) {
        
         [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(escolhaDeFases) userInfo:nil repeats:NO];
        
        [UIView animateWithDuration:4 delay:0.0 options:UIViewAnimationCurveEaseIn animations:^{
                self.ambulancia.frame = CGRectMake(1200, self.ambulancia.frame.origin.y, self.ambulancia.frame.size.width, self.ambulancia.frame.size.height); } completion:nil];
    }
    else{
        [NSTimer scheduledTimerWithTimeInterval:0.1f target:self selector:@selector(checkWayFree) userInfo:nil repeats:NO];
    }
}


-(void)escolhaDeFases{
                PhasesChoose *game = [self.storyboard instantiateViewControllerWithIdentifier:@"PhasesChooseVC"];
            [game setModalPresentationStyle:UIModalPresentationFullScreen];
            self.player.medalha2fase3 = true;
    
            game.player = self.player;
            [self presentViewController:game animated:YES completion:nil];
}

@end
