package com.dataxad.flutter_mailer;

import androidx.core.content.FileProvider;

/**
 * Providing a custom {@code FileProvider} prevents manifest {@code <provider>} name collisions.
 *
 * <p>See <a href="https://developer.android.com/guide/topics/manifest/provider-element.html">...</a> for details.
 */
public class FlutterMailerFileProvider extends FileProvider {}