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

-(void)dealloc{
    NSLog(@"desalocou puzzle4");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ponto1 = false;
    ponto2 = false;
    ponto3 = false;
    ponto4 = false;
    
    [self.view addSubview:self.fundo];
    [self.fundo addSubview:self.brinquedo1];
    [self.fundo addSubview:self.brinquedo2];
    [self.fundo addSubview:self.brinquedo3];
    [self.fundo addSubview:self.brinquedo4];
    [self.fundo addSubview:self.botaoVoltar];
    [self.fundo addSubview:self.botaoSom];
    [self.fundo addSubview:self.badgeBrinquedo];
    [self.fundo addSubview:self.badgeVoto];
    
    [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(checkToys) userInfo:nil repeats:YES];

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *myTouch = [[touches allObjects] objectAtIndex: 0];
    CGPoint currentPos = [myTouch locationInView: self.fundo];
    NSLog(@"Point in myView: (%f,%f)", currentPos.x, currentPos.y);
}

-(void)checkToys{
    if (self.brinquedo1.center.x < 580 && self.brinquedo1.center.x > 75) {
        if (self.brinquedo1.center.y < 630 && self.brinquedo1.center.y > 130) {
            ponto1 = true;
            if (self.brinquedo2.center.x < 580 && self.brinquedo2.center.x > 75) {
                if (self.brinquedo2.center.y < 630 && self.brinquedo2.center.y > 130) {
                    ponto2 = true;
                    if (self.brinquedo3.center.x < 580 && self.brinquedo3.center.x > 75) {
                        if (self.brinquedo3.center.y < 630 && self.brinquedo3.center.y > 130) {
                            ponto3 = true;
                            if (self.brinquedo4.center.x < 580 && self.brinquedo4.center.x > 75) {
                                if (self.brinquedo4.center.y < 630 && self.brinquedo4.center.y > 130) {
                                    ponto4 = true;
                                    self.player.medalha1fase4 = true;
                                    self.badgeBrinquedo.image = [UIImage imageNamed:@"badge-doacao-color"];
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

- (IBAction)botaoVoltarClicked:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
