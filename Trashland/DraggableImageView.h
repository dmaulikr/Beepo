#import <UIKit/UIKit.h>

@protocol DraggableImageViewDelegate <NSObject>

- (void) applyPhisicsConcepts;
- (void) checkPostions;

@end

@interface DraggableImageView : UIImageView <UIDynamicItem>

@property (nonatomic, assign) id <DraggableImageViewDelegate> delegate;

@end
