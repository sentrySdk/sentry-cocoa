#if !TARGET_OS_WATCH
#    import "SentryReachability.h"
#endif // !TARGET_OS_WATCH

#import "SentryDefines.h"
#import "SentryProfilingConditionals.h"

#if SENTRY_HAS_METRIC_KIT
#    import "SentryMetricKitIntegration.h"
#endif // SENTRY_HAS_METRIC_KIT

#if SENTRY_HAS_UIKIT
#    import "MockUIScene.h"
#    import "SentryFramesTracker+TestInit.h"
#    import "SentryUIApplication+Private.h"
#    import "SentryUIApplication.h"
#    import "SentryUIDeviceWrapper.h"
#    import "SentryUIEventTracker.h"
#    import "SentryUIEventTrackerTransactionMode.h"
#    import "SentryUIEventTrackingIntegration.h"
#    import "SentryUIViewControllerPerformanceTracker.h"
#    import "SentryUIViewControllerSwizzling+Test.h"
#    import "SentryUIViewControllerSwizzling.h"
#    import "UIViewController+Sentry.h"
#endif // SENTRY_HAS_UIKIT

#if SENTRY_TARGET_PROFILING_SUPPORTED
#    import "SentryMetricProfiler.h"
#    import "SentryProfiler+Private.h"
#    import "SentryProfiler+Test.h"
#    import "SentryProfilerMocksSwiftCompatible.h"
#    import "SentryProfilerState.h"
#endif // SENTRY_TARGET_PROFILING_SUPPORTED

#import "NSData+Sentry.h"
#import "NSData+SentryCompression.h"
#import "NSDate+SentryExtras.h"
#import "NSLocale+Sentry.h"
#import "NSMutableDictionary+Sentry.h"
#import "NSURLProtocolSwizzle.h"
#import "PrivateSentrySDKOnly.h"
#import "SentryANRTracker.h"
#import "SentryANRTrackingIntegration.h"
#import "SentryAppStartMeasurement.h"
#import "SentryAppStartTracker.h"
#import "SentryAppStartTrackingIntegration.h"
#import "SentryAppState.h"
#import "SentryAppStateManager.h"
#import "SentryAttachment+Private.h"
#import "SentryAutoBreadcrumbTrackingIntegration+Test.h"
#import "SentryAutoBreadcrumbTrackingIntegration.h"
#import "SentryAutoSessionTrackingIntegration.h"
#import "SentryBaggage.h"
#import "SentryBooleanSerialization.h"
#import "SentryBreadcrumbDelegate.h"
#import "SentryBreadcrumbTracker.h"
#import "SentryByteCountFormatter.h"
#import "SentryClassRegistrator.h"
#import "SentryClient+Private.h"
#import "SentryClient+TestInit.h"
#import "SentryClientReport.h"
#import "SentryConcurrentRateLimitsDictionary.h"
#import "SentryCoreDataSwizzling.h"
#import "SentryCoreDataTracker+Test.h"
#import "SentryCoreDataTrackingIntegration.h"
#import "SentryCrashBinaryImageProvider.h"
#import "SentryCrashC.h"
#import "SentryCrashDebug.h"
#import "SentryCrashDefaultBinaryImageProvider.h"
#import "SentryCrashDefaultMachineContextWrapper.h"
#import "SentryCrashDoctor.h"
#import "SentryCrashInstallationReporter.h"
#import "SentryCrashIntegration+TestInit.h"
#import "SentryCrashIntegration.h"
#import "SentryCrashJSONCodecObjC.h"
#import "SentryCrashMachineContext.h"
#import "SentryCrashMonitor.h"
#import "SentryCrashMonitorContext.h"
#import "SentryCrashMonitor_AppState.h"
#import "SentryCrashMonitor_System.h"
#import "SentryCrashReport.h"
#import "SentryCrashReportSink.h"
#import "SentryCrashReportStore.h"
#import "SentryCrashScopeObserver.h"
#import "SentryCrashStackEntryMapper.h"
#import "SentryCrashUUIDConversion.h"
#import "SentryCrashWrapper.h"
#import "SentryCurrentDateProvider.h"
#import "SentryDataCategory.h"
#import "SentryDataCategoryMapper.h"
#import "SentryDateUtil.h"
#import "SentryDebugImageProvider+TestInit.h"
#import "SentryDebugImageProvider.h"
#import "SentryDebugMeta.h"
#import "SentryDefaultObjCRuntimeWrapper.h"
#import "SentryDefaultRateLimits.h"
#import "SentryDependencyContainer.h"
#import "SentryDiscardReason.h"
#import "SentryDiscardReasonMapper.h"
#import "SentryDiscardedEvent.h"
#import "SentryDispatchQueueWrapper.h"
#import "SentryDisplayLinkWrapper.h"
#import "SentryDsn.h"
#import "SentryEnvelope+Private.h"
#import "SentryEnvelopeItemType.h"
#import "SentryEnvelopeRateLimit.h"
#import "SentryEvent+Private.h"
#import "SentryFileContents.h"
#import "SentryFileIOTrackingIntegration.h"
#import "SentryFileManager+TestProperties.h"
#import "SentryFileManager.h"
#import "SentryFormatter.h"
#import "SentryFrame.h"
#import "SentryFrameRemover.h"
#import "SentryFramesTrackingIntegration.h"
#import "SentryGlobalEventProcessor.h"
#import "SentryHttpDateParser.h"
#import "SentryHttpStatusCodeRange+Private.h"
#import "SentryHttpTransport.h"
#import "SentryHub+Private.h"
#import "SentryHub+Test.h"
#import "SentryId.h"
#import "SentryInAppLogic.h"
#import "SentryInitializeForGettingSubclassesNotCalled.h"
#import "SentryInstallation.h"
#import "SentryInternalNotificationNames.h"
#import "SentryLevelMapper.h"
#import "SentryLog+TestInit.h"
#import "SentryLog.h"
#import "SentryLogOutput.h"
#import "SentryMechanism.h"
#import "SentryMechanismMeta.h"
#import "SentryMeta.h"
#import "SentryMigrateSessionInit.h"
#import "SentryNSDataTracker.h"
#import "SentryNSError.h"
#import "SentryNSNotificationCenterWrapper.h"
#import "SentryNSProcessInfoWrapper.h"
#import "SentryNSTimerFactory.h"
#import "SentryNSURLRequest.h"
#import "SentryNSURLRequestBuilder.h"
#import "SentryNSURLSessionTaskSearch.h"
#import "SentryNetworkTracker.h"
#import "SentryNetworkTrackingIntegration.h"
#import "SentryNoOpSpan.h"
#import "SentryObjCRuntimeWrapper.h"
#import "SentryOptions+HybridSDKs.h"
#import "SentryOptions+Private.h"
#import "SentryPerformanceTracker.h"
#import "SentryPerformanceTrackingIntegration.h"
#import "SentryPredicateDescriptor.h"
#import "SentryQueueableRequestManager.h"
#import "SentryRandom.h"
#import "SentryRateLimitParser.h"
#import "SentryRateLimits.h"
#import "SentryReachability.h"
#import "SentryRetryAfterHeaderParser.h"
#import "SentrySDK+Private.h"
#import "SentrySDK+Tests.h"
#import "SentryScope+Private.h"
#import "SentryScopeObserver.h"
#import "SentryScopeSyncC.h"
#import "SentryScreenFrames.h"
#import "SentryScreenshot.h"
#import "SentryScreenshotIntegration.h"
#import "SentrySdkInfo.h"

#import "SentrySerialization.h"
#import "SentrySession+Private.h"
#import "SentrySessionTracker.h"
#import "SentrySpan.h"
#import "SentrySpanId.h"
#import "SentrySpanOperations.h"
#import "SentryStacktrace.h"
#import "SentryStacktraceBuilder.h"
#import "SentrySubClassFinder.h"
#import "SentrySwizzleWrapper.h"
#import "SentrySysctl.h"
#import "SentrySystemEventBreadcrumbs.h"
#import "SentrySystemWrapper.h"
#import "SentryTestIntegration.h"
#import "SentryTestObjCRuntimeWrapper.h"
#import "SentryThread.h"
#import "SentryThreadInspector.h"
#import "SentryThreadWrapper.h"
#import "SentryTime.h"
#import "SentryTraceContext.h"
#import "SentryTracer+Private.h"
#import "SentryTracer+Test.h"
#import "SentryTransaction.h"
#import "SentryTransactionContext+Private.h"
#import "SentryTransport.h"
#import "SentryTransportAdapter.h"
#import "SentryTransportFactory.h"
#import "SentryUserFeedback.h"
#import "SentryViewHierarchy.h"
#import "SentryViewHierarchyIntegration.h"
#import "SentryWatchdogTerminationLogic.h"
#import "SentryWatchdogTerminationScopeObserver.h"
#import "SentryWatchdogTerminationTracker.h"
#import "SentryWatchdogTerminationTrackingIntegration.h"
#import "TestNSURLRequestBuilder.h"
#import "TestSentryCrashWrapper.h"
#import "TestSentrySpan.h"
#import "URLSessionTaskMock.h"
@import SentryPrivate;
#import "SentryBinaryImageCache+Private.h"
#import "SentryCrashBinaryImageCache.h"
#import "SentryDispatchFactory.h"
#import "SentryDispatchSourceWrapper.h"
#import "SentryEnvelopeAttachmentHeader.h"
#import "SentryExtraContextProvider.h"
#import "SentryMeasurementValue.h"
#import "SentryNSProcessInfoWrapper.h"
#import "SentryPerformanceTracker+Testing.h"
#import "SentryPropagationContext.h"
#import "SentrySampleDecision+Private.h"
#import "SentrySpanOperations.h"
#import "SentryTimeToDisplayTracker.h"
#import "SentryTracerConfiguration.h"
#import "TestSentryViewHierarchy.h"