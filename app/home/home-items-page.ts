import { View } from "tns-core-modules/ui/core/view";
import { SwipeGestureEventData } from "tns-core-modules/ui/gestures";
import { NavigatedData, Page } from "tns-core-modules/ui/page";

import { HomeViewModel } from "./home-view-model";
import { Event } from "../shared/types";

export function onNavigatingTo(args: NavigatedData) {
    const page = <Page>args.object;
    page.bindingContext = new HomeViewModel();
}

export function onEventSwipe(args: SwipeGestureEventData) {
    const view = <View>args.view;
    const page = <Page>view.page;
    const event = <Event>view.bindingContext;

    page.frame.navigate({
        moduleName: "home/event-details-page/event-details-page",
        context: event,
        animated: true,
        transition: {
            name: "slide",
            duration: 200,
            curve: "ease"
        }
    });
}
