#import "DraggableImageView.h"

@implementation DraggableImageView

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
    if ([_delegate respondsToSelector:@selector(applyPhisicsConcepts)]) {
        [_delegate applyPhisicsConcepts];
    }
    if ([_delegate respondsToSelector:@selector(checkPostions)]) {
        [_delegate checkPostions];
    }
}
@end
