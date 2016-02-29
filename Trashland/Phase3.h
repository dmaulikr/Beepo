#import <UIKit/UIKit.h>
#import "DraggableView.h"

@interface Phase3 : UIViewController

@property (nonatomic) IBOutlet UIImageView* fundo;
@property (nonatomic) IBOutlet UIView* viewBeepo;
@property (nonatomic) IBOutlet UIImageView* imageBeepo;
@property (nonatomic) IBOutlet UIImageView* imageSombraBeepo;
@property (nonatomic) IBOutlet DraggableView* viewVelha;
@property (nonatomic) IBOutlet UIImageView* imageVelha;
@property (nonatomic) IBOutlet UIImageView* imageSombraVelha;
@property (nonatomic) IBOutlet UIView* carro1;
@property (nonatomic) IBOutlet UIView* carro2;
@property (nonatomic) UIView* barrier;
@property (nonatomic) IBOutlet UIButton* botaoVoltar;
@property (nonatomic) IBOutlet UIButton* botaoSom;
@property (nonatomic) IBOutlet UIImageView* badgeIdoso;
@property (nonatomic) IBOutlet UIImageView* badgeTransito;
@property (strong, nonatomic) UIViewController *popUpView;
@property (nonatomic) IBOutlet UIImageView* sinalVerde;

@end
