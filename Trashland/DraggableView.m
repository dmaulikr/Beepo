#import "DraggableView.h"

@implementation DraggableView

CGPoint startLocation;

- (instancetype)init{
    self = [super init];
    if (self) {
        self.allowHorizontalAxisMovement = true;
        self.allowVerticalAxisMovement = true;
    }
    return self;
}

- (void) touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
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
    if (self.allowHorizontalAxisMovement) {
        frame.origin.x += pt.x - startLocation.x;
    }
    if (self.allowVerticalAxisMovement) {
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
