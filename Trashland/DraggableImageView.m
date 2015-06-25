//
//  DraggableImageView.m
//  Trashland
//
//  Created by Thiago Borges Jordani on 10/06/15.
//  Copyright (c) 2015 Thiago Borges Jordani. All rights reserved.
//

#import "DraggableImageView.h"

@implementation DraggableImageView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)dealloc{
    NSLog(@"removeu dragimageview");
}

-(void)morre{
    _delegate = nil;
}

- (void)touchesMoved:(NSSet *)set withEvent:(UIEvent *)event {
    CGPoint p = [[set anyObject] locationInView:self.superview];
    self.center = p;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if ([self.superview.superview isKindOfClass:[UIScrollView class]]) {
        ((UIScrollView *)self.superview.superview).scrollEnabled = false;
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    if ([self.superview.superview isKindOfClass:[UIScrollView class]]) {
        ((UIScrollView *)self.superview.superview).scrollEnabled = true;
    }
    if ([self.delegate respondsToSelector:@selector(dealWithMovement)]) {
        [self.delegate performSelector:@selector(dealWithMovement)];
    }
}
@end
