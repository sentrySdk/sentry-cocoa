#import "SentryDefines.h"
#import <UIKit/UIKit.h>


#if SENTRY_HAS_UIKIT

NS_ASSUME_NONNULL_BEGIN

@interface
UIViewController (Sentry)

/**
 * An array of view controllers that are descendants, meaning children, grandchildren, ... , of the
 * current view controller.
 */
@property (nonatomic, readonly, strong)
    NSArray<UIViewController *> *sentry_descendantViewControllers;

@end

NS_ASSUME_NONNULL_END

#endif // SENTRY_HAS_UIKIT

