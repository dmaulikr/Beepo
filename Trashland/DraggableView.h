#import <UIKit/UIKit.h>

@protocol DraggableViewDelegate <NSObject>

- (void) checkPositions;

@end

@interface DraggableView : UIView

@property (nonatomic, assign) id <DraggableViewDelegate> delegate;

@property (weak, nonatomic) UIImageView* charImgView;
@property (nonatomic, assign) BOOL allowHorizontalAxisMovement;
@property (nonatomic, assign) BOOL allowVerticalAxisMovement;

@end
