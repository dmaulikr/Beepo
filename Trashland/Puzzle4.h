#import <UIKit/UIKit.h>
#import "DraggableImageView.h"

@interface Puzzle4 : UIViewController

@property (nonatomic) IBOutlet UIImageView* fundo;
@property (weak, nonatomic) IBOutlet UILabel *txtLabel;
@property (nonatomic) IBOutlet DraggableImageView* brinquedo1;
@property (nonatomic) IBOutlet DraggableImageView* brinquedo2;
@property (nonatomic) IBOutlet DraggableImageView* brinquedo3;
@property (nonatomic) IBOutlet DraggableImageView* brinquedo4;
@property (nonatomic) IBOutlet UIButton* botaoVoltar;
@property (nonatomic) IBOutlet UIButton* botaoSom;
@property (nonatomic) IBOutlet UIImageView* badgeBrinquedo;
@property (nonatomic) IBOutlet UIImageView* badgeVoto;
@property (strong, nonatomic) UIViewController *popUpView;

@end
