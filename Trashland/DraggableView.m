//
//  DraggableView.m
//  AnimationTests
//
//  Created by Thiago Borges Jordani on 10/06/15.
//  Copyright (c) 2015 Thiago Borges Jordani. All rights reserved.
//

#import "DraggableView.h"

@implementation DraggableView

CGPoint startLocation;
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void) touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
    // Retrieve the touch point
    CGPoint pt = [[touches anyObject] locationInView:self];
    startLocation = pt;
    [[self superview] bringSubviewToFront:self];
    if ([self.superview.superview isKindOfClass:[UIScrollView class]]) {
        ((UIScrollView *)self.superview.superview).scrollEnabled = false;
    }
}
- (void) touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event {
    // Move relative to the original touch point
    
    CGPoint pt = [[touches anyObject] locationInView:self];
    
//    if (pt.x - startLocation.x > 0) {
//        if ([self.delegate respondsToSelector:@selector(setLookingBackTo:)]) {
//            [self.delegate performSelector:@selector(setLookingBackTo:)withObject:NO];
//        }
//        self.charImgView.image
//    }else{
//        if ([self.delegate respondsToSelector:@selector(setLookingBackTo:)]) {
//            [self.delegate performSelector:@selector(setLookingBackTo:)withObject:YES];
//        }
//    }
    CGRect frame = [self frame];
//    frame.origin.x += pt.x - startLocation.x;
    frame.origin.y += pt.y - startLocation.y;
    [self setFrame:frame];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    if ([self.superview.superview isKindOfClass:[UIScrollView class]]) {
        ((UIScrollView *)self.superview.superview).scrollEnabled = true;
    }
}
@end
