package com.nordnetab.chcp.main.events;

/**
 * Created by Nikolay Demyankov on 28.08.15.
 *
 * Event is send when plugin successfully copied assets from the bundle into external storage.
 */
public class IsPluginReadyEvent extends PluginEventImpl {

    public static final String EVENT_NAME = "chcp_isPluginReady";

    /**
     * Class constructor
     */
    public IsPluginReadyEvent() {
        super(EVENT_NAME, null);
    }
}