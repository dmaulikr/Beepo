//
//  Phase2.m
//  Trashland
//
//  Created by Bruno Muniz Azevedo Filho on 6/15/15.
//  Copyright (c) 2015 Thiago Borges Jordani. All rights reserved.
//

#import "Phase2.h"

@implementation Phase2
-(void)viewDidLoad{
    [super viewDidLoad];
    _phaseScrollView.contentSize = CGSizeMake(_phaseBG.frame.size.width, _phaseBG.frame.size.height);
}



#pragma mark - Tree Buttons
- (IBAction)didClickTree1:(UIButton *)sender {
    _arvore1.image = [UIImage imageNamed:@"parque-03"];
    float xDiff = (888/2 - _arvore1.frame.size.width);
    float yDiff = (1070/2 - _arvore1.frame.size.height);
    NSLog(@"Original x: %f y: %f wid: %f hei: %f difX: %f difY: %f",_arvore1.frame.origin.x,_arvore1.frame.origin.y,_arvore1.frame.size.width,_arvore1.frame.size.height,xDiff,yDiff);
    _arvore1.frame = CGRectMake(_arvore1.frame.origin.x - xDiff, _arvore1.frame.origin.y - yDiff, 888/2, 1070/2);
    
    sender.userInteractionEnabled = NO;
    
}
- (IBAction)didClickTree2:(UIButton *)sender {
}
- (IBAction)didClickTree3:(UIButton *)sender {
}
- (IBAction)didClickTree4:(UIButton *)sender {
}
- (IBAction)didClickTree5:(UIButton *)sender {
}
@end
