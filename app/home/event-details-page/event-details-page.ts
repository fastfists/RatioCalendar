import { NavigatedData, Page } from "tns-core-modules/ui/page";
import { Event } from "../../shared/types";

export function onNavigatingTo(args: NavigatedData) {
    const page = <Page>args.object;
    page.bindingContext = <Event> args.context;
}

