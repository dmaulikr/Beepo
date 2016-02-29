#import "DraggableView.h"

@implementation DraggableView

CGPoint startLocation;

-(void)morre{
    _charImgView = nil;
    _delegate = nil;
}

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
    CGPoint pt = [[touches anyObject] locationInView:self];
    
    CGRect frame = [self frame];
    if (self.podeX) {
        frame.origin.x += pt.x - startLocation.x;
    }
    if (self.podeY) {
        frame.origin.y += pt.y - startLocation.y;
    }
    [self setFrame:frame];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    if ([self.superview.superview isKindOfClass:[UIScrollView class]]) {
        ((UIScrollView *)self.superview.superview).scrollEnabled = true;
    }
}
@end
